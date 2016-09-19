(install-missing-packages '(go-mode
                            auto-complete
                            go-autocomplete
                            go-eldoc
                            gotest
                            go-errcheck
                            ))
(setenv "GOPATH" "/Users/cassiano/Projects/goworkspace")
(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :init
  (progn
    (use-package auto-complete)
    (use-package go-eldoc)
    (use-package go-autocomplete)
    (use-package go-flymake)
    (use-package go-flycheck)
    (add-hook 'go-mode-hook
              (lambda ()
                (setq gofmt-command "goimports")

                (go-set-project)

                (auto-complete-mode)
                (go-eldoc-setup)
                (add-hook 'before-save-hook 'gofmt-before-save)
                (setq tab-width 4)))))

(provide 'init-go)
