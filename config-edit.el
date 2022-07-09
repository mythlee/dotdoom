;;; ../dotdoom/config-edit.el -*- lexical-binding: t; -*-

(require 'sis)
(use-package! sis
  ;; :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))
  :config
  ;; For MacOS
  (setq sis-default-cursor-color "green yellow" ; 英文光标色
        sis-other-cursor-color "#FFBB00"        ; 中文光标色
        ;; sis-inline-tighten-head-rule 'all ; 删除头部空格，默认1，删除一个空格，1/0/'all
        sis-inline-tighten-tail-rule 'all ; 删除尾部空格，默认1，删除一个空格，1/0/'all
        sis-inline-with-english t         ; 默认是t, 中文context下输入<spc>进入内联英文
        ;; sis-inline-with-other t
        )
  (setq sis-english-source "com.apple.keylayout.ABC")
  (sis-ism-lazyman-config

   ;; English input source may be: "ABC", "US" or another one.
   ;; "com.apple.keylayout.ABC"
   "com.apple.keylayout.ABC"

   ;; Other language input source: "rime", "sogou" or another one.
   ;; "im.rime.inputmethod.Squirrel.Rime"
   "com.sogou.inputmethod.sogou.pinyin" 'macsim)
   ;;"pyim")
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )
(push "<ESC>" sis-prefix-override-keys)


(use-package! evil-pinyin
  :config
  (evil-select-search-module 'evil-search-module 'evil-search)
  (global-evil-pinyin-mode t))

(global-set-key "\C-\\" 'sis-switch)

;; (sis-ism-lazyman-config
;;  "com.apple.keylayout.US"
;;  "com.sogou.inputmethod.sogou.pinyin")
;
