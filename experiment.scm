(use-modules (gnu packages emacs-xyz)
             (guix profiles)
             (guix git-download)
             (ice-9 match)
             (ice-9 pretty-print))

(use-package-modules emacs)

;;; HELPER PROCEDURES
;;; =================

(define (profile-manifest->package-names)
  "Return a list with the names of the packages installed in the user
   profile (see %user-profile-directory in the (guix profiles) module)."
  (map manifest-entry-name
       (manifest-entries (profile-manifest %user-profile-directory))))


;;; PACKAGES
;;; ========

(define packages
  (append (profile-manifest->package-names)
          (list "zathura"
                )))

(define emacs
  (packages->manifest
          (list emacs
                emacs-guix
                emacs-exwm
                emacs-xelb
                emacs-exwm-edit
                emacs-hydra
                emacs-transient
                emacs-howm
                emacs-emms
                emacs-circe
                emacs-pdf-tools
                emacs-elfeed
                emacs-dumb-jump
                emacs-json-mode
                emacs-web-beautify
                emacs-web-mode
                emacs-async
                emacs-dash
                emacs-f
                emacs-s
                emacs-ht
                emacs-a
                emacs-request
                emacs-exec-path-from-shell
                emacs-desktop-environment
                emacs-all-the-icons
                emacs-which-key
                emacs-discover-my-major
                emacs-helpful
                emacs-better-defaults
                emacs-visual-fill-column
                emacs-ace-window
                emacs-transpose-frame
                emacs-dired-hacks
                emacs-dired-rsync
                emacs-avy
                emacs-goto-chg
                emacs-expand-region
                emacs-smartparens
                emacs-edit-indirect
                emacs-flycheck
                emacs-wgrep
                emacs-anzu
                emacs-counsel-projectile
                emacs-ivy
                emacs-ivy-rich
                emacs-smex
                emacs-company
                emacs-company-quickhelp
                emacs-prescient
                emacs-crux
                emacs-keyfreq
                emacs-elmacro
                emacs-projectile
                emacs-ibuffer-projectile
                emacs-magit
                emacs-git-timemachine
                emacs-gitpatch
                emacs-org
                emacs-org-contrib
                emacs-org-pomodoro
                emacs-markdown-mode
                emacs-nov-el
                emacs-scratch-el
                emacs-yasnippet
                emacs-yasnippet-snippets
                emacs-auto-yasnippet
                emacs-htmlize
                )))

;;; MANIFEST
;;; ========

  (packages->manifest (map specification->package packages))
