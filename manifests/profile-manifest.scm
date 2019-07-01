  (specifications->manifest
   '("nss-certs"
     "bash"               ; Get a standard shell
     "bash-completion"    ; Get proper tab completion
     "bzip2"              ; Support bz2
     "unzip"              ; For extracting and viewing files in .zip archives
     "coreutils"          ; Make bash useful
     "curl"               ; Web scripting
     "diffutils"          ; For diffing files
     "e2fsprogs"          ; EXT filesystem manipulation tools
     "eudev"              ; Userspace hotplug daemon
     "file"               ; File type identification utility
     "findutils"          ; Be able to leverage find
     "font-dejavu"        ; Baseline fonts
     "font-inconsolata"
     "font-liberation"
     "font-terminus"
     "font-ubuntu"
     "gs-fonts"
     "font-dejavu"
     "font-gnu-freefont-ttf"
     "font-adobe-source-code-pro"
     "fontconfig"
     "password-store"
     "gawk"               ; Awk is rather handy
     "git"                ; Primary version control
     "scrot"
     "xautolock"
     "gnupg"              ; Encryption
     "grep"               ; For searching for strings
     "gzip"               ; Support gz
     "htop"               ; System performance
     "slim"               ; Simple Login Manager
     "inetutils"          ; For hostname
     "info-reader"        ; the standalone Info reader (no Perl)
     "isc-dhcp"           ; For DHCP
     "iw"                 ; New standard tool for configuring wireless devices
     "kbd"                ; Keyboard and key map utilities
     "kmod"               ; Get 'insmod' & co. from kmod, not module-init-tools, since udev  already depends on it anyway.
     "less"               ; No explaination required
     "lzip"               ; Support lz
     "man-db"             ; Enable manpages
     "man-pages"          ; Linux man pages
     "net-tools"          ; XXX: remove when Inetutils suffices
     "nss-certs"          ; for HTTPS access
     "openssh"            ; ssh client
     "patch"              ; Patch files are useful
     "pciutils"           ; For manipulating PCI devices (lspci and setpci)
     "pcmanfm"            ; File browser
     "pinentry-gtk2"      ; gnupg agent
     "procps"             ; /proc process tools (vmstat, ps, w, etc)
     "psmisc"             ; More /proc process tools
     "rfkill"             ; Even more wireless tools
     "rxvt-unicode"       ; Terminal
     "sed"                ; Search and replace
     "shadow"             ; User management tools (and passwd)
     "sysfsutils"         ; System Utilities Based on Sysfs
     "sudo"               ; The 'sudo' command is already in %SETUID-PROGRAMS, but we also want the other commands and the man pages.
     "tar"                ; Packing of filges
     "tig"                ; git diff viewing
     "tor"                ; Anonymity
     "torsocks"           ; Wrapping alternate apps with tor
     "tree"               ; Handy file directory map generator
     "usbutils"           ; For manipulating USB devices (lsusb)
     "util-linux"         ; For dmesg
     "wget"               ; Downloader
     "which"              ; Find full path
     "wireless-tools"     ; wireless-tools is deprecated in favor of iw, but it's still what  many people are familiar with, so keep it around.
     "xz"                 ; Support xz
     "zile"               ; In the event emacs breaks
     "emacs"              ; gui text editor
     "nano"               ; Pico editor clone with enhancements
     "arandr"             ; Front-end to XRandR
     "autorandr"          ; Automatically sets up monitors
     "xrandr"             ; Configure screens
     "qemu"
     "icecat"
     "icecat"             ; Web Browser
     "sbcl-next"          ; Customizable Lisp-based Browser
     "redshift"           ; Adjust blue light
     "gstreamer"          ; Open source multimedia framework
     "gst-plugins-base"   ; GStreamer plug-ins and elements
     "gst-plugins-good"
     "gst-plugins-bad"
     "gst-libav"
     "pulseaudio"         ; Sound server
     "pavucontrol"        ; PulseAudio Volume Control
     "alsa-utils"         ; Alternative sound support
     ))
