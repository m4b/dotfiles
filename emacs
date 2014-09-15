;; ****** GLOBAL PREFERENCES ******
;; Emacs Package Manager
;; update with:
;; package-refresh-contents
;; install packages:
;; package-install <RET>
;; <package-name>
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; SHOULD PUT IN CONDITIONAL, -nw gives errors
(set-face-font 'default "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;(set-face-font 'default "fontset-startup")

; mathematical operators
;(set-fontset-font "fontset-startup"
;   (cons (decode-char 'ucs #x2200)
;         (decode-char 'ucs #x22ff))
;    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")

;; misc math a
;(set-fontset-font "fontset-startup"
;   (cons (decode-char 'ucs #x27c0)
;         (decode-char 'ucs #x27ef))
;    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


;; misc math b
;(set-fontset-font "fontset-startup"
;   (cons (decode-char 'ucs #x2980)
;         (decode-char 'ucs #x29ff))
;    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


;; supplemental mathematical operators
;(set-fontset-font "fontset-startup"
;   (cons (decode-char 'ucs #x2A00)
;         (decode-char 'ucs #x2Aff))
;    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


;(set-face-font 'default "-xos4-Terminus-normal-normal-normal-*-16-*-*-*-c-80-iso10646-1")

;;(set-face-font 'default "-xos4-terminus-medium-r-normal--20-*-72-72-c-100-iso10646-1")

;;(set-face-font 'default "fixed")

(fset 'vchange
   [?\C-x ?o ?\C-x ?1 ?\C-x ?3 ?\C-x ?b return])
(global-set-key (kbd "C-M-m") 'vchange);; make two screens vertical; have not tested with more than 2 screens but seems to be working quite nicely

(global-set-key [f1] 'switch-to-buffer)
(global-set-key [f2] 'other-window)
(global-set-key [f3] 'insert-char)
(global-set-key [C-tab] 'other-window)
;;(tool-bar-mode 0) ;won't work in terminal


(set-background-color "black")
(set-foreground-color "white")

(toggle-scroll-bar 0)
(tool-bar-mode 0)
(menu-bar-mode 1) 
(global-linum-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)

(setq 
line-spacing 2
confirm-kill-emacs nil 
confirm-save-buffers nil
show-paren-style 'mixed 
show-parent-delay 0 
ring-bell-function 'ignore
font-lock-maximum-decoration t
 frame-title-format "%b (%f)" )

(show-paren-mode t)
(global-font-lock-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)

;; ****** LATEX-MODE ****** thank you Mr. Knuth et. al ******

(add-hook 'LaTeX-mode-hook '(lambda ()
	(setq TeX-PDF-mode t)))

;; ****** TUAREG-MODE ****** merci INRIA pour OCaml******

  (setq auto-mode-alist (cons '("\\.ml[iylp]?\\'" . tuareg-mode) auto-mode-alist))
  (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
  (autoload 'ocamldebug "ocamldebug" "Run the Caml debugger" t)


;; HASKELL

;;(load "haskell-mode-autoloads")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; SuperCollider

(add-to-list 'load-path "/usr/local/bin/sclang")
(require 'sclang)

;; Scheme/Racket

;(setq scheme-program-name "/usr/bin/racket")

;; LUA

;;(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
;;(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; hacky because package manager not working...
;;(add-to-list 'load-path "/home/m4b/git/scala-mode2/")
;;(require 'scala-mode2)



;(defvar scala-mode-map
;  (let ((map (make-sparse-keymap)))
;;    (define-key map [?\C-x ?\C-d] 'inferior-haskell-send-decl)
;;    (define-key map [?\C-c ?\C-z] 'switch-to-haskell)
;;    (define-key map [?\C-c ?\C-l] 'inferior-haskell-load-file)
;;    map)
;;  "Keymap used in Scala mode.")

;; ESS - Emacs Speaks Statistics
(setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
(require 'ess-site)

;; android
(require 'android-mode)
(setq android-mode-sdk-dir "/opt/android-sdk/")
(setq android-mode-avd "foo")

;; TEST EMEL
(add-to-list 'load-path "/home/m4b/emacs/emel/emel-mode/")
;;(setq emel-program-name "/home/m4b/emacs/emel/emel-mode/emli	")
(require 'emel-mode)

;; elm
(add-to-list 'load-path "/home/m4b/git/elm-mode")
(require 'elm-mode)

;; auto fill out lisp docs
(auto-insert-mode t)

;; ats mode
(require 'ats-mode)
