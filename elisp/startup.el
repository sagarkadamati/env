(require 'windmove)

;; Disable Emacs controls
(cond ((> emacs-major-version 20)
       (tool-bar-mode -1)
       (menu-bar-mode -1)
       (scroll-bar-mode -1)
       ;; (menu-bar-showhide-fringe-menu-customize-disable)
       (blink-cursor-mode -1)
       (windmove-default-keybindings 'meta)))

;; Display Time
(display-time)

;; Highlight Line
(global-hl-line-mode 1)

;; Save Buffer
(global-set-key (kbd "C-; b s")   'save-buffer)

;; Unset Global Key
(global-unset-key (kbd "C-;"))                                       ; unset the `C-;` key

;; Buffer Menu
(global-set-key (kbd "C-; b m")   'buffer-menu)                      ; list buffer menu

;; Revert Buffer
(global-set-key (kbd "C-; b r b") 'revert-buffer)                    ; revert buffer

;; Buffer Changing
(global-set-key (kbd "C-; b p")   'previous-buffer)                  ; prev-buffer
(global-set-key (kbd "C-; b n")   'next-buffer)                      ; next-buffer
(global-set-key (kbd "C-; b r o") 'toggle-read-only)                 ; read-only-buffer

;; Goto Buffer Starting, and End
(global-set-key (kbd "C-; b b")   'beginning-of-buffer)              ; goto beging of the buffer
(global-set-key (kbd "C-; b e")   'end-of-buffer)                    ; goto end of the buffer
(global-set-key (kbd "C-; b s")   'save-buffer)                      ; save buffer
(global-set-key (kbd "C-; b q")   'kill-buffer)                      ; kill the buffer

;; Window Keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Window Moving
(global-set-key (kbd "C-; w l")   'windmove-right)                   ; move to left windnow
(global-set-key (kbd "C-; w h")   'windmove-left)                    ; move to right window
(global-set-key (kbd "C-; w k")   'windmove-up)                      ; move to upper window
(global-set-key (kbd "C-; w j")   'windmove-down)                    ; move to down window

;; Window Spliting
(global-set-key (kbd "C-; w v")   'split-window-vertically)          ; split window vertically
(global-set-key (kbd "C-; w s")   'split-window-horizontally)        ; split window horizontally
(global-set-key (kbd "C-; w q")   'delete-window)                    ; kill splited window
(global-set-key (kbd "C-; w b")   'balance-windows)                  ; all windows equal size

(defun coder()                                                       ; set main frame name
  (interactive)
  (set-frame-name "Coder")
  (set-frame-size (selected-frame) 120 33))

(load "colors.el")

(require 'android-mode)
(custom-set-variables '(android-mode-sdk-dir "~/android/android-sdk-linux"))

(coder)
(server-start)
