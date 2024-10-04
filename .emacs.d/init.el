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
(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
   "f" 'find-file
   "b" 'switch-to-buffer
   "k" 'kill-buffer))


;; Basic UI customizations
(menu-bar-mode -1)              ; Disable menu bar
(tool-bar-mode -1)              ; Disable tool bar
(scroll-bar-mode -1)            ; Disable scroll bar
(setq inhibit-startup-message t) ; Disable the startup message
(setq visible-bell t)            ; Visual bell instead of sound
(global-hl-line-mode 1)          ; Highlight current line
(column-number-mode 1)           ; Show column number in the mode line

;; Line numbers in all programming-related modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Auto-install useful packages
(use-package ivy                 ; Enhanced completion framework
  :config (ivy-mode 1))

(use-package magit               ; Git integration
  :bind ("C-x g" . magit-status))

;; Better default for saving backup files (avoids clutter in working directory)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Customize keybindings (optional)
(global-set-key (kbd "C-x C-b") 'ibuffer) ; Better buffer list

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-leader evil-surround evil-commentary evil magit ivy gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
