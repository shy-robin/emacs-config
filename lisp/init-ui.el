;; 隐藏 ui
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; 主题
(use-package doom-themes)
(setq
  doom-themes-enable-bold t    ; if nil, bold is universally disabled
  doom-themes-enable-italic t ; if nil, italics is universally disabled
)
(load-theme 'doom-one t)
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)
;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
(doom-themes-treemacs-config)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; 通过修改字体解决 Windows 平台下卡顿问题
(use-package emacs
  :if (display-graphic-p)
  :config
  (if *is-windows*
    (progn
      (set-face-attribute 'default nil :font "Microsoft Yahei Mono 9")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
          charset (font-spec :family "Microsoft Yahei Mono" :size 12)
        )
      )
    )
    ;; 如果不是 Windows 系统，设置字体
    (set-face-attribute 'default nil :font "SauceCodePro Nerd Font 16")
  )
)

;; 设置相对行号
(setq display-line-numbers-type 'relative)
;; Windows 开启行号时会出现滚动闪烁的问题，所以需要关闭
(unless *is-windows*
  (global-display-line-numbers-mode t)
)

;; 启动会最大化窗口
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 显示图标
(use-package
  all-the-icons
  :demand t ;; 要求插件在启动时加载，避免延迟加载
)
(setq inhibit-compacting-font-caches t) ;; 解决 icon 显示不正常问题

;; 标签页
(use-package centaur-tabs
  :demand t
  :init
  :config
  (setq centaur-tabs-style "bar"
    centaur-tabs-height 20
    centaur-tabs-set-icons nil
    centaur-tabs-show-new-tab-button nil
    centaur-tabs-set-modified-marker t
    centaur-tabs-show-navigation-buttons nil
    centaur-tabs-set-bar 'under
    centaur-tabs-show-count nil
    centaur-tabs-gray-out-icons nil
    x-underline-at-descent-line t
    centaur-tabs-left-edge-margin nil
  )
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
)

(provide 'init-ui)
