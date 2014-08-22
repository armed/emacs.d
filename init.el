;;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; appearance
(setq inhibit-startup-screen t) ;; no startup screen

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;;; user options
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'user-opts)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(company-auto-complete t)
 '(company-idle-delay 0.3)
 '(company-tooltip-limit 20)
 '(custom-enabled-themes (quote (ample)))
 '(custom-safe-themes (quote ("7fbb8d064286706fb1e319c9d3c0a8eafc2efe6b19380aae9734c228b05350ae" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "53c542b560d232436e14619d058f81434d6bbcdc42e00a4db53d2667d841702e" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" default)))
 '(electric-pair-mode nil)
 '(fci-rule-color "#343d46")
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc emacs-lis html-tidy)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(global-company-mode t)
 '(gofmt-command "goimports")
 '(linum-format " %7i ")
 '(show-paren-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#bf616a") (40 . "#DCA432") (60 . "#ebcb8b") (80 . "#B4EB89") (100 . "#89EBCA") (120 . "#89AAEB") (140 . "#C189EB") (160 . "#bf616a") (180 . "#DCA432") (200 . "#ebcb8b") (220 . "#B4EB89") (240 . "#89EBCA") (260 . "#89AAEB") (280 . "#C189EB") (300 . "#bf616a") (320 . "#DCA432") (340 . "#ebcb8b") (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-enable-current-element-highlight t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-current-element-highlight-face ((t (:background "gray25")))))
