;; 拼接得到文件夹 lisp 路径，并加载其中的文件
(add-to-list
  'load-path
  (expand-file-name (concat user-emacs-directory "lisp"))
)

(require 'init-const)
(require 'init-startup)
(require 'init-elpa)
(require 'init-packages)
(require 'init-keybindings)
(require 'init-ui)
(require 'init-custom)
