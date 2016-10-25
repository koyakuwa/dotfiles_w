;;; キーバインドの設定

;; "C-t" でウィンドウを切り替える
(define-key global-map (kbd "C-t") 'other-window)

;; "C-h" でバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; "C-m" にnewline-and-indentを割り当てる
(define-key global-map (kbd "C-m") 'newline-and-indent)

;; シンタックスハイライトの設定
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
	 (:backgrounnd "NavyBlue" t))
	;; 背景色がlightならば背景色を緑に
	(((class color) (background light))
	 (:background "LightFoldenrodYellow"))
	(t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 対応する括弧のハイライト
(setq show-paren-dilay 0)
(show-paren-mode t)

;; フェイスを変更する
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")
