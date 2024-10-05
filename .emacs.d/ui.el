;; Basic UI customizations
(menu-bar-mode -1)              ; Disable menu bar
(tool-bar-mode -1)              ; Disable tool bar
(scroll-bar-mode -1)            ; Disable scroll bar
(setq inhibit-startup-message t) ; Disable the startup message
(setq visible-bell t)            ; Visual bell instead of sound
(global-hl-line-mode 1)          ; Highlight current line
(column-number-mode 1)           ; Show column number in the mode line
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Line numbers in all programming-related modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
