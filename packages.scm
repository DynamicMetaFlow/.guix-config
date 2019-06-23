(use-modules (guix packages)
             (guix git-download)
             (gnu packages emacs-xyz))

(use-package-modules emacs)




(packages->manifest
 (list emacs
       emacs-better-defaults))
