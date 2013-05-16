;; ****** FOR CLONE ******

;; tells emacs where my personal elisp lib dir is
;; this is the dir you place all your extra packages
;; must create directory first then put .el file in
;;(add-to-list 'load-path "~/.emacs.d/")

;; load the packaged named xyz.

;; to load a .el file when editing, type: M-x eval-buffer

;; ****** GLOBAL PREFERENCES ******

;; SHOULD PUT IN CONDITIONAL, -nw gives errors

(set-face-font 'default "fontset-startup")

; mathematical operators
(set-fontset-font "fontset-startup"
   (cons (decode-char 'ucs #x2200)
         (decode-char 'ucs #x22ff))
    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")

;; misc math a
(set-fontset-font "fontset-startup"
   (cons (decode-char 'ucs #x27c0)
         (decode-char 'ucs #x27ef))
    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


;; misc math b
(set-fontset-font "fontset-startup"
   (cons (decode-char 'ucs #x2980)
         (decode-char 'ucs #x29ff))
    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


;; supplemental mathematical operators
(set-fontset-font "fontset-startup"
   (cons (decode-char 'ucs #x2A00)
         (decode-char 'ucs #x2Aff))
    "-unknown-Asana Math-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


;; (set-face-font 'default "-xos4-Terminus-normal-normal-normal-*-16-*-*-*-c-80-iso10646-1")

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

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/caml-mode")

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
(autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
(autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
(add-to-list 'interpreter-mode-alist '("ocamlrun" . caml-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . caml-mode))

(if window-system (require 'caml-font))
(require 'caml-font)


(add-hook 'tuareg-mode-hook '(lambda ()
	(global-set-key [f9] 'caml-types-show-type)
 	(global-set-key [f10] 'tuareg-eval-phrase)
	(global-set-key [f11] 'mark-whole-buffer)
	(global-set-key [f12] 'tuareg-eval-region)
        (if (featurep 'sym-lock)  
        	(setq sym-lock-mouse-face-enabled nil))
                ;; turn off annoying special face under mouse

))

;; HASKELL

(load "haskell-site-file")
(setq haskell-indentation-mode t)

;; SuperCollider

(add-to-list 'load-path "/usr/local/bin/sclang")
(require 'sclang)

;; Scheme/Racket

(setq scheme-program-name "/usr/bin/racket")
