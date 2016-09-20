;; ace-window
(global-set-key (kbd "M-p") 'ace-window)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-l") 'mc/mark-all-like-this)))

(provide 'tail-keybindings)
