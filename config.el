;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hui Li"
      user-mail-address "mythlee@ustc.edu.cn")

(pushnew! initial-frame-alist '(width . 120) '(height . 40))
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-zenburn)

;;(setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-one)
(add-to-list 'term-file-aliases
    '("tmux-256color" ."xterm-direct"))



(xterm-mouse-mode 1)

;; change esc to jj in evil mode

(key-chord-mode 1)
;;bind the escape to jj
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
;;and while we're at it bind jk to the indispensable insert-normal mode (ctrl-o)
(key-chord-define evil-insert-state-map "jk" 'evil-execute-in-normal-state)

;; custom keymap
;;

(define-key evil-normal-state-map "Q" 'fill-paragraph)



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(global-visual-line-mode)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;;(add-load-path! "../emacs-reveal")

;; youdao
;;

(require 'youdao-dictionary)
(global-set-key "\C-xy" 'youdao-dictionary-search-at-point+)

;; pyim config
;;
;;
;;(add-load-path! "~/.doom.d")

(load! "./config-pyim")
; ;;(load! "./config-rime")

(load! "./config-edit")

(load! "./config-tex")

(load! "./config-org")

(load! "./config-prog")

;;(load! "./config-reveal")

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;(add-hook 'window-setup-hook #'toggle-frame-maximized)
;;(add-hook 'window-setup-hook #'toggle-frame-fullscreen)
;;(when window-system (set-frame-size (selected-frame) 160 50))

(setq doom-font (font-spec :family "Menlo" :size 15 :weight 'medium)
      doom-unicode-font (font-spec :family "monospace"))
;;(setq doom-font (font-spec :family " :size 14 :weight 'semi-light)
;;      doom-unicode-font (font-spec :family "monospace"))
(display-time)
(server-start)
