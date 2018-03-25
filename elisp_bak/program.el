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

;; autocomplete-filename
(global-set-key (kbd "C-; a f")   'comint-dynamic-complete-filename) ; autocomplete filename in buffer
