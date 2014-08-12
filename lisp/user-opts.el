;;; env
(setq exec-path (append exec-path
			'("~/Developer/go/bin"
			  "/usr/local/bin")))

;;; bell
(setq ring-bell-function 'ignore)

;;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;; fonts
(set-default-font "Source Code Pro-15")

;;; tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

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

;;; trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; appearance
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(global-hl-line-mode 1)
(global-linum-mode 1)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;;;
(provide 'user-opts)
