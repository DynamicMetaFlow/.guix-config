;;; packages.scm --- DynamicMetaFlow's custom packages
;;
;; Description: Guix packages not upstreamed to guix proper
;; Author: Amar Singh
;; Maintainer: Amar Singh<DynamicMetaFlow@disroot.org>
;; URL: http://DynamicMetaFlow.info.tm:9000/emacs/shroud.el
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
(define-module
  (DynamicMetaFlow packages))
(use-modules
 (srfi srfi-1)
 (ice-9 match)
 (guix utils)
 (guix records)
 (guix packages)
 (guix git-download)
 (guix download)
 (guix cvs-download)
 (guix build-system trivial)
 (guix build-system python)
 (guix build-system perl)
 (guix build-system gnu)
 (guix build-system glib-or-gtk)
 (guix build-system emacs)
 (guix build-system cmake)
 (gnu packages xorg)
 (gnu packages xml)
 (gnu packages xiph)
 (gnu packages xdisorg)
 (gnu packages wxwidgets)
 (gnu packages wordnet)
 (gnu packages wget)
 (gnu packages web)
 (gnu packages w3m)
 (gnu packages video)
 (gnu packages version-control)
 (gnu packages tls)
 (gnu packages texinfo)
 (gnu packages tex)
 (gnu packages telephony)
 (gnu packages tcl)
 (gnu packages sqlite)
 (gnu packages shells)
 (gnu packages serialization)
 (gnu packages sdl)
 (gnu packages scheme)
 (gnu packages ruby)
 (gnu packages regex)
 (gnu packages re2c)
 (gnu packages qt)
 (gnu packages python-xyz)
 (gnu packages python)
 (gnu packages pulseaudio)
 (gnu packages pretty-print)
 (gnu packages pkg-config)
 (gnu packages perl)
 (gnu packages pdf)
 (gnu packages pciutils)
 (gnu packages password-utils)
 (gnu packages package-management)
 (gnu packages nss)
 (gnu packages node)
 (gnu packages ninja)
 (gnu packages ncurses)
 (gnu packages music)
 (gnu packages mp3)
 (gnu packages mail)
 (gnu packages lua)
 (gnu packages llvm)
 (gnu packages linux)
 (gnu packages libunistring)
 (gnu packages libevent)
 (gnu packages lesstif)
 (gnu packages imagemagick)
 (gnu packages image)
 (gnu packages image)
 (gnu packages icu4c)
 (gnu packages haskell)
 (gnu packages guile)
 (gnu packages gtk)
 (gnu packages gperf)
 (gnu packages gnupg)
 (gnu packages gnunet)
 (gnu packages gnome)
 (gnu packages glib)
 (gnu packages gl)
 (gnu packages ghostscript)
 (gnu packages gettext)
 (gnu packages gd)
 (gnu packages gcc)
 (gnu packages fribidi)
 (gnu packages fontutils)
 (gnu packages flex)
 (gnu packages emacs-xyz)
 (gnu packages emacs)
 (gnu packages databases)
 (gnu packages cups)
 (gnu packages compression)
 (gnu packages code)
 (gnu packages cmake)
 (gnu packages chromium)
 (gnu packages bison)
 (gnu packages bash)
 (gnu packages base)
 (gnu packages autotools)
 (gnu packages audio)
 (gnu packages algebra)
 (gnu packages admin)
 (gnu packages acl)
 ((guix licenses) #:prefix license:)
 ((gnu packages compression)
  #:prefix compression:)
 )
(define-public qtwebengine
  (package (inherit qtsvg)
    (name "qtwebengine")
    (version "5.11.3")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://download.qt.io/official_releases/qt/"
                       (substring version 0 4)
                       "/" version "/submodules/"
                       (string-append name "-everywhere-src-" version)
                       ".tar.xz"))
       (sha256
        (base32
         "1zmqsdais85cdfh2jh8h4a5jcamp1mzdk3vgqm6xnldqf6nrxd2v"))))
    (build-system gnu-build-system)
    (native-inputs
     `(
       ;; ("perl" ,perl)
       ("python-2" ,python-2)
       ("pkg-config" ,pkg-config)
       ("bison" ,bison)
       ("flex" ,flex)
       ;; ("ruby" ,ruby)
       ("gperf" ,gperf)
       ("ninja" ,ninja)
       ("clang" ,clang)

       ;; More missing binaries
       ("ruby" ,ruby)
       ("perl" ,perl)
       ("node" ,node)
       ("tcl" ,tcl)


       ))
    (inputs
     `(
       ;; More missing stuff
       ("libjpeg" ,libjpeg)
       ("jsoncpp" ,jsoncpp)
       ("lcms" ,lcms)
       ("libevent" ,libevent)
       ("libsrtp" ,libsrtp)
       ("libvpx" ,libvpx)
       ("libwebp" ,libwebp)
       ("libxml2" ,libxml2)
       ("libxslt" ,libxslt)
       ("minizip" ,minizip)
       ("opus" ,opus)
       ("re2" ,re2)
       ("snappy" ,snappy)
       ("ffmpeg" ,ffmpeg)
       ("icu4c" ,icu4c)
       ("python" ,python)



       ;; qtbase
       ("qtbase" ,qtbase)

       ;; Missing module: qml quick
       ("qtdeclarative" ,qtdeclarative)

       ("libxcb" ,libxcb)
       ("xcb-util" ,xcb-util)
       ;; oDynamicMetaFlow if more xcb-* depends are required, add them
       ("libxkbcommon" ,libxkbcommon)
       ("libx11" ,libx11)
       ("libxrender" ,libxrender)
       ("libxi" ,libxi)
       ;; OpenGL
       ("mesa" ,mesa)
       ;; Qt Quick 2; missing

       ;; Accessibility
       ;; ("python-atspi" ,python-atspi)
       ;; ("dbus" ,dbus)

       ;; Qt webkit; Optional?
       ;; ("qtwebkit" ,qtwebkit)

       ;; qt web engine
       ;; Also requires these?
       ("libdrm" ,libdrm)
       ("libxscrnsaver" ,libxscrnsaver)

       ("libgcrypt" ,libgcrypt)
       ("pciutils" ,pciutils)
       ("nss" ,nss)
       ("libxtst" ,libxtst)
       ("cups-minimal" ,cups-minimal)
       ("pulseaudio" ,pulseaudio)
       ("libgudev" ,libgudev)
       ;; systemd-devel? no systemd on guix
       ("libcap" ,libcap)
       ("alsa-lib" ,alsa-lib)
       ("dbus" ,dbus)
       ("libxrandr" ,libxrandr)
       ("libxcomposite" ,libxcomposite)
       ("libxcursor" ,libxcursor)
       ("fontconfig" ,fontconfig)
       ("atk" ,atk)
       ;; qt multimedia
       ("qtmultimedia" ,qtmultimedia)
       ;; qdoc documentation generator tool

       ;; warning: A compatible version of re2c (>= 0.11.3) was not
       ;; found; changes to src/*.in.cc will not affect your build.
       ("re2c" ,re2c)
       ))
;;     (arguments
;;      `(#:phases
;;        (modify-phases %standard-phases
;;          (add-before 'configure 'configure-qmake
;;            (lambda* (#:key inputs outputs #:allow-other-keys)
;;              (let* ((out (assoc-ref outputs "out"))
;;                     (qtbase (assoc-ref inputs "qtbase"))
;;                     (tmpdir (string-append (getenv "TMPDIR")))
;;                     (qmake (string-append tmpdir "/qmake"))
;;                     (qt.conf (string-append tmpdir "/qt.conf")))
;;                ;; Use qmake with a customized qt.conf to override install
;;                ;; paths to $out.
;;                (symlink (which "qmake") qmake)
;;                (setenv "PATH" (string-append tmpdir ":" (getenv "PATH")))
;;                (with-output-to-file qt.conf
;;                  (lambda ()
;;                    (format #t "[Paths]
;; Prefix=~a
;; ArchData=lib/qt5
;; Data=share/qt5
;; Documentation=share/doc/qt5
;; Headers=include/qt5
;; Libraries=lib
;; LibraryExecutables=lib/qt5/libexec
;; Binaries=bin
;; Tests=tests
;; Plugins=lib/qt5/plugins
;; Imports=lib/qt5/imports
;; Qml2Imports=lib/qt5/qml
;; Translations=share/qt5/translations
;; Settings=etc/xdg
;; Examples=share/doc/qt5/examples
;; HostPrefix=~a
;; HostData=lib/qt5
;; HostBinaries=bin
;; HostLibraries=lib

;; [EffectiveSourcePaths]
;; HostPrefix=~a
;; HostData=lib/qt5
;; " out out qtbase)))
;;                #t)))
;;          (replace 'configure
;;            (lambda* (#:key inputs outputs #:allow-other-keys)
;;              ;; Valid QT_BUILD_PARTS variables are:
;;              ;; libs tools tests examples demos docs translations
;;              (invoke "qmake" "QT_BUILD_PARTS = libs tools tests")))
;;          (add-before 'check 'set-display
;;            (lambda _
;;              ;; make Qt render "offscreen", required for tests
;;              (setenv "QT_QPA_PLATFORM" "offscreen")
;;              #t))
;;          (add-before 'build 'alias-cc
;;            (lambda _
;;              ;; make Qt render "offscreen", required for tests
;;              (invoke "alias" "cc=gcc")
;;              #t))

;; )))
    (home-page "https://www.qt.io")
    (synopsis "Qt5WebEngine")
    (description "Qt5WebEngine for nomad. Provides support for web
applications using the Chromium browser project.")
    (license license:gpl3+)))
(define-public nomad
  (package
    (name "nomad")
    (version "34e6c58977cfe472b96442b4de07a6caf189f74d")
    ;; feature-qt branch
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/mrosset/nomad")
         (commit version)))
       (file-name
        (git-file-name name version))
       (sha256
        (base32
         "1prs0ws8ybfm65mh6mvnzlgfpfp2vfqrlcckkzqk95zxbks86kl5"))))
    (build-system gnu-build-system)
    (inputs
     `(
       ("pkg-config" ,pkg-config)
       ("glib" ,glib)
       ("autoconf" ,autoconf)
       ("automake" ,automake)
       ("gettext-minimal" ,gettext-minimal)
       ("guile-2.2" ,guile-2.2)
       ("qtwebengine" ,qtwebengine)
       ("qtbase" ,qtbase)
       ("qtquickcontrols2" ,qtquickcontrols2)
       ("qttools" ,qttools)
       ("qtquickcontrols" ,qtquickcontrols)
       ("qtwebchannel" ,qtwebchannel)
       ("qtsvg" ,qtsvg)
       ;; ("qml-module-qtquick2",qml-module-qtquick2)
       ;; maybe qtquickcontrols also
       ;; ("qml-module-qtwebengine",qml-module-qtwebengine)
       ;; ("qml-module-qtquick-layouts",qml-module-qtquick-layouts)
       ;; ("libqtermwidget5-0",libqtermwidget5-0)
       ("qtwayland" ,qtwayland)
       ;;?? ^libqtermwidget
       ))
    (home-page "https://github.com/mrosset/nomad")
    (synopsis "An extensible web browser using Gnu Guile and QT.")
    (description "An extensible web browser.")
    (license license:gpl3+)))

(define-public emacs-shroud
  (let
      ((commit "635ef2b7c749360ee30347fbbfe30bd245844716"))
    (package
      (name "emacs-shroud")
      (version
       (git-version "v1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/o-DynamicMetaFlow/emacs-shroud")
           (commit commit)))
         (file-name
          (git-file-name name version))
         (sha256
          (base32
           "1xsi8gf80jqn5m3czffxbq9fsn2vp6wccvyj16jrss7j4yvc6n57"))))
      (build-system emacs-build-system)
      (inputs
       `(("emacs-f" ,emacs-f)
         ("emacs-bui" ,emacs-bui)
         ("shroud" ,shroud)))
      (home-page "http://git.DynamicMetaFlow.info.tm:9001/shroud.git")
      (synopsis "Emacs interface for Shroud password manager")
      (description
       "This package provides functions for working with shroud
password manager using Elisp, a reader for Shroud DB, and an Buffers
User Interface for using shroud password database.")
      (license license:gpl3+))))
(define-public emacs-share
  (package
    (name "emacs-share")
    (version "f07a4614d2d22c804bfda7b2cea846e393cd8050")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/o-DynamicMetaFlow/emacs-share")
         (commit version)))
       (file-name
        (git-file-name name version))
       (sha256
        (base32
         "1yzndxrn1dk51sn611xyxqshg0sgkcis4mbibqfifbwp2yvky380"))))
    (build-system emacs-build-system)
    (inputs
     `(
       ("emacs-f" ,emacs-f)
       ("emacs-transient" ,emacs-bui)
       ))
    (home-page "http://git.DynamicMetaFlow.info.tm:9001/emacs-share.git")
    (synopsis "Share media using Emacs.")
    (description
     "Abstractions for sharing media using elisp and a Transient
interface for Emacs.")
    (license license:gpl3+)))
(define-public julius
  (let
      ((commit "8c60cb8c99998bad8c04e6e50810596b80309eea"))
    (package
      (name "julius")
      (version
       (git-version "4.5" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/julius-speech/julius")
           (commit commit)))
         (file-name
          (git-file-name name version))
         (sha256
          (base32
           "11qbp9kid251lx6li4fv1r6l0pixxcs1m00sax1z057bhcv4jc7a"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (delete 'check))))
      (inputs
       `(("alsa-lib" ,alsa-lib)
         ("zlib" ,zlib)
         ("sdl2" ,sdl2)
         ("perl" ,perl)))
      (home-page "https://github.com/julius-speech/julius")
      (synopsis "Large vocabulary continuous speech recognition
engine")
      (description
       "Julius is a high-performance, small-footprint large vocabulary
continuous speech recognition @acronym(LVCSR, large vocabulary
continous speech recognition) decoder software for speech-related
researchers and developers. Based on word N-gram and context-dependent
HMM, it can perform real-time decoding on various computers and
devices from micro-computer to cloud server.")
      (license
       (license:non-copyleft "http://julius.osdn.jp/LICENSE.txt"
                             "Julius-Modified-BSD-4Clause")))))
(define-public oddmuse
  ;; TODO: add oddmuse service using fastcgiwrap
  (let
      ((commit "5d7964977cd292365800396563fe365a971d184f"))
    (package
      (name "oddmuse")
      (version
       (git-version "1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://alexschroeder.ch/cgit/oddmuse")
           (commit commit)))
         (file-name
          (git-file-name name version))
         (sha256
          (base32 "023kf2h91r1zmbpkk5nlzwr7sz5sh2gc97gpfc9c6yn1g6k858l7"))))
      (build-system trivial-build-system)
      (arguments
       `(#:modules
         ((guix build utils))
         #:builder
         (begin
           (use-modules
            (guix build utils))
           (copy-recursively
            (assoc-ref %build-inputs "source")
            (assoc-ref %outputs "out"))
           #t)))
      (inputs
       `(("perl" ,perl)
         ("perl-libwww" ,perl-libwww)
         ("perl-libxml" ,perl-libxml)
         ("perl-xml-rss" ,perl-xml-rss)
         ("diffutils" ,diffutils)))
      (propagated-inputs
       `(("nginx" ,nginx)))
      (home-page "https://oddmuse.org")
      (synopsis "Oddmuse is a program to run a wiki.")
      (description "A wiki can be used for communication in a team or
for documentation, when things have to be quick and easy: Content
Management for everybody. For many free software projects wikis have
taken an important role somewhere between manual, FAQ, IRC, and
mailing lists.")
      (license license:gpl3+))))
(define-public celestia
  (let ((commit "1495531a039fe7aa594f7a541e8242243f712858"))
    (package
      (name "celestia")
      (version (git-version "1.6.1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url
            "https://github.com/celestiaproject/celestia")
           (commit commit)))
         (sha256
          (base32
           "1fby6h6na5awv4w2plzxdvb2xmdd8xbkkwhnmizlm2b7vmxhzrv3"))))
      (build-system cmake-build-system)
      (native-inputs
       `(("perl" ,perl)
         ("libgit2" ,libgit2)
         ("zsh" ,zsh)
         ("cmake" ,cmake)
         ("pkg-config" ,pkg-config)
         ("libtool" ,libtool)
         ("gettext" ,gettext-minimal)))
      (inputs
       `(("freeglut" ,freeglut)
         ("qt" ,qt)
         ("glu" ,glu)
         ("glew" ,glew)
         ("libtheora" ,libtheora)
         ("libjpeg" ,libjpeg)
         ("libpng" ,libpng)
         ("fmt" ,fmt)
         ("eigen" ,eigen)))
      (propagated-inputs
       `(("lua" ,lua)))
      (arguments
       `(#:modules
         ((srfi srfi-1)
          (guix build utils)
          (guix build cmake-build-system))
         #:configure-flags
         '("-DENABLE_QT=ON")
         ;; #:phases (fold alist-delete
         ;;                (modify-phases %standard-phases
         ;;                  (add-before 'configure
         ;;                      'bootstrap (lambda* (#:key outputs #:allow-other-keys)
         ;;                                   (invoke "cmake ."))))
         ;;                '(bootstrap configure check))
         )
       )
      (home-page "https://celestia.space/")
      (synopsis "Celestia - real-time 3D visualization of space.")
      (description
       "The free space simulation that lets you explore our universe in
three dimensions. Celestia simulates many different types of celestial objects. From planets and moons to star clusters and galaxies, you can visit every object in the expandable database and view it from any point in space and time. The position and movement of solar system objects is calculated accurately in real time at any rate desired.")
      (license license:gpl2))))

(define-public uassets
  (let
      ((commit "e45d27bc4f164c9a7e6106eb711eaf079b8fd178"))
    (package
      (name "uassets")
      (version
       (git-version "1.18" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/uBlockOrigin/uAssets.git")
           (commit commit)))
         (file-name
          (string-append name "-" version "-checkout"))
         (sha256
          (base32
           "03xw7i9bnwrrp6s2l1ki97nv46zwk4fha7xzgxj1504n0as1il4x"))))
      (build-system trivial-build-system)
      (arguments
       `(#:modules
         ((guix build utils))
         #:builder
         (begin
           (use-modules
            (guix build utils))
           (copy-recursively
            (assoc-ref %build-inputs "source")
            (assoc-ref %outputs "out"))
           #t)))
      (home-page "https://github.com/uBlockOrigin/uAssets")
      (synopsis "Filter lists and rulesets for uBlock and uMatrix")
      (description "Resources for uBlock Origin, uMatrix: static filter
lists, ready-to-use rulesets, etc.")
      (license license:gpl3+))))
(define-public ublock
  (let
      ((commit "43ecffc2955ac1f1d80d33c2efcbadf976fce7c7"))
    (package
      (name "ublock")
      (version
       (git-version "1.18" "17b10" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/gorhill/uBlock.git")
           (commit commit)))
         (sha256
          (base32
           "0pqx24iqb5q7242d65nyq9qdzzvihy7jbqyxjrq07cx071v9351r"))))
      (build-system gnu-build-system)
      (native-inputs
       `(("uassets" ,uassets)
         ("python" ,python-wrapper)
         ("zip" ,compression:zip)))
      ;; TODO: split the outputs?
      (outputs
       '("out" "chromium" "firefox" "xpi"))
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'copy-assets
             (lambda*
                 (#:key outputs #:allow-other-keys)
               (copy-recursively
                (assoc-ref %build-inputs "uassets")
                "../uAssets")
               #t))
           (delete 'configure)
           (replace 'build
             (lambda _
               (begin
                 (zero?
                  (system* "./tools/make-firefox.sh"
                           "all"))
                 (zero?
                  (system* "./tools/make-chromium.sh"
                           "all")))))
           (replace 'install
             (lambda*
                 (#:key outputs #:allow-other-keys)
               (let*
                   ((out
                     (assoc-ref outputs "out"))
                    (chromium-dir
                     (assoc-ref outputs "chromium"))
                    (firefox-dir
                     (assoc-ref outputs "firefox"))
                    (xpi-dir
                     (assoc-ref outputs "xpi")))
                 (copy-recursively "dist/build/uBlock0.chromium"
                                   chromium-dir)
                 (copy-recursively "dist/build/uBlock0.firefox"
                                   firefox-dir)
                 (install-file "dist/build/uBlock0.firefox.xpi"
                               xpi-dir)
                 #t))))))
      (home-page "https://github.com/gorhill/uBlock")
      (synopsis "uBlock Origin (or uBlock₀) is not an ad blocker; it's a
general-purpose blocker.")
      (description
       "uBlock Origin (or uBlock₀) is not an ad blocker; it's a
general-purpose blocker. uBlock Origin blocks ads through its support
of the Adblock Plus filter syntax. uBlock Origin extends the syntax
and is designed to work with custom rules and filters.")
      (license license:gpl3+))))

(use-modules (gnu packages golang)
             (guix build-system go))
(define-public go-hugo
  (let ((commit "7611078daef32306ab31fe360db9895cdd3626d3"))
    (package (inherit go)
      (name "go-hugo")
      (version (git-version "0.55.6" "1" commit))
      (source (origin (method git-fetch)
                      (uri (git-reference
                            (url "https://github.com/gohugoio/hugo")
                            (commit commit)))
                      (file-name (git-file-name name version))
                      (sha256 (base32
                               "0hbkl8dhhdic0admrkvlp1h1bmfrrwfnvipx27clyk0f88jcvb7y"))))
      (home-page "https://gohugo.io/")
      (build-system go-build-system)
      (inputs
       `(
         ("go-github-com-burntsushi-locker"
          ,go-github-com-burntsushi-locker)
         ("go-github-com-burntsushi-toml"
          ,go-github-com-burntsushi-toml)
         ))
      (arguments
       `(
         ;; #:unpack-path "github.com/gohugoio/hugo"
         #:import-path "github.com/gohugoio/hugo"
         ))
      (synopsis "A static HTML and CSS website generator written
in Go.")
      (description "Hugo takes a directory with content and templates
and renders them into a full HTML website. It relies on Markdown
files with front matter for metadata, and you can run it from any
directory.")
      (license license:asl2.0))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages.scm ends here
