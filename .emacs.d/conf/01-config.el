;;; 一般的な設定

;; 文字コードの指定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; ビープ音を消す
(setq ring-bell-function 'ignore)

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
;; オートセーブファイルの作成場所をシステムのTempディレクトリに変更する
;(setq auto-sabe-file-name-transforms
;         `((".*" ,temporary-file-directory t)))

;; バックアップとオートセーブファイルを~/.emacs.d/backup/へ集める
(add-to-list 'backup-directory-alist
                         (cons "." "~/.emacs.d/backup/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

;; create backup file in ~/.emacs.d/backup
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
                        backup-directory-alist))

;; オートセーブファイル作成までの秒間隔
(setq auto-save-timeout 15)
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 60)

;; grepの結果を直接編集
(require 'wgrep nil t)

;; ファイル予測
(require 'ido)
(ido-mode t)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; redo+
;;(require 'redo+)
;; C-. にredoを割り当てる
(global-set-key (kbd "C-/") 'redo)

;; ファイルの最後に改行を入れる
(setq require-final-newline t)
