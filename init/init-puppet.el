(use-package puppet-mode
  :ensure
  :mode (("\\.pp$" . puppet-mode))
  :config
  (progn
    (use-package flymake-puppet :ensure)
    (add-hook 'puppet-mode
              (lambda ()
                (add-hook 'before-save-hook 'delete-trailing-whitespace)))))

(provide 'init-puppet)
