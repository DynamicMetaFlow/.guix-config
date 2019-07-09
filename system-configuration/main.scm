(use-modules (gnu)
             (gnu packages cups)
             (gnu packages certs)
             (gnu packages virtualization)
             (gnu packages fontutils)
             (gnu packages aspell))
(use-service-modules desktop networking ssh xorg cups)
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
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (keyboard-layout
  (keyboard-layout "us" "altgr-intl"))
 (bootloader
  (bootloader-configuration
   (bootloader grub-bootloader)
   (target "/dev/sda")
   (keyboard-layout keyboard-layout)))
 (mapped-devices
  (list (mapped-device
         (source
          (uuid "284aa285-b3dc-46a2-bf8e-b71362d884ba"))
         (target "cryptroot")
         (type luks-device-mapping))
        (mapped-device
         (source
          (uuid "0010c821-2527-49ea-b956-1c8ca9323da0"))
         (target "crypthome")
         (type luks-device-mapping))))
 (file-systems
  (cons* (file-system
          (mount-point "/")
          (device "/dev/mapper/cryptroot")
          (type "ext4")
          (dependencies mapped-devices))
         (file-system
          (mount-point "/home")
          (device "/dev/mapper/crypthome")
          (type "ext4")
          (dependencies mapped-devices))
         %base-file-systems))
 (firmware (cons* %base-firmware))
 (host-name "X230")
 (users (cons* (user-account
                (name "alexander")
                (comment "Alexander")
                (group "users")
                (home-directory "/home/alexander")
                (supplementary-groups
                 '("wheel" "netdev" "audio" "video" "lp")))
               %base-user-accounts))

 (packages
  (cons* nss-certs
         bash               ; Get a standard shell
         bash-completion    ; Get proper tab completion
         unzip              ; For extracting and viewing files in .zip archives
         curl               ; Web scripting
         e2fsprogs          ; EXT filesystem manipulation tools
         eudev              ; Userspace hotplug daemon
         file               ; File type identification utility
         gvfs               ; Userspace virtual file system for GIO
         git                ; Primary version control
         scrot              ; Screen Capture Utility
         gnupg              ; Encryption
         htop               ; System performance
         slim               ; Simple Login Manager
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
         pciutils           ; For manipulating PCI devices (lspci and setpci)
         pcmanfm            ; File browser
         pinentry-gtk2      ; gnupg agent
         procps             ; /proc process tools (vmstat, ps, w, etc)
         psmisc             ; More /proc process tools
         rfkill             ; Even more wireless tools
         rxvt-unicode       ; Terminal
         shadow             ; User management tools (and passwd)
         sysfsutils         ; System Utilities Based on Sysfs
         sudo               ; The 'sudo' command is already in %SETUID-PROGRAMS, but we also want the other commands and the man pages.
         tig                ; git diff viewing
         tor                ; Anonymity
         torsocks           ; Wrapping alternate apps with tor
         tree               ; Handy file directory map generator
         usbutils           ; For manipulating USB devices (lsusb)
         util-linux         ; For dmesg
         wget               ; Downloader
         which              ; Find full path
         wireless-tools     ; wireless-tools is deprecated in favor of iw, but it's still what  many people are familiar with, so keep it around.
         zile               ; In the event emacs breaks
         emacs              ; operating system
         which              ; A utility to show the full path of commands
         nano               ; Pico editor clone with enhancements
         arandr             ; Front-end to XRandR
         autorandr          ; Automatically sets up monitors
         xrandr             ; Configure screen
         qemu               ; a hosted virtual machine monitor
         powertop           ; Analyze power consumption on Intel-based laptops
         aspell             ; Interactive Spell Checker
         cups               ; Open source printing system
	 pulseaudio         ; Sound System
	 pavucontrol        ; Pulseaudio Volume control
	 alsa-utils         ; Alsa Utilities
	 redshift           ; Set color temperature of display
	 surf               ; Simple web browser
	 gstreamer          ; Multimedia framework
	 gst-plugins-base   ; GStreamer plug-ins and elements
	 gst-plugins-good
	 gst-plugins-bad
	 gst-libav
         fontconfig
	 font-dejavu        ; Baseline fonts
         font-inconsolata
         font-liberation
         font-terminus
         font-ubuntu
         gs-fonts
         font-dejavu
         font-gnu-freefont-ttf
         font-adobe-source-code-pro
         lshw
	 %base-packages))

 (services
  (append
   (list (service xfce-desktop-service-type)
	 (service cups-service-type)
         (set-xorg-configuration
          (xorg-configuration
           (extra-config '("Section \"Device\"
                     Identifier  \"Intel Graphics\"
                     Driver      \"intel\"
                     Option      \"TearFree\" \"true\"
                   EndSection"))
           (keyboard-layout keyboard-layout))))
     %desktop-services)))
