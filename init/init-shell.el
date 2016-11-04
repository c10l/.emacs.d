(defun setup-sh-mode ()
  "My own personal preferences for `sh-mode'.

This is a custom function that sets up the parameters I usually
prefer for `sh-mode'.  It is automatically added to
`sh-mode-hook', but is can also be called interactively."
  (interactive)
  (setq sh-basic-offset 2
        sh-indentation 2))
(add-hook 'sh-mode-hook 'setup-sh-mode)

(provide 'init-shell)
