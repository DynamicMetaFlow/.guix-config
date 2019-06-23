;;; packages.scm --- Guix packages I use

;; Copyright © 2015–2018 Alex Kost <alezost@gmail.com>

;; This program is free software; you can redistribute it and/or modify
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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Lists of packages that I install in my Guix profiles using
;; "guix package --manifest" facility.

;;; Code:

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
