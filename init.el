;; melpa
(require 'package)
(add-to-list 'package-archives
             ;; The 't' means to append, so that MELPA comes after the more
             ;; stable ELPA archive.
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files")
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq my-packages
      '(cl-lib company dash el-get epl flx package pkg-info projectile s smex))
(el-get 'sync)

(require 'el-get-elpa)
;; Build the El-Get copy of the package.el packages if we have not
;; built it before.  Will have to look into updating later ...
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

;; user options
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'user-opts)
