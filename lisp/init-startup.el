;; 设置系统编码，避免乱码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 设置垃圾回收阈值，加快启动速度
(setq gc-cons-threshold most-positive-fixnum)

;; 关闭启动页面
(setq inhibit-startup-message t) ; 关闭启动信息缓冲区
;; (kill-buffer "*scratch*") ;; 关闭 *scratch* 缓冲区
;; (kill-buffer "*Messages*") ;; 关闭 *Messages* 缓冲区
;; (setq initial-buffer-choice nil)

(provide 'init-startup)
