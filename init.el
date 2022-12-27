;;; -*- lexical-binding: t; no-byte-compile: t; -*-

;; configuration -- uncomment desired layers => C-x C-s => M-x init-reconfigure

(setq init-layers '(
    init_a-startup
    init_a-performance
    init_a-better-defaults
    spartan-binds-global
    init_a-environment
    init_a-theme

    init_b-elpa-melpa ; required by layers below
    init_c-ido
    init_c-magit

    init_dev-rust

    ;; DONE spartan-ido
    ;; spartan-flymake
    ;; spartan-projectile
    ;; spartan-evil
    ;; spartan-kill-ring
    ;; spartan-crux
    ;; spartan-webpaste
    ;; spartan-shell
    ;; DONE spartan-emacs-nw
    ;; spartan-vterm
    ;; DONE ? spartan-magit
    ;; spartan-eglot
    ;; spartan-lisp
    ;; spartan-c
    ;; spartan-python
    ;; spartan-terraform
    ;; spartan-nix
    ;; spartan-nginx
    ;; spartan-systemd
    ;; spartan-json
    ;; spartan-yaml
    ;; spartan-xml
    ;; spartan-javascript
    ;; spartan-ruby
    ;; DONE spartan-rust
    ;; spartan-go
    ;; spartan-solidity
    ))

;; init-layers

(add-to-list 'load-path (concat user-emacs-directory "init-layers"))

(dolist (layer init-layers)
    (require layer))

;; install third party packages

(with-eval-after-load 'init-elpa-melpa
    (init-package-bootstrap))

;; M-x customize

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
    (load-file custom-file))

;; init.d/

(setq init-lisp-d (concat user-emacs-directory "init.d"))

(defun init-user-local-hook ()
    (when (file-directory-p init-lisp-d)
    (dolist (file (directory-files init-lisp-d nil "^.*\.el$"))
        (load-file (concat init-lisp-d "/" file)))))

(add-hook 'emacs-startup-hook 'init-user-local-hook)

;; M-x init-reconfigure

(defun init-reconfigure ()
    (interactive)
    (load-file user-init-file)
    (run-hooks 'after-init-hook
               'emacs-startup-hook))

;;; init.el ends here
