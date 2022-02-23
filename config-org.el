;;; ../dotdoom/config-org.el -*- lexical-binding: t; -*-

(require 'ox-reveal)

(setq Org-Reveal-root "file:///~/reveal.js")

(require 'ox-pandoc)

(set-face-attribute
 'default nil
 :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 12.5))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-*-WenQuanYi Micro Hei Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 14.5)))

;(cnfonts-enable)
(setq cnfonts-use-face-font-rescale t)
