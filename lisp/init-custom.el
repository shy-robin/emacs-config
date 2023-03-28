;; 将用户通过图形界面生成的配置保存到 custom.el 文件中
(setq custom-file
  (expand-file-name "custom.el" user-emacs-directory)
)

;; 当 custom.el 文件存在时，加载它
(when
  (file-exists-p custom-file)
  (load-file custom-file)
)

(provide 'init-custom)
