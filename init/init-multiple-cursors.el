(use-package multiple-cursors
  :ensure
  :init
  (progn
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-l") 'mc/mark-all-like-this)))

(provide 'init-multiple-cursors)
