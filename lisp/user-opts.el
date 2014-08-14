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


;;; go autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)

;;; bell
(setq ring-bell-function 'ignore)

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
(global-set-key (kbd "RET") 'newline-and-indent)
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
(set-frame-font "DejaVu Sans Mono 15")
(setq file-name-coding-system 'utf-8)

;;; tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;; indent
(electric-indent-mode -1)

;;; brackets
(electric-pair-mode 1)

;;; Smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")

(global-set-key (kbd "M-x") 'smex)

;;; flx-ido
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;; prevent backups
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-hl-line-mode -1)
(global-linum-mode -1)

;;(defadvice linum-update-window (around linum-dynamic activate)
;;  (let* ((w (length (number-to-string
;;                     (count-lines (point-min) (point-max)))))
;;         (linum-format (concat " %" (number-to-string w) "d ")))
;;    ad-do-it))

;;; mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;;(setq mouse-wheel-progressive-speed nil)

;;;
(provide 'user-opts)
