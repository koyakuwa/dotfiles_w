;;; Auto Complete Mode ---------------------------------------------------
;; auto-complete の設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; C-n/C-p で候補を選択
(define-key ac-complete-mode-map "¥C-n" 'ac-next)
(define-key ac-complete-mode-map "¥C-p" 'ac-previous)
