;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'package-list 'rust-mode)

(when (executable-find "rust-analyzer")
        (with-eval-after-load 'eglot
          (add-hook 'rust-mode-hook 'eglot-ensure)))

(with-eval-after-load 'rust-mode
  (define-key rust-mode-map (kbd "M-m rr") 'rust-run))

(provide 'init_dev-rust)
