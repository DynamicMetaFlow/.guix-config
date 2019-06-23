(use-modules (gnu)
             (gnu packages))

  (operating-systme (packages (append (map specification->package
                         '(
                           "htop"
                           ))
                    %base-packages)))


;;; packages.scm ends here
