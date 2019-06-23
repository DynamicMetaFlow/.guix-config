(use-modules (guix packages))


(packages->manifest
 (list alsa-utils
       aseprite
       emacs
       emacs-better-defaults
       emacs-elfeed
       emacs-ido-ubiquitous
       emacs-js2-mode
       emacs-markdown-mode
       emacs-projectile
       emacs-rainbow-delimiters
       emacs-smex
       emacs-web-mode
       emacs-yaml-mode
       eog
       evince
       file-roller
       font-adobe-source-han-sans
       font-dejavu
       font-inconsolata
       geda-gaf
       geiser-next
       gimp
       git
       (list git "send-email")
       git-manpages
       gmtp
       gnome-tweak-tool
       gnupg
       guile-2.0
       icecat
       inkscape
       livestreamer
       magit
       milkytracker
       mpd
       mpdscribble
       mpv
       ncmpcpp
       notmuch
       obs
       offlineimap
       paredit
       pavucontrol
       pcb
       pinentry
       pwgen
       screen
       scrot
       shepherd
       skribilo
       sshfs-fuse
       strace
       (list transmission "gui")
       typo
       wget
       xmodmap
       youtube-dl))
