(custom-set-variables '(inhibit-startup-screen t))

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


(require 'package)
(package-initialize)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
(elpy-enable)

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
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-to-list 'custom-theme-load-path "~/emacs.d/elpa")

(setq load-path
    (append '("~/polymode" "~/polymode/modes")
            load-path))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

