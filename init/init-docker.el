(use-package dockerfile-mode
  :ensure
  :config
  (progn
    (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
    ))

(provide 'init-docker)
