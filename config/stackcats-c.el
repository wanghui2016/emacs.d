;;; Code:

(defun kill-buffer-when-compile-success (process)
  "Close current buffer when `shell-command' exit."
  (set-process-sentinel
   process
   (lambda (proc change)
     (when (string-match "finished" change)
       (delete-windows-on (process-buffer proc))))))

(use-package cc-mode
  :config
  (setq c-basic-offset 2)
  (setq	indent-tabs-mode t)
  (setq tab-width 2)
  (add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)
  (add-hook 'c-mode-hook 'smartparens-mode)
  (local-set-key (kbd "<tab>") 'company-complete-common))

;;(add-hook 'c-mode-hook 'my-c-mode-hook)



(provide 'stackcats-c)
;;; stackcats-c.el ends here
