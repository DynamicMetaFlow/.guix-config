(define-module (Public user-packages)
  #:use-module (Public utils)
  #:export (build-common-packages
            build-guix-packages
            emacs-packages
            guile-packages
            multimedia-packages
            misc-packages))

;;; Packages to build things

(define build-common-packages
  (specifications->packages
   "autoconf"
   "automake"
   "gcc-toolchain"
   "gettext"
   "libtool"
   "make"
   "pkg-config"
   "texinfo"))

(define emacs-packages
  ;; Emacs packages, but not Emacs itself.
  (specifications->packages
   "emacs-debbugs"
   "emacs-edit-indirect"
   "emacs-elisp-slime-nav"
   "emacs-erc-hl-nicks"
   "emacs-flx"
   "emacs-geiser"
   "emacs-git-modes"
   "emacs-google-translate"
   "emacs-hl-todo"
   "emacs-hydra"
   "emacs-ivy"
   "emacs-markdown-mode"
   "emacs-package-lint"
   "emacs-paredit"
   "emacs-pdf-tools"
   "emacs-rainbow-mode"
   "emacs-shift-number"
   "emacs-smartparens"
   "emacs-smex"))

(define guile-packages
  (specifications->packages
   "guile"
   "guile-charting"
   "guile-chickadee"
   "guile-daemon"
   "guile-gcrypt"
   "guile-git"
   "guile-json"
   "guile-xosd"
   "haunt"))

(define multimedia-packages
  (specifications->packages
   "ffmpeg"
   "graphviz"
   "imagemagick"
   "mplayer"
   "mpv"
   "my-sxiv"
   "sox"
   "timidity++"
   "youtube-dl"
   "zathura"
   "zathura-djvu"
   "zathura-pdf-poppler"))

(define misc-packages
  (specifications->packages
   "alsa-utils"
   "aspell"
   "aspell-dict-en"
   "aspell-dict-ru"
   "baobab"
   "curl"
   "dbus"
   "dunst"
   "file"
   "fontconfig"
   "gdb"
   "git"
   "git:send-email"
   "gnupg"
   "gtk-engines"                ; standard themes (clearlooks, etc.)
   "icecat"
   "iotop"
   "libnotify"                  ; for 'notify-send'
   "libxslt"
   "lm-sensors"
   "ltrace"
   "man-db"                     ; to set MANPATH on non-GuixSD
   "man-pages"
   "my-emacs"
   "netcat"
   "openssh"
   "pulseaudio"
   "pavucontrol"
   "pinentry"
   "postgresql"
   "python-wrapper"
   "rsync"
   "rtorrent"
   "sbcl"
   "sshfs-fuse"
   "strace"
   "tidy-html"
   "unzip"
   "w3m"
   "wget"))

;;; packages.scm ends here
