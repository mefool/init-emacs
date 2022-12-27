;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'package-list 'magit)

(defun magit-hook ()
  (require 'magit)
  (setq magit-repository-directories '(("~/repos" . 1)))

  (unless (or (fboundp 'helm-mode)
              (fboundp 'ivy-mode))
    (setq magit-completing-read-function 'magit-ido-completing-read)))

(add-hook 'after-init-hook 'magit-hook)

(provide 'init_c-magit)
