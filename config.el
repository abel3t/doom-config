(require 'loadhist)
(file-dependents (feature-file 'cl))


;;;###autoload
(defun abel3t/edit-zsh-configuration ()
  (interactive)
  (find-file "~/.zshrc"))

(setq user-full-name "Abel Tran"
      user-mail-address "abeltran.develop@gmail.com"
      display-line-numbers-type t

      ;; exit no confirm
      confirm-kill-emacs nil

      ;; org
      org-directory "~/org/"

      ;; scroll behavior
      redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1

      ;; mouse wheel
      mouse-wheel-follow-mouse 't
      mouse-wheel-scroll-amount '(1 ((shift) . 1))

      ;; project search
      projectile-globally-ignored-directories '("dist" "build" "node_modules")
      )

(map!
 "s-k"          #'move-text-up
 "s-j"          #'move-text-down)

(setq-default
 fill-column 120
 undo-limit 80000000
 delete-by-moving-to-trash t
 window-combination-resize t
 delete-trailing-lines t
 x-stretch-cursor t
 typescript-indent-level 2
 custom-file (expand-file-name ".custom.el" doom-private-dir))

(
 map!
 :leader
 :nv    "SPC"   #'execute-extended-command

 ;; m -> Treemacs
 :n     "mt"    #'treemacs
 :n     "mdf"           #'treemacs-delete-file
 :n     "mdp"           #'treemacs-remove-project-from-workspace
 :n     "mcd"           #'treemacs-create-dir
 :n     "mcf"           #'treemacs-create-file
 :n     "ma"           #'treemacs-add-project-to-workspace
 :n     "mwc"           #'treemacs-create-workspace
 :n     "mws"           #'treemacs-switch-workspace
 :n     "mwd"           #'treemacs-remove-workspace
 :n     "mwf"           #'treemacs-rename-workspace

  ;; d -> edit
 :n     "es"            #'sudo-edit

 ;; w -> window
 :n     "wo"            #'delete-other-windows

 ;; i -> Insert, Imenu
 :n     "ia"            #'+org/attach-file-and-insert-link
 :n     "im"            #'imenu-list
 :n     "iM"            #'lsp-ui-imenu
 :n     "is"            #'lsp-ui-doc-show

 ;; vterm
 :n     "tt"            #'+vterm/toggle
 )

;; UI
;; You will most likely need to adjust this font size for your system!
(fset 'yes-or-no-p 'y-or-n-p)
;; Make frame transparency overridable
;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha 100)
(add-to-list 'default-frame-alist `(alpha . ,100))

(when (file-exists-p custom-file)
  (load custom-file))

;; You will most likely need to adjust this font size for your system!
(fset 'yes-or-no-p 'y-or-n-p)
;; Make frame transparency overridable
;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha 100)
(add-to-list 'default-frame-alist `(alpha . ,100))

;; Set the fixed default face
(set-face-attribute 'default nil :font "Fira Code" :height 130)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Input Mono" :height 160)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 160 :weight 'regular)
;; Themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-solarized-dark-high-contrast t)
  ;; (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package! org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package! engine-mode
  :config
  (engine/set-keymap-prefix (kbd "s-s"))
  (setq browse-url-browser-function 'browse-url-default-macosx-browser
        engine/browser-function 'browse-url-default-macosx-browser
        ;; browse-url-generic-program "google-chrome"
        )

  ;; Code Overflow
  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "h")
  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s"
    :keybinding "s")

  ;; Node Package Manager
  (defengine npm
    "https://www.npmjs.com/search?q=%s"
    :keybinding "n")

  ;; Rust Package Management
  (defengine crates
    "https://crates.io/search?q=%s"
    :docstring "Crates Package Management for Rust"
    :keybinding "cc")
  (defengine rust-std
    "https://doc.rust-lang.org/std/?search=%s"
    :keybinding "cs")

  ;; Languages
  (defengine translate
    "https://translate.google.com/?sl=en&tl=vi&text=%s&op=translate"
    :keybinding "t")
  (defengine cambridge
    "https://dictionary.cambridge.org/vi/dictionary/english/%s"
    :keybinding "e")


  ;; Social
  (defengine youtube
    "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
    :keybinding "y")

  ;; Search
  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")

  (engine-mode 1))
