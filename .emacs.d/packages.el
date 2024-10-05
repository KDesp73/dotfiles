(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Ensure package archives are up to date
(unless package-archive-contents
  (package-refresh-contents))

;; Install `use-package` for easier package management
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Install and enable the Gruber Darker theme
; (use-package gruber-darker-theme
;   :ensure t
;   :config
;   (load-theme 'gruber-darker t))

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t))

;; Auto-install useful packages
(use-package ivy                 ; Enhanced completion framework
  :config (ivy-mode 1))

(use-package magit               ; Git integration
  :bind ("C-x g" . magit-status))
