;;;
;;; Package initializations
;;;

;;; auto indent
(auto-indent-global-mode)

;;; company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;;; flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;; go-mode
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (flycheck-mode t)
                          (local-set-key (kbd "<M-.>") #'godef-jump)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

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

;;; evil nerd commenter
(evilnc-default-hotkeys)
(global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)

;;; helm
(require 'helm-inits)

;;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0)
  (setq web-mode-comment-style 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;; emmet mode
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook 'emmet-mode) ;; enable Emmet's css abbreviation.

;;; smart parens
(smartparens-global-mode t)
(show-smartparens-global-mode t)

(provide 'package-inits)
;;; package-inits.el ends here
