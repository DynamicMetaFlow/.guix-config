(use-modules (gnu)
             (gnu packages))

  (packages (append (map specification->package
                         '(
                           "htop"
                           ))
                    %base-packages))


;;; packages.scm ends here
