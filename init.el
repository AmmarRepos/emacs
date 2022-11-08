(setq inhibit-startup-message t)
(scroll-bar-mode -1)			; Disable visible scrollbar
(tool-bar-mode -1)			; Disable the toolbar
(tooltip-mode -1)			; Disable tooltips
(set-fringe-mode 10)			; Give some breathing room
(global-linum-mode -1)			; Enable line numbers globally
(menu-bar-mode -1)			; Disable the menu bar
(global-visual-line-mode t)		; Visual line mode
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(setq visible-bell t)			; Set up the visible bell
(setq org-startup-indented t) ;To globally turn on Org Indent mode for all files
(electric-pair-local-mode 1)
(setq magit-view-git-manual-method 'man)

;; First, place the following bootstrap code in your init-file:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'vertico)
(straight-use-package 'anki-editor)
(straight-use-package 'denote)
(straight-use-package 'eglot)
(straight-use-package 'company)
(straight-use-package 'hide-lines)
(straight-use-package 'multiple-cursors)
(straight-use-package 'todotxt-mode)
(straight-use-package 'lsp-mode)
(straight-use-package 'apache-mode)
(straight-use-package 'zenburn-theme)
(straight-use-package 'js2-mode)
(straight-use-package 'emmet-mode)
(straight-use-package 'web-mode)
(straight-use-package 'markdown-mode)
(straight-use-package 'prettier)
(straight-use-package 'wc-mode)
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(straight-use-package 'tree-sitter-indent)
(straight-use-package 'csharp-mode)
(straight-use-package 'impatient-mode)
(straight-use-package 'magit) ;;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
(straight-use-package 'prettier-js)
(straight-use-package 'csproj-mode)
(straight-use-package 'dotnet)
(straight-use-package 'projectile)

(load-theme 'zenburn t) ;; theme
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 110)
(vertico-mode)
(require 'todotxt-mode)

;; (setq org-capture-templates
;;       '(("f"
;; 	 "Anki Emacs Function"
;; 	 plain
;; 	 (file "~/.emacs.d/.org/anki/EMACS.org")
;; 	 "%[~/.emacs.d/.org/org_templates/anki_emacs_fun.org]")
;; 	("v"
;; 	 "Anki Emacs Variable"
;; 	 plain
;; 	 (file "~/.emacs.d/.org/anki/EMACS.org")
;; 	 "%[~/.emacs.d/.org/org_templates/anki_emacs_var.org]")
;; 	("r"
;; 	 "RDF"
;; 	 plain
;; 	 (file "~/.emacs.d/.org/anki/EMACS.org")
;; 	 "%[~/.emacs.d/.org/org_templates/anki_rdf.org]")))

(setq denote-directory (expand-file-name "~/.emacs.d/notes/"))
(setq denote-known-keywords '("representation" "accumulativeness" "atomicity"))
(setq denote-infer-keywords t)
(setq denote-sort-keywords t)
(setq denote-file-type nil) ; Org is the default, set others here
(setq denote-prompts '(title keywords))
(setq denote-allow-multi-word-keywords t)
(setq denote-date-format nil) ; read doc string

(defun connect-remote-obim ()
  (interactive)
  (dired "/ssh:root@178.62.203.39:/"))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
