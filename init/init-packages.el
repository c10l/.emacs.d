(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(package-install 'use-package)
(require 'use-package)

(provide 'init-packages)
