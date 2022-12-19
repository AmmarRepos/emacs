;;; package --- Summary

(setq global-subword-mode t)
(setq global-visual-line-mode nil)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)			;; Disable visible scrollbar
(tool-bar-mode -1)			;; Disable the toolbar
(tooltip-mode -1)			;; Disable tooltips
(set-fringe-mode 10)			;; Give some breathing room
(global-linum-mode -1)			;; Enable line numbers globally
(menu-bar-mode -1)			;; Disable the menu bar
(global-visual-line-mode t)		;; Visual line mode
(setq display-line-numbers-type 't)
(global-display-line-numbers-mode)
(setq visible-bell t)			;; Set up the visible bell
(setq org-startup-indented t)           ;; To globally turn on Org Indent mode for all files
(electric-pair-local-mode 1)
(setq magit-view-git-manual-method 'man)
(desktop-save-mode 1)
;; If integer, it means pixels, added below each line.
;; If float, a scaling factor relative to current window's default line height.
;; If nil, add no extra spacing.
(setq-default line-spacing nil)
;; move cursor by camelCase
(global-subword-mode 1)

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

(straight-use-package 'modus-themes)
;; (straight-use-package 'vertico)
(straight-use-package 'anki-editor)
(straight-use-package 'denote)
(straight-use-package 'eglot)
(straight-use-package 'company)
(straight-use-package 'hide-lines)
(straight-use-package 'multiple-cursors)
;; (straight-use-package 'todotxt-mode)
(straight-use-package 'apache-mode)
(straight-use-package 'js2-mode)
(straight-use-package 'emmet-mode)
(straight-use-package 'web-mode)
(straight-use-package 'markdown-mode)
(straight-use-package 'prettier)
(straight-use-package 'wc-mode)
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(straight-use-package 'tree-sitter-indent)
(straight-use-package 'csharp-mode) ;;; If you are running Emacs 29 or larger you are advised to remove this package and rely on what’s in core.
(straight-use-package 'impatient-mode)
(straight-use-package 'magit)
(straight-use-package 'prettier-js)
(straight-use-package 'csproj-mode)
(straight-use-package 'dotnet)
(straight-use-package 'projectile)
(straight-use-package 'json-mode)
(straight-use-package 'counsel-projectile)
(straight-use-package 'treemacs)
(straight-use-package 'org-pomodoro)
(straight-use-package 'eshell-syntax-highlighting)
(straight-use-package 'dap-mode)
(straight-use-package 'apheleia)
(straight-use-package '(ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold"))
(straight-use-package 'plantuml-mode)
(straight-use-package 'rg)
(straight-use-package 'pulsar)
(straight-use-package 'consult)

(setq ts-fold-summary-show t)
(apheleia-global-mode +1)

(setq plantuml-jar-path "~/.emacs.d/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml.jar"))

(require 'ob-js)
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)(python . t)(shell . t)(js . t)))

(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
(add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))


;; (vertico-mode)
(require 'icomplete)
(icomplete-mode 1)
(setq icomplete-hide-common-prefix nil)
(setq icomplete-in-buffer t)
(icomplete-vertical-mode)

;;(require 'todotxt-mode)

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


;; Projectile
(require 'projectile)
(setq projectile-indexing-method 'native)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-register-project-type 'dotnet '("Program.cs")
                                  :project-file "*.csproj"
				  :compile "dotnet build"
				  :test "dotnet test"
				  :run "dotnet run"
				  :test-suffix ".spec")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\.")
        ("cs"  . "\\.cshtml\\."))
      )


;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)

;; do this especially on Windows, else python output problem
(set-terminal-coding-system 'utf-8-unix)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3199be8536de4a8300eaf9ce6d864a35aa802088c0925e944e2b74a574c68fd0" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil
      modus-themes-mixed-fonts nil
      modus-themes-subtle-line-numbers nil
      modus-themes-intense-mouseovers nil
      modus-themes-deuteranopia t
      modus-themes-tabs-accented t
      modus-themes-variable-pitch-ui nil
      modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related

      modus-themes-fringes nil ; {nil,'subtle,'intense}

      ;; Options for `modus-themes-lang-checkers' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `straight-underline', `text-also', `background',
      ;; `intense' OR `faint'.
      modus-themes-lang-checkers nil

      ;; Options for `modus-themes-mode-line' are either nil, or a list
      ;; that can combine any of `3d' OR `moody', `borderless',
      ;; `accented', a natural number for extra padding (or a cons cell
      ;; of padding and NATNUM), and a floating point for the height of
      ;; the text relative to the base font size (or a cons cell of
      ;; height and FLOAT)
      modus-themes-mode-line '(accented borderless (padding . 4) (height . 0.9))

      ;; Same as above:
      ;; modus-themes-mode-line '(accented borderless 4 0.9)

      ;; Options for `modus-themes-markup' are either nil, or a list
      ;; that can combine any of `bold', `italic', `background',
      ;; `intense'.
      modus-themes-markup '(background italic)

      ;; Options for `modus-themes-syntax' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `faint', `yellow-comments', `green-strings', `alt-syntax'
      modus-themes-syntax `(yellow-comments)

      ;; Options for `modus-themes-hl-line' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `accented', `underline', `intense'
      modus-themes-hl-line '(underline accented)

      ;; Options for `modus-themes-paren-match' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `bold', `intense', `underline'
      modus-themes-paren-match '(bold intense)

      ;; Options for `modus-themes-links' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
      ;; `bold', `italic', `background'
      modus-themes-links '(neutral-underline background)

      ;; Options for `modus-themes-box-buttons' are either nil (the
      ;; default), or a list that can combine any of `flat', `accented',
      ;; `faint', `variable-pitch', `underline', `all-buttons', the
      ;; symbol of any font weight as listed in `modus-themes-weights',
      ;; and a floating point number (e.g. 0.9) for the height of the
      ;; button's text.
      modus-themes-box-buttons '(variable-pitch flat faint 0.9)

      ;; Options for `modus-themes-prompts' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `background', `bold', `gray', `intense', `italic'
      modus-themes-prompts '(intense bold)

      ;; The `modus-themes-completions' is an alist that reads three
      ;; keys: `matches', `selection', `popup'.  Each accepts a nil
      ;; value (or empty list) or a list of properties that can include
      ;; any of the following (for WEIGHT read further below):
      ;;
      ;; `matches' - `background', `intense', `underline', `italic', WEIGHT
      ;; `selection' - `accented', `intense', `underline', `italic', `text-also' WEIGHT
      ;; `popup' - same as `selected'
      ;; `t' - applies to any key not explicitly referenced (check docs)
      ;;
      ;; WEIGHT is a symbol such as `semibold', `light', or anything
      ;; covered in `modus-themes-weights'.  Bold is used in the absence
      ;; of an explicit WEIGHT.
      modus-themes-completions '((matches . (extrabold))
                                 (selection . (semibold accented))
                                 (popup . (accented intense)))

      modus-themes-mail-citations nil ; {nil,'intense,'faint,'monochrome}

      ;; Options for `modus-themes-region' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `no-extend', `bg-only', `accented'
      modus-themes-region '(bg-only)

      ;; Options for `modus-themes-diffs': nil, 'desaturated, 'bg-only
      modus-themes-diffs 'desaturated

      modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

      modus-themes-org-agenda ; this is an alist: read the manual or its doc string
      '((header-block . (variable-pitch 1.1))
        (header-date . (grayscale workaholic bold-today 1.1))
        (event . (accented varied))
        (scheduled . uniform)
        (habit . traffic-light))

      modus-themes-headings ; this is an alist: read the manual or its doc string
      '((1 . (overline background variable-pitch 1))
        (2 . (rainbow overline 1))
        (t . (semibold))))
(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 105)

(require 'pulsar)

;; Check the default value of `pulsar-pulse-functions'.  That is where
;; you add more commands that should cause a pulse after they are
;; invoked


;; pulsar
(setq pulsar-pulse t)
(setq pulsar-delay 0.055)
(setq pulsar-iterations 10)
(setq pulsar-face 'pulsar-magenta)
(setq pulsar-highlight-face 'pulsar-yellow)

(pulsar-global-mode 1)

;; OR use the local mode for select mode hooks

(dolist (hook '(org-mode-hook emacs-lisp-mode-hook))
  (add-hook hook #'pulsar-mode))

;; pulsar does not define any key bindings.  This is just a sample that
;; respects the key binding conventions.  Evaluate:
;;
;;     (info "(elisp) Key Binding Conventions")
;;
;; The author uses C-x l for `pulsar-pulse-line' and C-x L for
;; `pulsar-highlight-line'.
;;
;; You can replace `pulsar-highlight-line' with the command
;; `pulsar-highlight-dwim'.
(let ((map global-map))
  (define-key map (kbd "C-c h p") #'pulsar-pulse-line)
  (define-key map (kbd "C-c h h") #'pulsar-highlight-line))
(add-hook 'next-error-hook #'pulsar-pulse-line)
;; integration with the `consult' package:
(add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
(add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)

;; integration with the built-in `imenu':
(add-hook 'imenu-after-jump-hook #'pulsar-recenter-top)
(add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry)
;;; init.el ends here
