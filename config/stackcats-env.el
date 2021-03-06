;;; package --- Summary
;;; Commentary:
;;; Code:
(setq exec-path (append exec-path '("/usr/local/bin")))

(defconst shell-variables '("PATH" "GOROOT" "GOPATH" "C_INCLUDE_PATH" "LIBRARY_PATH" "LISP" "ESLINT" "RACKET" "RACO"))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :defer t
  :init
  (defvar exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-variables shell-variables)
  (exec-path-from-shell-initialize))

(provide 'stackcats-env)
;;; stackcats-env.el ends here
