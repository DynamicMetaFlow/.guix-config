 ;; run this with "guix package -f" to install the emacs configuration
(use-modules (gnu packages emacs)
              (guix base32)
              (guix build-system emacs)
              (guix build-system trivial)
              (guix download)
              (guix http-client)
              (guix import elpa)
              (guix packages)
              (gnu packages)
              (guix store)
              (gcrypt hash)
              (ice-9 match)
              (ice-9 pretty-print)
              (srfi srfi-26))

 (define emacs-standard-library?
   (@@ (guix import elpa) emacs-standard-library?))
 (define elpa-name->package-name
   (@@ (guix import elpa) elpa-name->package-name))
 (define fetch-elpa-package
   (@@ (guix import elpa) fetch-elpa-package))
 (define elpa-dependencies->names
   (@@ (guix import elpa) elpa-dependencies->names))
 (define <elpa-package>
   (@@ (guix import elpa) <elpa-package>))

 (define inbuilt-packages
   '("emacs"
     "json"))

 (define packages
   '(
     guix
     company
     company-prescient
     company-quickhelp
     ivy
     ivy-rich
     swiper
     persistent-scratch
     unkillable-scratch
     scratch-el
     visual-fill-column
     modalka
     which-key
     outshine
     prescient
     undo-tree
     projectile
     counsel-projectile
     emms
     pdf-tools
     elfeed
     elfeed-org
     dired-hide-dotfiles
     buffer-move
     magit
     git-timemachine
     howm
     writeroom
     flycheck
     flycheck-color-mode-line
     markdown-mode
     helpful
     transient
     general
     hydra
     exwm
     exwm-edit
     xelb
     async
     dash
     f
     s
     ht
     a
     request
     exec-path-from-shell
     desktop-environment
     circe
     discover-my-major
     ace-window
     org
     org-contrib
     org-journal
     org-cliplink
     org-download
     toc-org
     better-defaults
     elmacro
     page-break-lines
     dired-sidebar
     emr
     pass
     poporg
     slime
     use-package
     base16-theme
     yasnippet
     yasnippet-snippets
     auto-yasnippet
     htmlize
     objed
     torus
     smartparens
     goto-last-change
     goto-last-point
     historian
     ivy-historian
     deadgrep
     dumb-jump
     browse-kill-ring
     anzu
     load-theme-buffer-local
     ))

 (define (resolve-dependencies names cache)
   (filter (compose not (cut eq? <> #f) cadr)
           (map (lambda (name)
                  (list (elpa-name->package-name name)
                        (elpa-name->package name cache)))
                names)))

 (define (elpa-package->package pkg pkg-cache)
   "Turn an elpa package into an actual package."
   (match pkg
     (($ <elpa-package> name version inputs synopsis kind home-page description source-url)
      (package
       (name (elpa-name->package-name name))
       (version version)
       (source (origin
                (method url-fetch)
                (uri source-url)
                (sha256
                 (base32
                  (bytevector->nix-base32-string
                   (file-sha256
                    (with-store store
                                (download-to-store store source-url))))))))
       (build-system emacs-build-system)
       (propagated-inputs
        (resolve-dependencies
         (elpa-dependencies->names inputs)
         pkg-cache))
       (home-page home-page)
       (synopsis synopsis)
       (description description)
       (license #f)))))

 (define (fetch-pkg name)
   (or (fetch-elpa-package name 'melpa)
       (fetch-elpa-package name 'melpa-stable)
       (fetch-elpa-package name 'gnu)))

 (define (elpa-name->package name pkg-cache)
   (if (or (emacs-standard-library? name)
           (member name inbuilt-packages))
       #f
       (or (match (find-packages-by-name (elpa-name->package-name name))
             [(package . _) package]
             [_ #f])
           (hash-ref pkg-cache name #f)
           (let ((package (elpa-package->package (fetch-pkg name) pkg-cache)))
             (cond
              (package
               (hash-set! pkg-cache name package)
               package)
              (else
               (error "Can't download library: " name)))))))

 (let ((cache (make-hash-table))
       (dependencies (map symbol->string packages)))
   (package
    (name "emacs-configuration")
    (version "0.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments `(#:builder (mkdir %output)))
    (propagated-inputs
     (resolve-dependencies dependencies cache))
    (synopsis "")
    (description "")
    (license #f)
    (home-page "")))
