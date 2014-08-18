;;; env
(setenv "GOPATH" "/Users/armed/Developer/go")
(setenv "PATH"
        (concat
         (getenv "GOPATH") "/bin" ":"
         "/usr/local/bin" ":"
         (getenv "PATH")))
(setq exec-path (append exec-path
      '("~/Developer/go/bin"
        "/usr/local/bin")))

;;; bell
(setq ring-bell-function 'ignore)

;;; y-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;;; desktop
(desktop-save-mode t)
(setq-default save-place t)

;;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "s-r") 'recentf-open-files)

;; other keys
(global-set-key (kbd "<C-M-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-M-down>") 'enlarge-window)
(global-set-key (kbd "<C-M-up>") 'shrink-window)
(global-set-key (kbd "<M-up>") 'other-window)
(global-set-key (kbd "<M-down>") 'other-window)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)
(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "<s-up>") 'backward-paragraph)
(global-set-key (kbd "<s-down>") 'forward-paragraph)

(require 'move-lines)
(global-set-key (kbd "<C-S-up>") 'move-lines-up)
(global-set-key (kbd "<C-S-down>") 'move-lines-down)

;; replace on yank
(delete-selection-mode 1)

;; dublicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank)
)
(global-set-key (kbd "s-d") 'duplicate-line)

;;; fonts
(set-frame-font "Monaco 15")
(setq file-name-coding-system 'utf-8)

;;; tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;; indent
(electric-indent-mode -1)

;;; prevent backups
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-hl-line-mode -1)
(global-linum-mode -1)

;;; mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;;; package inits
(require 'package-inits)

;;;
(provide 'user-opts)
;;; user-opts.el ends here
