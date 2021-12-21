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
      )

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
 :n     "vt"            #'+vterm/toggle
 )
