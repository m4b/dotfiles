;; ****** FOR CLONE ******

;; tells emacs where my personal elisp lib dir is
;; this is the dir you place all your extra packages
;; must create directory first then put .el file in
;;(add-to-list 'load-path "~/.emacs.d/")

;; load the packaged named xyz.

;; to load a .el file when editing, type: M-x eval-buffer

;; ****** GLOBAL PREFERENCES ******

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

(load "haskell-site-file")
(setq haskell-indentation-mode t)

;; SuperCollider

;(add-to-list 'load-path "/usr/local/bin/sclang")
;(require 'sclang)

;; Scheme/Racket

;(setq scheme-program-name "/usr/bin/racket")
