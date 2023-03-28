;; macOs 平台中，将 command 映射为 meta
(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
)

;; 简化退出命令
(defalias 'yes-or-no-p 'y-or-n-p)

(setq evil-want-C-i-jump nil)
(setq evil-want-C-u-scroll t)

;; which-key 提示文案
(which-key-add-key-based-replacements "t t" "New Buffer")
(which-key-add-key-based-replacements "t w" "Kill Buffer")
(which-key-add-key-based-replacements "H" "Previous Buffer")
(which-key-add-key-based-replacements "L" "Next Buffer")


;; 定义命令 new-empty-buffer，用于创建空白 buffer
(defun new-empty-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "untitled"))
)

;; 进行所有删除操作时，不将操作内容复制到寄存器中
(defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
    (apply orig-fn beg end type ?_ args))
(advice-add 'evil-delete :around 'bb/evil-delete)

;; NORMAL mode
(define-key evil-normal-state-map (kbd "t t") 'new-empty-buffer)
(define-key evil-normal-state-map (kbd "t w") 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "H") 'centaur-tabs-backward)
(define-key evil-normal-state-map (kbd "L") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(evil-leader/set-key "w" 'save-buffer)

(evil-leader/set-key "sr" 'split-window-right)
(evil-leader/set-key "sb" 'split-window-below)
(evil-leader/set-key "sx" 'ace-delete-window)
(evil-leader/set-key "so" 'delete-other-windows)
(evil-leader/set-key "se" 'balance-windows)
(evil-leader/set-key "sl" 'enlarge-window-horizontally)
(evil-leader/set-key "sh" 'shrink-window-horizontally)
(evil-leader/set-key "sj" 'enlarge-window)
(evil-leader/set-key "sk" 'shrink-window)
(evil-leader/set-key "ss" 'ace-select-window)

;; INSERT mode
(define-key evil-insert-state-map (kbd "C-u") 'evil-scroll-up)
;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(provide 'init-keybindings)
