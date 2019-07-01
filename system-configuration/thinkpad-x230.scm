 (use-modules
  (gnu)
  (gnu system nss)
  (gnu services xorg))
 (use-service-modules desktop networking ssh xorg)
 (use-package-modules
  admin
  bash
  certs
  compression
  curl
  emacs
  fonts
  file
  gawk
  guile
  nano
  gnome
  gnupg
  gnuzilla
  less
  linux
  lxde
  man
  password-utils
  pciutils
  screen
  ssh
  suckless
  texinfo
  tmux
  tor
  version-control
  video
  wget
  wm
  xdisorg
  xfce
  xorg
  zile
  ghostscript
  display-managers
  gstreamer
  pulseaudio)

 (operating-system
  (host-name "X230")
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  (bootloader (bootloader-configuration
               (bootloader grub-efi-bootloader)
               (target "/boot/sda")
               (keyboard-layout keyboard-layout)))
  (file-systems (cons (file-system
                       (device (file-system-label "root"))
                       (mount-point "/")
                       (type "ext4"))
                      %base-file-systems))
  (users (cons (user-account
                (name "alexander")
                (comment "Alexander Soto")
                (group "users")
                (home-directory "/home/alexander")
                (supplementary-groups '("wheel"
                                        "audio" "video")))
               %base-user-accounts))

  ;; Globally installed packages.
  ;; The barebones programs needed to get work done
  (packages
   (list
    nss-certs
    bash               ; Get a standard shell
    bash-completion    ; Get proper tab completion
    bzip2              ; Support bz2
    unzip              ; For extracting and viewing files in .zip archives
    coreutils          ; Make bash useful
    curl               ; Web scripting
    diffutils          ; For diffing files
    e2fsprogs          ; EXT filesystem manipulation tools
    eudev              ; Userspace hotplug daemon
    file               ; File type identification utility
    findutils          ; Be able to leverage find
    font-dejavu        ; Baseline fonts
    font-inconsolata
    font-liberation
    font-terminus
    font-ubuntu
    gs-fonts
    font-dejavu
    font-gnu-freefont-ttf
    font-adobe-source-code-pro
    gvfs               ; Userspace virtual file system for GIO
    gawk               ; Awk is rather handy
    git                ; Primary version control
    gnupg              ; Encryption
    grep               ; For searching for strings
 ;   guile-2.2          ; XXX: We don't use (canonical-package guile-2.2) here because that would create a collision in the global profile.
    gzip               ; Support gz
    htop               ; System performance
    slim              ; Simple Login Manager
    inetutils          ; For hostname
    info-reader        ; the standalone Info reader (no Perl)
    iproute            ; Core network routing tools
    isc-dhcp           ; For DHCP
    iw                 ; New standard tool for configuring wireless devices
    kbd                ; Keyboard and key map utilities
    kmod               ; Get 'insmod' & co. from kmod, not module-init-tools, since udev  already depends on it anyway.
    less               ; No explaination required
    lzip               ; Support lz
    man-db             ; Enable manpages
    man-pages          ; Linux man pages
    net-tools          ; XXX: remove when Inetutils suffices
    nss-certs          ; for HTTPS access
    openssh            ; ssh client
    patch              ; Patch files are useful
    pciutils           ; For manipulating PCI devices (lspci and setpci)
    pcmanfm            ; File browser
    pinentry-gtk2      ; gnupg agent
    procps             ; /proc process tools (vmstat, ps, w, etc)
    psmisc             ; More /proc process tools
    rfkill             ; Even more wireless tools
    rxvt-unicode       ; Terminal
    sed                ; Search and replace
    shadow             ; User management tools (and passwd)
    sysfsutils         ; System Utilities Based on Sysfs
    sudo               ; The 'sudo' command is already in %SETUID-PROGRAMS, but we also want the other commands and the man pages.
    tar                ; Packing of filges
    tig                ; git diff viewing
    tor                ; Anonymity
    torsocks           ; Wrapping alternate apps with tor
    tree               ; Handy file directory map generator
    usbutils           ; For manipulating USB devices (lsusb)
    util-linux         ; For dmesg
    wget               ; Downloader
    which              ; Find full path
    wireless-tools     ; wireless-tools is deprecated in favor of iw, but it's still what  many people are familiar with, so keep it around.
    xz                 ; Support xz
    zile               ; In the event emacs breaks
    emacs              ; gui text editor
    which              ; A utility to show the full path of commands
    nano               ; Pico editor clone with enhancements
    arandr             ; Front-end to XRandR
    autorandr          ; Automatically sets up monitors
    xrandr             ; Configure screens
    ))




  ;; System services: add sshd and DHCP to the base services.
  (services (append (list (service dhcp-client-service-type)
                          (service openssh-service-type
                                   (openssh-configuration
                                    (port-number 2222))))
                    %base-services)))
