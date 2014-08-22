;;; env, machine dependend file
;;; not included to repo
(require 'machine-user-env)

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

;;; move dup
(global-set-key (kbd "<C-M-up>") 'md/duplicate-up)
(global-set-key (kbd "<C-M-down>") 'md/duplicate-down)
(global-set-key (kbd "<C-S-up>") 'md/move-lines-up)
(global-set-key (kbd "<C-S-down>") 'md/move-lines-down)

;; other keys
(global-set-key (kbd "<M-up>") 'other-window)
(global-set-key (kbd "<M-down>") 'other-window)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)
(global-set-key (kbd "<s-right>") 'move-end-of-line)

;; replace on yank
(delete-selection-mode 1)

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

;;; file path in frame title
(setq frame-title-format
  '(:eval
    (if buffer-file-name
        (replace-regexp-in-string
         "\\\\" "/"
         (replace-regexp-in-string
          (regexp-quote (getenv "HOME")) "~"
          (convert-standard-filename buffer-file-name)))
      (buffer-name))))

;;; package inits
(require 'package-inits)

;;;
(provide 'user-opts)
;;; user-opts.el ends here
