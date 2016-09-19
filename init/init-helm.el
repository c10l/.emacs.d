(use-package helm-config
  :ensure helm
  :config
  (progn
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (helm-mode 1)
    ))

(provide 'init-helm)
