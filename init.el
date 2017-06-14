;;; package --- Summary
;;; Commentary:
;;; Code:
(setq gc-cons-threshold 100000000)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;英中文字体
(set-face-attribute 'default nil :font "hack 16")
(set-fontset-font "fontset-default" 'unicode '("苹方" . "unicode-ttf"))

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's `emacs-lisp-mode' and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
(add-hook 'after-save-hook 'byte-compile-current-buffer)

(defun indent-whole ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

(defvar local-dir (file-name-directory load-file-name))

(defvar config-dir (expand-file-name  "config" local-dir))

(add-to-list 'load-path config-dir)

 (mapc (lambda (name) (require (intern (file-name-sans-extension name))))
       (directory-files config-dir nil "\\.el$"))

(setq custom-file "/dev/null")

(use-package osx-pseudo-daemon
  :if (memq window-system '(mac ns))
  :ensure t)
;;; init.el ends here
