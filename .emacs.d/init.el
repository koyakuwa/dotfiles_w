;;; cask

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/cask/cask.el")
(cask-initialize)
;;(require 'monokai-theme)
;;(load-theme 'monokai t)

;;; init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(global-set-key [M-kanji] 'ignore)
(global-set-key [kanji] 'ignore)

(set-face-attribute 'default nil :family "Myrica M" :height 110)
;(set-face-attribute 'default nil :family "Consolas" :height 104)
;(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MeiryoKe_Console"))
;(setq face-font-rescale-alist '(("MeiryoKe_Console" . 1.08)))
