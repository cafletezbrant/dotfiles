(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq py-install-directory "~/python-mode.el-6.1.3")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(setq py-shell-switch-buffers-on-execute-p t)
(setq auto-mode-alist
      (append '(
		("\\.emacs$" . emacs-lisp-mode)
		("\\.lisp$" . lisp-mode)
		("\\.lsp$" . lisp-mode)
		("\\.cl$" . lisp-mode)
		("\\.system$" . lisp-mode)
		("\\.scm$" . scheme-mode)
		("\\.ss$" . scheme-mode)
		("\\.sch$" . scheme-mode)
		)auto-mode-alist))

(add-hook 'python-mode-hook 'my-python-hook)

(defun my-python-hook ()
  (define-key python-mode-map (kbd "RET") 'newline-and-indent))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  )

(require 'tex)
    (TeX-global-PDF-mode t)

(set-face-attribute 'default nil :height 140)

(eval-after-load "tex-mode" '(fset 'tex-font-lock-suscript 'ignore))
(setq org-export-with-sub-superscripts nil)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(require 'browse-kill-ring)
(add-hook 'comint-output-filter-functions
'comint-watch-for-password-prompt)
