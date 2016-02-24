(require 'windmove)

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

;; buffer move
(global-set-key (kbd "C-; b k")   'buf-move-up)                      ; move up window
(global-set-key (kbd "C-; b j")   'buf-move-down)                    ; move down window
(global-set-key (kbd "C-; b h")   'buf-move-left)                    ; move left window
(global-set-key (kbd "C-; b l")   'buf-move-right)                   ; move right window

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

;; Window toggle full screen
(global-set-key (kbd "C-; w f")   'toggle-window-full-screen)        ; window full-screen
