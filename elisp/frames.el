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

(defun set-bhagavatam()                                                       ; set main frame
  (interactive)
  (set-frame-name "Bhagavatam")
  (if (get-buffer "/home/sagar/env/org/Bhagavatam.org")
      (switch-to-buffer "/home/sagar/env/org/Bhagavatam.org")
    (find-file-at-point "/home/sagar/env/org/Bhagavatam.org"))
  (set-frame-size (selected-frame) 62 18)
  (toggle-mode-line))

  ;; Width: 612
  ;; Height: 342

(defun coder()                                                       ; set main frame name
  (interactive)
  (set-frame-name "Coder")
  (set-frame-size (selected-frame) 120 33))

(defun set-pad()                                                        ; set pad frame
  (interactive)
  (set-frame-name "Pad")
  (find-file-at-point "~/org/pad.org")
  (set-frame-size (selected-frame) 80 43))

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

(defun goto-coder-frame(&optional arg)
   (lambda (&optional arg) 
     (interactive "p") 
     (select-frame-by-name "Coder")))

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

(defun goto-page-bhagavatam()
  (interactive)
  (let* ((current (org-get-tags-string))
	 (current-tag (org-split-string current ":")))
    (set-mark-command nil)
    (set-mark-command nil)
    (setq m (mark-marker))
    (outline-up-heading 10)
    (setq heading (org-get-heading))
    (set-mark-command m)
    (select-frame-by-name "Bhagavatam")
    (set-frame-size (selected-frame) 62 18)
    (if (get-buffer (concat heading ".pdf"))
	(switch-to-buffer (concat heading ".pdf"))
      (find-file-at-point (concat "/home/sagar/env/bhagavatam/" heading ".pdf")))
    ;; (doc-view-fit-width-to-window)
    (setq mode-line-format nil)
    (doc-view-goto-page
     (string-to-number (car current-tag)))))

(defun goto-content-bhagavatam()
  (interactive)
  (set-frame-name "Bhagavatam")
  (setq mode-line-format nil)
  (if (get-buffer "/home/sagar/env/org/Bhagavatam.org")
      (switch-to-buffer "/home/sagar/env/org/Bhagavatam.org")
    (find-file-at-point "/home/sagar/env/org/Bhagavatam.org"))
  (set-frame-size (selected-frame) 80 40)
  (read-only-mode))

(global-set-key (kbd "C-; g g") 'goto-page-bhagavatam)
(global-set-key (kbd "C-; g c") 'goto-content-bhagavatam)

;; (defun get-heading()
;;   (interactive)
;;   (set-mark-command nil)
;;   (set-mark-command nil)
;;   (setq m (mark-marker))
;;   (outline-up-heading 10)
;;   (select-frame-by-name "Bhagavatam")
;;   (if (get-buffer (concat (org-get-heading) ".pdf"))
;;       (switch-to-buffer (concat (org-get-heading) ".pdf"))
;;     (find-file-at-point (concat "/home/sagar/env/Bhagavatam/" (org-get-heading) ".pdf")))
;;   ;; (princ (concat "/home/sagar/env/Bhagavatam/" (org-get-heading) ".pdf")))
;;   (set-mark-command m))

;; (global-set-key (kbd "C-; g b") 'get-heading)

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

;; frames
(global-set-key (kbd "C-; s c")   'set-serial)              ; set sanskrit frame
(global-set-key (kbd "C-; s d")   'set-default-font)                 ; set default font
(global-set-key (kbd "C-; s p")   'set-pad)                          ; set pad size
(global-set-key (kbd "C-; s t")   'set-terminal)                     ; set terminal size
(global-set-key (kbd "C-; s m")   'coder)                         ; set as main frame
(global-set-key (kbd "C-; s b")   'set-bhagavatam)                         ; set as main frame

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
(global-set-key (kbd "C-; f m")   (goto-coder-frame))                 ; goto main frame
(global-set-key (kbd "C-; f t")   (goto-terminal-frame))             ; goto terminal frame
(global-set-key (kbd "C-; f s")   (goto-serial-frame))               ; goto serial frame

(coder)
