;;; packages.scm --- DynamicMetaFlow custom packages
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
 (guix packages)
 (guix git-download)
 (guix download)
   ((guix licenses) #:prefix license:)
 ((gnu packages compression)
  #:prefix compression:)
 )

(define-public go-hugo
  (let ((commit "579004178b575b4253112fcb23eef002345028c2"))
    (package (inherit go)
      (name "go-hugo")
      (version (git-version "0.55.4" "1" commit))
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
