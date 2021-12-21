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

(map!
 "s-k"          #'move-text-up
 "s-j"          #'move-text-down
 )
