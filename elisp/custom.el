; 
;; custom.el - local emacs custom script for free work.
;;
;; Copyright (c) 2013 Sagar Kadamati <sagar.kadamati@ap.sony.com>
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted.
;;
;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
;; IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
;; OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
;; IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
;; INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
;; NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
;; THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
; How to install:
; Place this file into your load-path directory. like this,
; % cp custom.el ~/.emacs.d
; and add this line into your .emacs.
; (load "~/.emacs.d/custom.el")
;
;; -*- mode: emacs-lisp; -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cp /usr/share/emacs/23.3/etc/e/eterm-color* ~/.terminfo/e/

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sagar's Personal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq debug-on-error t)
(setq c-default-style "linux")

(cond ((> emacs-major-version 20)
       (tool-bar-mode -1)
       (menu-bar-mode -1)
       (scroll-bar-mode -1)
       ;; (menu-bar-showhide-fringe-menu-customize-disable)
       (blink-cursor-mode -1)
       (windmove-default-keybindings 'meta)))

(display-time)
;; (elscreen-toggle-display-tab)

;; (set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line nil
   :box nil
   :background "#EEE8D5"
   :overline "#EEE8D5"
   :underline "#EEE8D5")

(set-face-attribute 'mode-line-inactive nil :box nil)
(set-face-attribute 'mode-line-highlight nil :box nil)

;; Highlight line
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#f1e7d0")
;; (set-face-background 'hl-line "#EEE8D5")
(set-face-background 'hl-line "#F9F3E2")

(set-cursor-color "#657B83")

(defun no-modeline()
  (interactive)
  (setq mode-line-format nil))

(defun toggle-mode-line () "toggles the modeline on and off"
  (interactive) 
  (setq mode-line-format
    (if (equal mode-line-format nil)
        (default-value 'mode-line-format)) )
  (redraw-display))

(global-set-key [M-f12] 'toggle-mode-line)

(defun switch-fullscreen nil
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
     (selected-frame)
     (list (cons 'fullscreen next)))))

(global-set-key (kbd "C-; f f")  'switch-fullscreen)

(setq default-frame-alist
      (append default-frame-alist
       '((foreground-color . "#657B83")
	 (background-color . "#FDF6E3")
	 (cursor-color . "#000070")
	 (frame-name "Little"))
       ))


(set-face-attribute  'font-lock-string-face nil :weight 'medium)
;; (set-face-foreground 'font-lock-string-face "#657B83")
;; (set-face-foreground 'font-lock-string-face "#586e75")
(set-face-foreground 'font-lock-string-face "#2aa198")
(set-face-foreground 'font-lock-constant-face "#2aa198")
(set-face-foreground 'font-lock-negation-char-face "#2aa198")

(set-face-foreground 'font-lock-comment-delimiter-face "light pink")
(set-face-attribute  'font-lock-comment-face nil :weight 'medium :slant 'italic)
;; (set-face-foreground 'font-lock-comment-face "light pink")
(set-face-foreground 'font-lock-comment-face "#93a1a1")

(set-face-attribute  'font-lock-keyword-face nil :weight 'medium)
(set-face-foreground 'font-lock-keyword-face "#586e75")

(set-face-foreground 'font-lock-type-face "#b58900")
(set-face-foreground 'font-lock-preprocessor-face "#6c71c4")

(set-face-attribute  'font-lock-function-name-face nil :weight 'bold)
(set-face-foreground 'font-lock-function-name-face "#586e75")
;; "#859900")

(set-background-color "#FDF6E3")
(set-foreground-color "#657B83")

(set-face-background 'fringe "#EEE8D5")

(set-face-background 'mode-line "#EEE8D5")
(set-face-foreground 'mode-line "#657B83")

(set-face-background 'mode-line-inactive "#EEE8D5")
(set-face-foreground 'mode-line-inactive "#657B83")

(set-face-foreground 'vertical-border "#EEE8D5")

(set-face-background 'shadow "#657B83")
(set-face-foreground 'shadow "#FDF6E3")

(set-face-background 'region "#EEE8D5")
(set-face-foreground 'region nil)

;; Setting whitespace colors
;; (set-face-background 'whitespace-tab "#EEE8D5")
;; (set-face-background 'whitespace-space "#EEE8D5")
;; (set-face-background 'whitespace-empty "#EEE8D5")
;; (set-face-background 'whitespace-hspace "#EEE8D5")
;; (set-face-background 'whitespace-indentation "#EEE8D5")
;; (set-face-background 'whitespace-line "#EEE8D5")
;; (set-face-background 'whitespace-newline "#EEE8D5")
;; (set-face-background 'whitespace-space "#EEE8D5")
;; (set-face-background 'whitespace-space-after-tab "#EEE8D5")
;; (set-face-background 'whitespace-space-before-tab "#EEE8D5")
;; (set-face-background 'whitespace-tab "#EEE8D5")
;; (set-face-background 'whitespace-trailing "#EEE8D5")

;; (setq frames (frame-list))
;; (setq frames-len (- (list-length frames) 1))
;; (if (= frames-len 2)
;;     (princ frames-len)
;;   ;; (set-frame-name "emacs-main")
;;   (princ frames-len)
;;   ;; t
;;   )

(setq term-default-bg-color "#f1e7d0")
(setq term-default-fg-color "Black")

;; frame transparent mode
(set-frame-parameter (selected-frame) 'alpha '(100 95))
(add-to-list 'default-frame-alist '(alpha 100 95))

;; open file at the location
(ffap-bindings)

;; use clipboard for coping
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; unset global key
(global-unset-key (kbd "C-;"))                                       ; unset the `C-;` key

;; buffer menu
(global-set-key (kbd "C-; b m")   'buffer-menu)                      ; list buffer menu

;; revert buffer
(global-set-key (kbd "C-; b r b") 'revert-buffer)                    ; revert buffer

;; buffer changing
(global-set-key (kbd "C-; b p")   'previous-buffer)                  ; prev-buffer
(global-set-key (kbd "C-; b n")   'next-buffer)                      ; next-buffer
(global-set-key (kbd "C-; b r o") 'toggle-read-only)                 ; read-only-buffer

;; goto buffer starting, and end
(global-set-key (kbd "C-; b b")   'beginning-of-buffer)              ; goto beging of the buffer
(global-set-key (kbd "C-; b e")   'end-of-buffer)                    ; goto end of the buffer
(global-set-key (kbd "C-; b s")   'save-buffer)                      ; save buffer
(global-set-key (kbd "C-; b q")   'kill-buffer)                      ; kill the buffer

(require 'windmove)

;; window keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; moving windows
(global-set-key (kbd "C-; w l")   'windmove-right)                   ; move to left windnow
(global-set-key (kbd "C-; w h")   'windmove-left)                    ; move to right window
(global-set-key (kbd "C-; w k")   'windmove-up)                      ; move to upper window
(global-set-key (kbd "C-; w j")   'windmove-down)                    ; move to down window

;; window spliting
(global-set-key (kbd "C-; w v")   'split-window-vertically)          ; split window vertically
(global-set-key (kbd "C-; w s")   'split-window-horizontally)        ; split window horizontally
(global-set-key (kbd "C-; w q")   'delete-window)                    ; kill splited window
(global-set-key (kbd "C-; w b")   'balance-windows)                  ; all windows equal size

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Frames
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-sanskrit99-font()                                            ; set sanskrit font
  (interactive)
  (set-frame-name "Sanskrit")
  (set-frame-size (selected-frame) 120 25)
  (set-frame-font "-altsys-Sanskrit 99-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")
  (set-face-attribute 'default (selected-frame) :height 100)
  (find-file-at-point "~/sanskrit")
  (setq toggle-read-only t)
  (set-frame-size (selected-frame) 120 25))

(defun set-default-font()
  (interactive)
  (set-frame-font
   "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
  (set-face-attribute 'default (selected-frame) :height 100)
  (set-frame-size (selected-frame) 80 40))

(defun set-terminal()                                                   ; set terminal frame
  (interactive)
  (set-frame-name "emacs-term")
  (ansi-term "/bin/bash")
  (set-frame-size (selected-frame) 150 40))

(defun set-serial()                                                   ; set target console frame
  (interactive)
  (set-frame-name "Target Console")
  (ansi-term "/usr/bin/sudo /usr/bin/screen /dev/ttyUSB0 115200")
  (set-frame-size (selected-frame) 150 40))

(defun set-main()                                                       ; set main frame
  (interactive)
  (set-frame-name "emacs-main")
  (set-frame-size (selected-frame) 150 40))

(defun set-pad()                                                        ; set pad frame
  (interactive)
  (set-frame-name "Pad")
  (find-file-at-point "~/org/pad.org")
  (set-frame-size (selected-frame) 80 43)
  (toggle-mode-line))

;; custom frames
(defun set-custom0()
  (interactive)
  (set-frame-name "Custom 0"))

(defun set-custom1()
  (interactive)
  (set-frame-name "Custom 1"))

(defun set-custom2()
  (interactive)
  (set-frame-name "Custom 2"))

(defun set-custom3()
  (interactive)
  (set-frame-name "Custom 3"))

(defun set-custom4()
  (interactive)
  (set-frame-name "Custom 4"))

(defun set-custom5()
  (interactive)
  (set-frame-name "Custom 5"))

(defun set-custom6()
  (interactive)
  (set-frame-name "Custom 6"))

(defun set-custom7()
  (interactive)
  (set-frame-name "Custom 7"))

(defun set-custom8()
  (interactive)
  (set-frame-name "Custom 8"))

(defun set-custom9()
  (interactive)
  (set-frame-name "Custom 9"))

;; goto frames
(defun goto-custom0-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 0")))

(defun goto-custom1-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 1")))

(defun goto-custom2-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 2")))

(defun goto-custom3-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 3")))

(defun goto-custom4-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 4")))

(defun goto-custom5-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 5")))

(defun goto-custom6-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 6")))

(defun goto-custom7-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 7")))

(defun goto-custom8-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 8")))

(defun goto-custom9-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Custom 9")))

(defun goto-pad-frame(&optional arg) 
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Pad")))

(defun goto-main-frame(&optional arg)
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "emacs-main")))

(defun goto-serial-frame(&optional arg)
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Target Console")))

(defun goto-bhagavatam-frame(&optional arg)
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Bhagavatam")))

(defun goto-terminal-frame(&optional arg)
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "emacs-term")))

;; frame keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; frame
(global-set-key (kbd "C-; f c")   
		(lambda()
		  (interactive)
		  (make-frame '(
				(name . "new-frame")
			       (width . 80)
			       (height . 43)))))                   ; create frame

(global-set-key (kbd "C-; f q")   'delete-frame)                     ; delete frame
(global-set-key (kbd "C-; f o")   'other-frame)                      ; other frame
(global-set-key (kbd "C-; f g")   'select-frame-by-name)             ; goto frame
;;(global-set-key (kbd "C-; f s")   'suspend-frame)                    ; minimize frame
(global-set-key (kbd "C-; f n")   'next-frame)                       ; next frame
(global-set-key (kbd "C-; f p")   'previous-frame)                   ; previous frame

;; describe help
(global-set-key (kbd "C-; d f")   'describe-function)                ; function manual
(global-set-key (kbd "C-; d k")   'describe-key)                     ; key manual
(global-set-key (kbd "C-; d m")   'man)                              ; man page
(global-set-key (kbd "C-; d p")   'python-describe-symbol)           ; python manual

;; open the url at cursor
(global-set-key (kbd "C-; o u")   'open-url)                         ; open url in browser

;; fast scrolling
(global-set-key (kbd "M-p") 
		(lambda()
		  (forward-line -5)))                                ; previous 5 lines

(global-set-key (kbd "M-n") 
		(lambda() 
		  (forward-line 5)))                                 ; next 5 lines

;; frames
(global-set-key (kbd "C-; s c")   'set-serial)              ; set sanskrit frame
(global-set-key (kbd "C-; s d")   'set-default-font)                 ; set default font
(global-set-key (kbd "C-; s p")   'set-pad)                          ; set pad size
(global-set-key (kbd "C-; s t")   'set-terminal)                     ; set terminal size
(global-set-key (kbd "C-; s m")   'set-main)                         ; set as main frame

;; setting custom frames
(global-set-key (kbd "C-; s 0")   'set-custom0)
(global-set-key (kbd "C-; s 1")   'set-custom1)
(global-set-key (kbd "C-; s 2")   'set-custom2)
(global-set-key (kbd "C-; s 3")   'set-custom3)
(global-set-key (kbd "C-; s 4")   'set-custom4)
(global-set-key (kbd "C-; s 5")   'set-custom5)
(global-set-key (kbd "C-; s 6")   'set-custom6)
(global-set-key (kbd "C-; s 7")   'set-custom7)
(global-set-key (kbd "C-; s 8")   'set-custom8)
(global-set-key (kbd "C-; s 9")   'set-custom9)

;; goto custom frames
(global-set-key (kbd "C-; f 0")   (goto-custom0-frame))
(global-set-key (kbd "C-; f 1")   (goto-custom1-frame))
(global-set-key (kbd "C-; f 2")   (goto-custom2-frame))
(global-set-key (kbd "C-; f 3")   (goto-custom3-frame))
(global-set-key (kbd "C-; f 4")   (goto-custom4-frame))
(global-set-key (kbd "C-; f 5")   (goto-custom5-frame))
(global-set-key (kbd "C-; f 6")   (goto-custom6-frame))
(global-set-key (kbd "C-; f 7")   (goto-custom7-frame))
(global-set-key (kbd "C-; f 8")   (goto-custom8-frame))
(global-set-key (kbd "C-; f 9")   (goto-custom9-frame))

(global-set-key (kbd "C-; f b")   (goto-bhagavatam-frame))           ; goto bhagavatam frame
(global-set-key (kbd "C-; f p")   (goto-pad-frame))                  ; goto pad frame
(global-set-key (kbd "C-; f m")   (goto-main-frame))                 ; goto main frame
(global-set-key (kbd "C-; f t")   (goto-terminal-frame))             ; goto terminal frame
(global-set-key (kbd "C-; f s")   (goto-serial-frame))               ; goto serial frame

;; Other keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-; i s")   'search-in-internet)               ; search the google key word

;; insert date
;; (global-set-key (kbd "C-; i d")   'insert-current-date-time)
;; (global-set-key (kbd "C-; i t")   'insert-current-time)

;; modes
(global-set-key (kbd "C-; m w")   'whitespace-mode)                  ; whitespace mode
(global-set-key (kbd "C-; m o")   'org-mode)                         ; org mode

;; takuzo-san's idea
(global-set-key (kbd "C-h")       'backward-delete-char)             ; delete char
(global-set-key (kbd "M-h")       'backward-kill-word)               ; backword kill

;; cscope keys
(setq cscope-do-not-update-database t)

(global-set-key (kbd "C-; c f t")  'cscope-find-this-text-string)
(global-set-key (kbd "C-; c f i")  'cscope-find-files-including-file)
(global-set-key (kbd "C-; c f f")  'cscope-find-this-file)
(global-set-key (kbd "C-; c c f")  'cscope-find-called-functions)

(global-set-key (kbd "C-; c f s")  'cscope-find-this-symbol)
(global-set-key (kbd "C-; c g d")  'cscope-find-global-definition)
(global-set-key (kbd "C-; c f d")  'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "C-; c u f")  'cscope-find-functions-calling-this-function)

(global-set-key (kbd "C-; c f p")  'cscope-find-egrep-pattern)
(global-set-key (kbd "C-; c p")    'cscope-pop-mark)

;; (global-set-key (kbd "C-; c s i")  'cscope-set-initial-directory)
;; (global-set-key (kbd "C-; c u i")  'cscope-unset-initial-directory)

;; (global-set-key (kbd "C-; c n s")  'cscope-next-symbol)
;; (global-set-key (kbd "C-; c p s")  'cscope-prev-symbol)
;; (global-set-key (kbd "C-; c n f")  'cscope-next-file)
;; (global-set-key (kbd "C-; c p f")  'cscope-prev-file)

;; (global-set-key (kbd "C-; c d b")  'cscope-display-buffer)
;; (global-set-key (kbd "C-; c b t")  'cscope-display-buffer-toggle)

;; window full screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq myreg nil)

(defun save-window-conf-reg()
  (interactive)
  (window-configuration-to-register myreg)
  (delete-other-windows))

(defun restore-window-conf-reg()
  (interactive)
  (jump-to-register myreg))

(defun toggle-window-full-screen()
  (interactive)
  (if (= (length (window-list)) 1)
      (restore-window-conf-reg)
    (save-window-conf-reg)))

;; alarm clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar alarm-clock-timer nil)

(defun alarm-clock-message (text)
  (message-box text))

(defun alarm-clock ()
  (interactive)
  (let ((time (read-string "Time: "))
        (text (read-string "Alarm message: ")))
    (setq alarm-clock-timer (run-at-time time nil 'alarm-clock-message 
					 text))))
(defun alarm-clock-cancel ()
  (interactive)
  (cancel-timer alarm-clock-timer))
 
;; quilt functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun quilt-pop()
  (interactive)
  (shell-command "quilt pop"))

(defun quilt-push()
  (interactive)
  (shell-command "quilt push"))

(defun quilt-ref()
  (interactive)
  (shell-command "quilt refresh"))

(global-set-key (kbd "C-; p r") 'quilt-ref)

;; browser 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "google-chrome")

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs re-initialize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(fset 'emacs-reload
;;   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 108 111 97 100 45 102 105 108 101 return 1 11 126 47 46 101 109 97 99 115 return 134217848 up return up return] 0 "%d")) arg)))

;; open url
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (fset 'open-url
;;   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 6 return] 0 "%d")) arg)))

;; smart file open at the cursor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun shell-command-to-string (command)
  (with-output-to-string
    (with-current-buffer standard-output
      (call-process shell-file-name nil t nil shell-command-switch command))))

(defun goto-file ()
  (interactive)
  (find-file (shell-command-to-string (concat "locate " (current-word) "|head -c -1" )) ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; experiments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; internet search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *internet-search-urls*
 (quote ("http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
         "http://en.wikipedia.org/wiki/Special:Search?search=")))

(defun search-in-internet (arg)
 (interactive "p")
 (if (> arg (length *internet-search-urls*))
      (error "There is no search URL defined at position %s" arg))

  (let ((query                                                         
    (if (region-active-p)
      (buffer-substring (region-beginning) (region-end))
    (read-from-minibuffer "Search for: ")))

  (baseurl (nth (1- arg) *internet-search-urls*)))

  (let ((url
    (if (string-match "%s" baseurl)
         (replace-match query t t baseurl)
      (concat baseurl query))))
 
   (message "Searching for %s at %s" query url)
   (browse-url url))))

;; buffer move
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun buf-move-up ()
  (interactive)
  (let* ((other-win (windmove-find-other-window 'up))
	 (buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
        (error "No window above this one")
      (set-window-buffer (selected-window) (window-buffer other-win))
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

(defun buf-move-down ()
  (interactive)
  (let* ((other-win (windmove-find-other-window 'down))
	 (buf-this-buf (window-buffer (selected-window))))
    (if (or (null other-win) 
            (string-match "^ \\*Minibuf" (buffer-name (window-buffer other-win))))
        (error "No window under this one")
      (set-window-buffer (selected-window) (window-buffer other-win))
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

(defun buf-move-left ()
  (interactive)
  (let* ((other-win (windmove-find-other-window 'left))
	 (buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
        (error "No left split")
      (set-window-buffer (selected-window) (window-buffer other-win))
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

(defun buf-move-right ()
  (interactive)
  (let* ((other-win (windmove-find-other-window 'right))
	 (buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
        (error "No right split")
      (set-window-buffer (selected-window) (window-buffer other-win))
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

;; maximize windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun hori-max()
  (interactive)
  (setq cur-wind-edges (window-edges))
  (setq my-wind-list (window-list))
  (setq my-wind-list-len (list-length my-wind-list))

  (setq no 0)
  (while (< no my-wind-list-len)
    (setq my-wind (window-edges (nth no my-wind-list)))
    (if (and (= (nth 0 my-wind) (nth 0 cur-wind-edges))
	   (= (nth 1 my-wind) (nth 1 cur-wind-edges))
	   (= (nth 2 my-wind) (nth 2 cur-wind-edges))
	   (= (nth 3 my-wind) (nth 3 cur-wind-edges)))
	()
      (if (and (/= (nth 1 my-wind) (nth 1 cur-wind-edges))
	       (/= (nth 3 my-wind) (nth 3 cur-wind-edges)))
	  ()
	(delete-window (nth no my-wind-list))
	))
    (setq no (1+ no))))

(defun vert-max()
  (interactive)
  (setq cur-wind-edges (window-edges))
  (setq my-wind-list (window-list))
  (setq my-wind-list-len (list-length my-wind-list))

  (setq no 0)
  (while (< no my-wind-list-len)
    (setq my-wind (window-edges (nth no my-wind-list)))
    (if (and (= (nth 0 my-wind) (nth 0 cur-wind-edges))
	   (= (nth 1 my-wind) (nth 1 cur-wind-edges))
	   (= (nth 2 my-wind) (nth 2 cur-wind-edges))
	   (= (nth 3 my-wind) (nth 3 cur-wind-edges)))
	()
      (if (and (/= (nth 0 my-wind) (nth 0 cur-wind-edges))
	       (/= (nth 2 my-wind) (nth 2 cur-wind-edges)))
	  ()

	;; (princ (nth 0 my-wind))
	;; (princ ", ")
	;; (princ (nth 1 my-wind))
	;; (princ ", ")
	;; (princ (nth 2 my-wind))
	;; (princ ", ")
	;; (princ (nth 3 my-wind))
	;; (princ "\n")

	(delete-window (nth no my-wind-list))
	))
    (setq no (1+ no))))

;; window enlarging
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun win-resize-top-or-bot ()
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right))  (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right))   (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right))  (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right))   (enlarge-window-horizontally 1))))

;; insert date and time
(defvar current-date-time-format "(%Y/%m/%d %H:%M:%S %Z, Sagar) ")
(defvar current-time-format "%a %H:%M:%S %Z")

(defun insert-current-date-time ()
       (interactive)
       (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
       (interactive)
       (insert (format-time-string current-time-format (current-time))))

;; End functions


(defun cflow2dot ()
  (interactive)
  (set 'fname (buffer-file-name (window-buffer (minibuffer-selected-window))))
  (shell-command cflow2dot.pl 'fname))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Short-cut keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; window fullscreen
(global-set-key (kbd "C-; w f")   'toggle-window-full-screen)        ; window full-screen

;; window resize horizontally
(global-set-key (kbd "C-; w e h") 'win-resize-enlarge-horiz)         ; window en-large
(global-set-key (kbd "C-; w m h") 'win-resize-minimize-horiz)        ; window shrink

;; window resize vertically
(global-set-key (kbd "C-; w e v") 'win-resize-enlarge-vert)          ; window en-large
(global-set-key (kbd "C-; w m v") 'win-resize-minimize-vert)         ; window shrink

;; maximize the vertical window
(global-set-key (kbd "C-; w m f") 'vert-max)                         ; maximize vert windows
;;(global-set-key (kbd "C-; w k") 'hori-max)                         ; maximize hori windows

;; buffer keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; buffer move
(global-set-key (kbd "C-; b k")   'buf-move-up)                      ; move up window
(global-set-key (kbd "C-; b j")   'buf-move-down)                    ; move down window
(global-set-key (kbd "C-; b h")   'buf-move-left)                    ; move left window
(global-set-key (kbd "C-; b l")   'buf-move-right)                   ; move right window

;; register keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; registers
(global-set-key (kbd "C-; r s")   'window-configuration-to-register) ; save current window layout
(global-set-key (kbd "C-; r j")   'jump-to-register)                 ; restore window layout

;; programmer keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; imenu
(global-set-key (kbd "C-; s s")   'replace-string)                   ; imenu

;; imenu
(global-set-key (kbd "C-; i m")   'imenu)                            ; imenu

;; insert debug printk
(global-set-key (kbd "C-; i p k") 
		(lambda() 
		  (interactive)
		  (insert "printk(\"DEBUG: %s, %d, %s:  \\n\", __FILE__, __LINE__, __func__);")
		  (backward-char 36)))		                     ; Insert debug printk

;; macro keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; macros
(global-set-key (kbd "C-; m r")   'kmacro-start-macro)               ; record macro
(global-set-key (kbd "C-; m s")   'kmacro-end-macro)                 ; stop macro
(global-set-key (kbd "C-; m p")   'kmacro-end-and-call-macro)        ; play macro
(global-set-key (kbd "C-; m n")   'kmacro-name-last-macro)           ; name last macro
(global-set-key (kbd "C-; m i")   'insert-kbd-macro)                 ; insert macro

;; shell command
(global-set-key (kbd "C-; s c")   'shell-command)                    ; run shell command

;; go-to the file at the cursor
(global-set-key (kbd "C-; g f")   'goto-file)                        ; open file under cursor

;; re-initialize the .emacs file
(global-set-key (kbd "C-; e i")   'emacs-reload)                     ; re-inistalize emacs

