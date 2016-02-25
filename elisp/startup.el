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

;; Doc View Mode
(setq doc-view-continuous t)

;; open file at the location
(ffap-bindings)

;; Unset Global Key
(global-unset-key (kbd "C-;"))                                       ; unset the `C-;` key

;; Save Buffer
(global-set-key (kbd "C-; b s")   'save-buffer)

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

;; (defun no-modeline()
;;   (interactive)
;;   (setq mode-line-format nil))

;; (defun toggle-mode-line () "toggles the modeline on and off"
;;   (interactive) 
;;   (setq mode-line-format
;;     (if (equal mode-line-format nil)
;;         (default-value 'mode-line-format)))
;;   (redraw-display))

;; (global-set-key [M-f12] 'toggle-mode-line)

;; (defun switch-fullscreen nil
;;   (interactive)
;;   (let* ((modes '(nil fullboth fullwidth fullheight))
;;          (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
;;          (next (cadr (member cm modes) ) ) )
;;     (modify-frame-parameters
;;      (selected-frame)
;;      (list (cons 'fullscreen next)))))

;; (global-set-key (kbd "C-; f f")  'switch-fullscreen)

;; (server-start)

;; (require 'android-mode)
;; (custom-set-variables '(android-mode-sdk-dir "~/android/android-sdk-linux"))

;; (set-face-foreground 'region nil)
;; (shell-command "~/env/scripts/setemacs")

;; describe help
(global-set-key (kbd "C-; d f")   'describe-function)                ; function manual
(global-set-key (kbd "C-; d k")   'describe-key)                     ; key manual
(global-set-key (kbd "C-; d m")   'man)                              ; man page
(global-set-key (kbd "C-; d p")   'python-describe-symbol)           ; python manual

;; fast scrolling
(global-set-key (kbd "M-p")
		(lambda()
		  (forward-line -5)))                                ; previous 5 lines

(global-set-key (kbd "M-n")
		(lambda()
		  (forward-line 5)))                                 ; next 5 lines

;; describe help
(global-set-key (kbd "C-; r r")   'remember)

(load "frames.el")
(load "modeline.el")
(load "colors.el")
(load "bufmove.el")
