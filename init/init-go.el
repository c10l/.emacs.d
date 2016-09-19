(install-missing-packages '(go-mode
                            auto-complete
                            go-autocomplete
                            go-eldoc
                            gotest
                            go-errcheck
                            flycheck
                            ))
(setenv "GOPATH" "/Users/cassiano/Projects/goworkspace")
(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :init
  (progn
    (use-package auto-complete)
    (use-package go-eldoc)
    (use-package go-autocomplete)
    (use-package flycheck)
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
