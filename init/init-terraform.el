(use-package terraform-mode
  :ensure
  :mode (("\\.tf$" . terraform-mode))
  :config
  (progn
    (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
   ))

(provide 'init-terraform)
