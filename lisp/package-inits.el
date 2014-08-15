;;;
;;; Package initializations
;;;

;;; projectile
(projectile-global-mode t)

;;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;; go-mode
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "RET") 'newline-and-indent)
                          (local-set-key (kbd "<M-.>") #'godef-jump)))

;;; go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;;; unicode-fonts
(unicode-fonts-setup)

;;; yasnippet
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)
;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;;; evil nert commenter
(evilnc-default-hotkeys)

;;; auto complete
(require 'auto-complete)
(global-auto-complete-mode t)

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

;;; go autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)

;;; helm
(require 'helm-inits)

(provide 'package-inits)
;;; package-inits.el ends here
