;;; ../dotdoom/config-org.el -*- lexical-binding: t; -*-

;(require 'ox-reveal)

(setq Org-Reveal-root "file:///~/reveal.js")

(require 'ox-pandoc)
(require 'ox-latex)

;; (set-face-attribute
;;  'default nil
;;  :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 12.5))
;; (if (display-graphic-p)
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font
;;    (frame-parameter nil 'font)
;;    charset
;;    (font-spec :name "-*-WenQuanYi Micro Hei Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;               :weight 'normal
;;               :slant 'normal
;;               :size 14.5))))

;; ;(cnfonts-enable)
;; (setq cnfonts-use-face-font-rescale t)

(eval-after-load "ox-latex"

  ;; update the list of LaTeX classes and associated header (encoding, etc.)
  ;; and structure
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

;;(setq org-latex-listings t)

(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-src-fontify-natively t)
;;(org-babel-do-load-languages
;; 'org-babel-load-languages
;; '((C++ . t)
;;   ))
;;
;;

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C++ . t)
   (R . t)
   (Python . t)))

(defadvice org-html-paragraph (before fsh-org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let ((fixed-contents)
        (orig-contents (ad-get-arg 1))
        (reg-han "[[:multibyte:]]"))
    (setq fixed-contents (replace-regexp-in-string
                          ;; 这一行是匹配上一行末和下一行头都是中文的情况, 但是这样的话遇上"中文\nenglish"就仍然有空格
                          ;; (concat "\\(" reg-han "\\) *\n *\\(" reg-han "\\)")
                          (concat "\\(" reg-han "\\) *\n *")
                          "\\1" orig-contents))
    (ad-set-arg 1 fixed-contents)
    ))
