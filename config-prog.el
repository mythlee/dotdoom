;;; ../dotdoom/config-prog.el -*- lexical-binding: t; -*-

(doom! :lang
       python
       cc
       )

(add-hook! python-mode
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--pylab"))

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

