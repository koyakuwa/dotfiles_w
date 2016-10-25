;; redo+の設定
;(require ‘redo+)
(when (require 'redo nil t)
  ;; C-. にredoを割り当てる
  (global-set-key (kbd "C-.") 'redo))
(setq undo-no-redo t)
(setq undo-limit 60000)
(setq undo-strong-limit 600000)

;; global-auto-revert-mode を有効にする
(global-auto-revert-mode 1)

;; 保存時に行末スペースを削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
