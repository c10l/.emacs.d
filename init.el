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

(require 'head-packages)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(progn
  (dolist (r '(init-go
               init-multiple-cursors
               init-puppet
               init-helm
               init-ace-jump-mode
               init-projectile
	       ))
    (funcall 'require r)))

(when *is-mac*
  (require 'tail-mac))

(require 'tail-defaults)
(require 'tail-appearance)
(require 'tail-keybindings)

(setq custom-file (concat base-path "custom.el"))
(load custom-file 'noerror)

(when after-init-time
  (run-hooks 'after-init-hook))
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
