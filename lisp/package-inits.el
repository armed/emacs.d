;;;
;;; Package initializations
;;;

;;; Smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")

(global-set-key (kbd "M-x") 'smex)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;; flx-ido
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

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
                          (local-set-key (kbd "<M-.>") #'godef-jump)))

;;; go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;;; go autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)

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

(provide 'package-inits)
;;; package-inits.el ends here
