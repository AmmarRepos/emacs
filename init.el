(setq inhibit-startup-message t)
(scroll-bar-mode -1)			; Disable visible scrollbar
(tool-bar-mode -1)			; Disable the toolbar
(tooltip-mode -1)			; Disable tooltips
(set-fringe-mode 10)			; Give some breathing room
(global-linum-mode -1)			; Enable line numbers globally
(menu-bar-mode -1)			; Disable the menu bar
(global-visual-line-mode t)		; Visual line mode
(setq visible-bell t)			; Set up the visible bell
(setq org-startup-indented t) ;To globally turn on Org Indent mode for all files

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 110)

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
