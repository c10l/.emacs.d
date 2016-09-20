(use-package go-mode
  :ensure
  :mode ("\\.go\\'" . go-mode)
  :init
  (progn
    (use-package auto-complete   :ensure)
    (use-package go-autocomplete :ensure)
    (use-package go-eldoc        :ensure)
    (use-package gotest          :ensure)
    (use-package go-errcheck     :ensure)
    (use-package flycheck        :ensure)
    (set-face-attribute 'go-eldoc-gocode
                        "/Users/cassiano/Projects/goworkspace/bin/gocode")
    (add-hook 'go-mode-hook
              (lambda ()
                (setq gofmt-command "goimports")

                (go-set-project)

                (flycheck-mode)
                (auto-complete-mode)
                (go-eldoc-setup)
                (add-hook 'before-save-hook 'gofmt-before-save)
                (setq tab-width 4)))))

(provide 'init-go)
