(use-package projectile
  :commands (all-the-icons-icon-for-dir all-the-icons-icon-for-file)
  :ensure
  :config
  (progn
    (use-package helm-projectile :ensure)
    (use-package neotree :ensure)
    (projectile-mode 1)
    (helm-projectile-on)
    (defun neotree-project-dir ()
      "Open NeoTree using the git root."
      (interactive)
      (let ((project-dir (projectile-project-root))
            (file-name (buffer-file-name)))
        (if project-dir
            (if (neotree-toggle)
                (progn
                  (neotree-dir project-dir)
                  (neotree-find file-name)))
          (message "Could not find git project root."))))
    (global-set-key [f8] 'neotree-project-dir)
    ))

(provide 'init-projectile)
