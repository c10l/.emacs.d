(use-package ace-jump-mode
  :ensure
  :init
  (progn
    (autoload
      'ace-jump-mode
      "ace-jump-mode"
      "Emacs quick move minor mode"
      t)
    ;; you can select the key you prefer to
    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
    ))

(provide 'init-ace-jump-mode)
