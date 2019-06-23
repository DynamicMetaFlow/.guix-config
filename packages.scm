(use-modules (gnu packages)
             (guix profiles)
             (ice-9 match)
             (ice-9 pretty-print)
             (guix git-download)
             (gnu packages emacs-xyz))


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
          (list "emacs-alert"
                "emacs-helm"
)))


;;; MANIFEST
;;; ========

(packages->manifest (map specification->package packages))
