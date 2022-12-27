;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(setq package-list '())

(require 'package)

;; Prefer GNU ELPA > MELPA (fallback)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA" . 5)))

(setq package-enable-at-startup nil)

(package-initialize)

(defun init-package-bootstrap ()
  (unless package-archive-contents
    (package-refresh-contents))

  (dolist (package init-package-list)
    (unless (package-installed-p package)
      (package-install package))))

(provide 'init_b-elpa-melpa)
