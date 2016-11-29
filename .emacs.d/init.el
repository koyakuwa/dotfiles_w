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
