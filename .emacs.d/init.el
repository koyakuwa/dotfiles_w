;;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;; init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
