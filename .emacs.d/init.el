;;; cask
(require 'cask "~/cask/cask.el")
(cask-initialize)

;;; init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(global-set-key [M-kanji] 'ignore)
(global-set-key [kanji] 'ignore)
