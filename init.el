;;; -*- lexical-binding: t -*-


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)
(progn
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))

(defconst base-path
  (expand-file-name "init" user-emacs-directory))
(add-to-list 'load-path base-path)

(make-directory
 (setq tmp-local-dir (expand-file-name "tmp" user-emacs-directory)) t)

(dolist (project (directory-files base-path t "\\w+"))
  (when (file-directory-p project)
	(add-to-list 'load-path project)))

(when (require 'server nil t)
  (unless (server-running-p)
    (server-start)))

(defconst *is-mac*   (eq system-type 'darwin)              "is macos")
(defconst *is-cocoa* (and *is-mac* (eq window-system 'ns)) "is cocoa")

(require 'init-packages)

;; Install Missing Packages
(install-missing-packages
 '(ace-window
   darkokai-theme
   beacon
   flycheck-pos-tip
))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(progn
  (dolist (r '(init-go
	       ))
    (funcall 'require r)))

(when *is-mac*
  (require 'init-mac))

(require 'init-defaults)
(require 'init-appearance)
(require 'init-keybindings)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(setq custom-file (concat base-path "custom.el"))
(load custom-file 'noerror)

(when after-init-time
  (run-hooks 'after-init-hook))
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)





; (ac-config-default)
;
; (global-flycheck-mode)
;
; ;; Golang stuff
; (setenv "GOPATH" "/Users/cassiano/Projects/goworkspace")
; (add-to-list 'load-path "/Users/cassiano/Projects/goworkspace/src/github.com/dougm/goflymake")
; (require 'go-flycheck)
; (require 'go-eldoc)
; (with-eval-after-load 'go-mode
;   (require 'go-autocomplete))
; (defun go-mode-setup ()
;   (go-eldoc-setup))
; (defun my-go-mode-hook ()
;   ; Use goimports instead of go-fmt
;   (setq gofmt-command "goimports")
;   ; Call go fmt before saving
;   (add-hook 'before-save-hook 'gofmt-before-save)
;   ; godef jump key binding
;   (local-set-key (kbd "M-.") 'godef-jump)
;   ; Auto-complete
;   (auto-complete-mode 1))
; (add-hook 'go-mode-hook 'my-go-mode-hook)
; (set-face-attribute 'go-eldoc-gocode
; 		    "/Users/cassiano/Projects/goworkspace/bin/gocode")
;
; ;; Set PATH from shell
; (defun set-exec-path-from-shell-PATH ()
;   (let ((path-from-shell (replace-regexp-in-string
;                           "[ \t\n]*$"
;                           ""
;                           (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;     (setenv "PATH" path-from-shell)
;     (setq eshell-path-env path-from-shell) ; for eshell users
;     (setq exec-path (split-string path-from-shell path-separator))))
;
; (when window-system (set-exec-path-from-shell-PATH))
;
