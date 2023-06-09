;; 安装 restart-emacs 扩展
(use-package restart-emacs)

;; 测试启动耗时
;; M-x benchmark-init/show-durations-tree
;; M-x benchmark-init/show-durations-tabulated
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate)
)

;; 自动补全
(use-package company
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
                company-show-quick-access t)
)

;; 语法检查
(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (global-set-key (kbd "M-n") #'flymake-goto-next-error)
  (global-set-key (kbd "M-p") #'flymake-goto-prev-error))

;; evil-mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
)

;; which-key
(use-package which-key)
(which-key-mode)

;; evil-leader
(use-package evil-leader
  :init
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
)

(use-package key-chord)
(key-chord-mode 1)

;; 让滚动更丝滑
(use-package smooth-scrolling)
(setq smooth-scroll-margin 5) ;; 设置滚动之前和之后的余白行数为5
(setq scroll-conservatively 101) ;; 避免在滚动时跳跃
(setq auto-window-vscroll nil) ;; 禁止自动垂直滚动
(setq scroll-step 1) ;; 滚动一次只移动一行
(setq mouse-wheel-follow-mouse 't) ;; 鼠标滚轮滚动时跟随鼠标光标
(setq mouse-wheel-progressive-speed nil) ;; 关闭鼠标滚轮加速功能

;; 快速切换分屏
(use-package ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; 启用 ivy 模式，替换默认的搜索和选择器
(use-package ivy)
(ivy-mode)
;; 使用 fuzzy matching
(setq ivy-re-builders-alist
  '((t . ivy--regex-fuzzy))
)

(use-package counsel)
;; 启用 counsel 模式，提供更丰富的命令和功能
(counsel-mode 1)

;; 使查询以浮动窗口的形式居中展示
(use-package ivy-posframe)
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(ivy-posframe-mode 1)

(provide 'init-packages)
