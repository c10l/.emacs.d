(use-package markdown-mode
  :ensure
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
  ;; :config
  ;; (progn
    ;; (use-package mkdown
    ;;   :ensure t
    ;;   :init (setq markdown-css-path mkdown-css-file-name))))

(use-package flymd
  :ensure t)

(provide 'init-markdown)
