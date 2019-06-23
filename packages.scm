(use-modules (guix packages)
             (guix git-download)
             (gnu packages linux))

(use-package-modules emacs)




(packages->manifest
 (list emacs
       emacs-better-defaults))
