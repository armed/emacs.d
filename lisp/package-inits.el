;;;
;;; Package initializations
;;;

;;; projectile
;;(projectile-global-mode t)

;;; flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;; flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;; go-mode
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (flycheck-mode t)
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

;;; evil nerd commenter
(evilnc-default-hotkeys)
(global-set-key (kbd "s-\\") 'evilnc-comment-or-uncomment-lines)

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
  (local-set-key (kbd "RET") 'newline-and-indent)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;; emmet mode
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook 'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)

;;; smart parens
(smartparens-global-mode t)
(show-smartparens-global-mode t)

(provide 'package-inits)
;;; package-inits.el ends here
