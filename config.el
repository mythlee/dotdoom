;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hui Li"
      user-mail-address "mythlee@ustc.edu.cn")

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
(setq doom-theme 'doom-zenburn)

(add-to-list 'term-file-aliases
    '("tmux-256color" ."xterm-direct"))

(xterm-mouse-mode 1)

;; change esc to jj in evil mode

(key-chord-mode 1)
;;bind the escape to jj
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
;;and while we're at it bind jk to the indispensable insert-normal mode (ctrl-o)
(key-chord-define evil-insert-state-map "jk" 'evil-execute-in-normal-state)

(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "stroustrup")
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline, but not hungry-delete
  (c-toggle-auto-newline 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (c-mode . "stroustrup")
                        (c++-mode . "stroustrup")
                        (cuda-mode . "stroustrup")))



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

;; youdao
;;

(require 'youdao-dictionary)
(global-set-key "\C-xy" 'youdao-dictionary-search-at-point+)

;; pyim config
;;
;;
;;(add-load-path! "~/.doom.d")

(load! "./config-pyim")

(server-start)
