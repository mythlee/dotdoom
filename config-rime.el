;;; ../dotdoom/config-rime.el -*- lexical-binding: t; -*-

(use-package rime
 :custom
 (default-input-method "rime")
 (rime-librime-root "~/.emacs.d/librime/dist"))

;; (use-package rime
;;   :straight (rime :type git
;;                   :host github
;;                   :repo "DogLooksGood/emacs-rime"
;;                   :files ("*.el" "Makefile" "lib.c"))
;;   :custom
;;   (default-input-method "rime")
;;   (rime-librime-root "~/.emacs.d/librime/dist"))
