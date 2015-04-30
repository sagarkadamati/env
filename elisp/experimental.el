;; -*- mode: emacs-lisp; -*-

;; ;; redefine file-at-point
;; (defun ffap-read-file-or-url (prompt guess)
;;   "Read file or URL from minibuffer, with PROMPT and initial GUESS."
;;   (or guess (setq guess default-directory))
;;   (let (dir)
;;     ;; Tricky: guess may have or be a local directory, like "w3/w3.elc"
;;     ;; or "w3/" or "../el/ffap.el" or "../../../"
;;     (or (ffap-url-p guess)
;;     (progn
;;       (or (ffap-file-remote-p guess)
;;           (setq guess
;;             (abbreviate-file-name (expand-file-name guess))
;;             ))
;;       (setq dir (file-name-directory guess))))
;;     ;; Do file substitution like (interactive "F"), suggested by MCOOK.
;;     (or (ffap-url-p guess) (setq guess (substitute-in-file-name guess)))
;;     ;; Should not do it on url's, where $ is a common (VMS?) character.
;;     ;; Note: upcoming url.el package ought to handle this automatically.
;;     guess))

(defun read-commit ()
  (interactive)
  (let ((match (thing-at-point-looking-at "\\([0-9]*[a-f]*\\)")))
    (if match
      (let ((commit (buffer-substring-no-properties (match-beginning 1)
      						(match-end 1))))
	(print commit)
	)
    )))
(global-set-key (kbd "C-; g c") 'read-commit)

(defun compile-my()
  (interactive)
  (compile "make -j4")
  )

(defun compile-system()
  (interactive)
  (compile "make system")
  )

(global-set-key (kbd "C-; c c") 'recompile)
(global-set-key (kbd "C-; c s") 'compile-system)
  
;; mail settings
(setq rmail-pop-password-required t)
(setq rmail-primary-inbox-list (quote ("pop://sagar.kadamati@domain.com")))
(setq user-mail-address "sagar.kadamati@ap.sony.com")

(defun metamail-message ()
  (interactive)
  (metamail-buffer (get-buffer-create "*Metamail output*")))

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smptmail-starttls-credentials '(("137.153.65.82" 25 nil nil))
      smtpmail-auth-credentials
      '(("smtp.137.153.65.82" 25 "sagar.kadamati@ap.sony.com" nil))
      smtpmail-default-smtp-server "smtp.137.153.65.82"
      smtpmail-smtp-server "smtp.137.153.65.82"
      smtpmail-debug-info t)

(require 'smtpmail)

(defun save-emacs-current-state()
  (interactive)
  (setq desktop-dirname "~/.emacs.d/")
  (desktop-save-in-desktop-dir)
)

(require 'el-get)

(defun restore-emacs-state()
  (interactive)
  (desktop-read"~/.emacs.d/")
)

(global-set-key (kbd "C-; d s") 'save-emacs-current-state)
(global-set-key (kbd "C-; d r") 'restore-emacs-state)

(defvar buff)
(global-set-key (kbd "C-; b f")
		(lambda()
		  (interactive)
		  (setq buff (window-buffer))
		  (switch-to-buffer-other-frame buff)))
 
;; ikatrac tickets 
(defvar ikatrac-page nil)
(defvar ikatrac-info "sagar:iloveusagar")
(defvar ikatrac-link "ntrac.sm.sony.co.jp/ikatrac/")

(setq ikatrac-page (concat "get-ikatrac http://" ikatrac-info "@" ikatrac-link))

(defun kill-buffer-if-exits (bufname)
  (if (not (eq nil (get-buffer bufname)))
      (kill-buffer bufname)))

(defun show-report-seven()
  (interactive)
  (shell-command (concat ikatrac-page "report/7"))
  (shell-command (concat "read-report " "7"))
  (kill-buffer-if-exits "report.7")
  (find-file-at-point "/home/sagar/ikatrac/report.7")
  (toggle-read-only nil)
  (org-mode)
  )

(defun show-report-twenty-one()
  (interactive)
  (shell-command (concat ikatrac-page "report/21"))
  (shell-command (concat "read-report " "21"))
  (kill-buffer-if-exits "report.21")
  (find-file-at-point "/home/sagar/ikatrac/report.21")
  (toggle-read-only nil)
  (org-mode)
  )

(defun show-ticket-at-point-other()
  (interactive)
  (let ((match (thing-at-point-looking-at "#\\([0-9]+\\)")))
    (if match
      (let ((tkt (buffer-substring-no-properties (match-beginning 1)
      						(match-end 1))))
	(shell-command (concat ikatrac-page "ticket/" tkt))
	(shell-command (concat "read-ticket " tkt))
	(kill-buffer-if-exits (concat tkt ".ticket"))
	(find-file-other-window (concat "/home/sagar/ikatrac/" tkt "/" tkt ".ticket"))
	)
      (let ((match (thing-at-point-looking-at ":\\([0-9]+\\)")))
	(if match
	    (let ((tkt (buffer-substring-no-properties (match-beginning 1)
						       (match-end 1))))
	      (shell-command (concat ikatrac-page "ticket/" tkt))
	      (shell-command (concat "read-ticket " tkt))
	      (kill-buffer-if-exits (concat tkt ".ticket"))
	      (find-file-other-window (concat "/home/sagar/ikatrac/" tkt "/" tkt ".ticket"))
	      )
	  nil))
    )))

(defun get-ticket ()
  (interactive)
  (let ((tkt (read-string "Ticket No: ")))
    (shell-command (concat ikatrac-page "ticket/" tkt))
    (shell-command (concat "read-ticket " tkt))
    (kill-buffer-if-exits (concat tkt ".ticket"))
    (find-file-at-point (concat "/home/sagar/ikatrac/" tkt "/" tkt ".ticket"))
    ))

(defun show-ticket-at-point ()
  (interactive)
  (let ((match (thing-at-point-looking-at "#\\([0-9]+\\)")))
    (if match
      (let ((tkt (buffer-substring-no-properties (match-beginning 1)
      						(match-end 1))))
	(shell-command (concat ikatrac-page "ticket/" tkt))
	(shell-command (concat "read-ticket " tkt))
	(kill-buffer-if-exits (concat tkt ".ticket"))
	(find-file-at-point (concat "/home/sagar/ikatrac/" tkt "/" tkt ".ticket"))
	)
      (let ((match (thing-at-point-looking-at ":\\([0-9]+\\)")))
	(if match
	    (let ((tkt (buffer-substring-no-properties (match-beginning 1)
						       (match-end 1))))
	      (shell-command (concat ikatrac-page "ticket/" tkt))
	      (shell-command (concat "read-ticket " tkt))
	      (kill-buffer-if-exits (concat tkt ".ticket"))
	      (find-file-at-point (concat "/home/sagar/ikatrac/" tkt "/" tkt ".ticket"))
	      )
	  nil))
    )))

(defun download-attachments-at-point ()
  (interactive)
  (let ((match (thing-at-point-looking-at "#\\([0-9]+\\)")))
    (if match
      (let ((tkt (buffer-substring-no-properties (match-beginning 1)
      						(match-end 1))))
	(shell-command (concat "clone-ticket " tkt))
	)
      (let ((match (thing-at-point-looking-at ":\\([0-9]+\\)")))
	(if match
	    (let ((tkt (buffer-substring-no-properties (match-beginning 1)
						       (match-end 1))))
	      (shell-command (concat "clone-ticket " tkt))
	      )
	  nil))
    )))

(defun show-ticket-in-browser ()
  (interactive)
  (let ((match (thing-at-point-looking-at "#\\([0-9]+\\)")))
    (if match
      (let ((tkt (buffer-substring-no-properties (match-beginning 1)
      						(match-end 1))))
	(browse-url (concat "https://nvbugswb.nvidia.com/nvbugs5/SWBug.aspx?bugid=" tkt))
	t)
      (let ((match (thing-at-point-looking-at ":\\([0-9]+\\)")))
	(if match
	    (let ((tkt (buffer-substring-no-properties (match-beginning 1)
						       (match-end 1))))
	      (browse-url (concat "https://nvbugswb.nvidia.com/nvbugs5/SWBug.aspx?bugid=" tkt))
	      t)
	  (let ((tkt (substring (buffer-name) 0 (- (length (buffer-name)) (length ".ticket")))))
	    (if (string-match "[0-9]+" tkt)
		(browse-url (concat "https://nvbugswb.nvidia.com/nvbugs5/SWBug.aspx?bugid=" tkt))
	      nill)))))))

(defun is-file-exits (filename)
  (eq t (file-exists-p filename))
)

(defun view-attachment()
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (let ((output (shell-command-to-string (concat "echo \'" line "\'| cut -d \' \' -f 1 | grep -v ^$"))))
      (print output)
      (let ((attachment (substring output 0 (- (length output) 1))))
	(let ((tkt (substring (buffer-name) 0 (- (length (buffer-name)) (length ".ticket")))))
	  (if (string-match "[0-9]+" tkt)
	      (let ((link (concat "get-attachment " tkt " " attachment)))
		(if (is-file-exits (concat "/home/sagar/ikatrac/" tkt "/" attachment))
		    (let ((prompt (concat attachment " already exits, Do you want to update (y/N): ")))
		      (let ((decission (read-string prompt)))
			(if (or (equal decission "Y") (equal decission "y"))
			    (shell-command link)
			  )
			)
		      )
		  (shell-command link)
		  )

		(kill-buffer-if-exits attachment)
		(find-file-at-point (concat "/home/sagar/ikatrac/" tkt "/" attachment))
		(toggle-read-only nil)
		)
	    nill)
	  )
	)
      )
    ))

(defun view-attachment-other()
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (let ((output (shell-command-to-string (concat "echo \'" line "\'| cut -d \' \' -f 1 | grep -v ^$"))))
      (print output)
      (let ((attachment (substring output 0 (- (length output) 1))))
	(let ((tkt (substring (buffer-name) 0 (- (length (buffer-name)) (length ".ticket")))))
	  (if (string-match "[0-9]+" tkt)
	      (let ((link (concat "get-attachment " tkt " " attachment)))
		(if (is-file-exits (concat "/home/sagar/ikatrac/" tkt "/" attachment))
		    (let ((prompt (concat attachment " already exits, Do you want to update (y/N): ")))
		      (let ((decission (read-string prompt)))
			(if (or (equal decission "Y") (equal decission "y"))
			    (shell-command link)
			  )
			)
		      )
		  (shell-command link)
		  )

		(kill-buffer-if-exits attachment)
		(find-file-other-window (concat "/home/sagar/ikatrac/" tkt "/" attachment))
		(toggle-read-only nil)
		)
	    nill)
	  )
	)
      )
    ))

(defun view-attachment-region(beg end)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-min))))
  (let ((attachment (buffer-substring-no-properties beg end)))
    (let ((tkt (substring (buffer-name) 0 (- (length (buffer-name)) (length ".ticket")))))
      (if (string-match "[0-9]+" tkt)
    	  (let ((link (concat "get-attachment " tkt " " attachment)))
    	    (if (is-file-exits (concat "/home/sagar/ikatrac/" tkt "/" attachment))
    		(let ((prompt (concat attachment " already exits, Do you want to update (y/N): ")))
    		  (let ((decission (read-string prompt)))
    		    (if (or (equal decission "Y") (equal decission "y"))
    			(shell-command link)
    		      )
    		    )
    		  )
    	      (shell-command link)
    	      )

    	    (kill-buffer-if-exits attachment)
    	    (find-file-at-point (concat "/home/sagar/ikatrac/" tkt "/" attachment))
    	    (toggle-read-only nil)
    	    )
    	nill)
    )
  ))

(defun read-cvs()
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (shell-command-to-string (concat "cvs-local " line))
    (kill-buffer-if-exits "cvs.diff")
    (find-file-at-point "~/cvs.diff")
    )
)

(defun read-git()
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (let ((repo-output (shell-command-to-string (concat "git-local-repo \'" line "\'")))
	  (commit-output (shell-command-to-string (concat "git-local-commit \'" line "\'"))))
      (let ((repo (concat "/home/sagar/workspace/" (substring repo-output 0 (- (length repo-output) 1))))
	    (commit (substring commit-output 0 (- (length commit-output) 1))))
	;; (vc-dir repo)
	(kill-buffer-if-exits repo)
	(find-file-at-point repo)

	;; (vc-diff repo)
	(vc-print-root-log commit)
  	(log-view-diff commit)
	(isearch-forward commit)

	;; (isearch-forward commit)

	;; (log-view-diff commit)

      	;; (print repo)
      	;; (print commit)
      	)
      )
    )
)

(global-set-key (kbd "C-; e p")   'read-git)

(defun doc-view-rotate-current-page ()
  "Rotate the current page by 90 degrees.
Requires ImageMagick installation"
  (interactive)
  (when (eq major-mode 'doc-view-mode)
    ;; we are assuming current doc-view internals about cache-names
    (let ((file-name (expand-file-name (format "page-%d.png" (doc-view-current-page)) (doc-view-current-cache-dir))))
      ;; assume imagemagick is installed and rotate file in-place and redisplay buffer
      (call-process-shell-command "convert" nil nil nil "-rotate" "90" file-name file-name)
      (clear-image-cache)
      (doc-view-goto-page (doc-view-current-page)))))

(global-set-key (kbd "C-; r p")   'doc-view-rotate-current-page)

(defun open-repo()
  (interactive)
  (kill-buffer-if-exits "workspace")
  (find-file-at-point "~/workspace")
)
  
(global-set-key (kbd "C-; o r")   'open-repo)

(global-set-key (kbd "C-; r c")   'read-cvs)
(global-set-key (kbd "C-; r a")   'view-attachment)
(global-set-key (kbd "C-; r o a") 'view-attachment-other)
(global-set-key (kbd "C-; r d a") 'view-attachment-region)
(global-set-key (kbd "C-; g t")   'get-ticket)
(global-set-key (kbd "C-; r t")   'show-ticket-at-point)
(global-set-key (kbd "C-; r o t") 'show-ticket-at-point-other)
(global-set-key (kbd "C-; r b")   'show-ticket-in-browser)
(global-set-key (kbd "C-; r 7")   'show-report-seven)
(global-set-key (kbd "C-; r 2 1") 'show-report-twenty-one)
(global-set-key (kbd "C-; r f t") 'download-attachments-at-point)

;; toggle org mode
(defvar mode-save nil)

(defun toggle-org-mode()
  (interactive)
  (setq mode-save major-mode)
  (org-mode))

(defun replace-regexp-in-region (start end)
      (interactive "*r")
      (save-excursion
        (save-restriction
          (let ((regexp (read-string "Regexp: "))
                (to-string (read-string "Replacement: ")))
            (narrow-to-region start end)
            (goto-char (point-min))
            (while (re-search-forward regexp nil t)
              (replace-match to-string nil nil))))))

;; vim like search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun isearch-word-at-point ()
  (interactive)
  (call-interactively 'isearch-forward-regexp))

(defun isearch-yank-word-hook ()
  (when (equal this-command 'my-isearch-word-at-point)
    (let ((string (concat "\\<"
                          (buffer-substring-no-properties
                           (progn (skip-syntax-backward "w_") (point))
                           (progn (skip-syntax-forward "w_") (point)))
                          "\\>")))
      (if (and isearch-case-fold-search
               (eq 'not-yanks search-upper-case))
          (setq string (downcase string)))
      (setq isearch-string string
            isearch-message
            (concat isearch-message
                    (mapconcat 'isearch-text-char-description
                               string ""))
            isearch-yank-flag t)
      (isearch-search-and-update))))

(add-hook 'isearch-mode-hook 'isearch-yank-word-hook)

;; browser keys
(global-set-key (kbd "C-; s w")   'isearch-word-at-point)            ; my isearch

(defun print-frames()
  (interactive)
  (setq frames (frame-list))
  (setq frames-len (- (list-length frames) 1))
;;  (princ (nth 0 frames))
  (princ "Frame count: ")
  (princ frames-len))

(global-set-key (kbd "C-; p f")   'print-frames)

;; (make-variable-buffer-local
;;  (defvar my-override-mode-on-save nil
;;    "Can be set to automatically ignore read-only mode of a file when saving."))

;; (defadvice file-writable-p (around my-overide-file-writeable-p act)
;;   "override file-writable-p if `my-override-mode-on-save' is set."
;;   (setq ad-return-value (or
;;                          my-override-mode-on-save
;;                          ad-do-it)))

;; (defun my-override-toggle-read-only ()
;;   "Toggle buffer's read-only status, keeping `my-override-mode-on-save' in sync."
;;   (interactive)
;;   (setq my-override-mode-on-save (not my-override-mode-on-save))
;;   (toggle-read-only))


;; show ticket summary from ticket no
;; (require 'xml-rpc)

;; (defvar refs-check-url nil
;;   "URL of the trac page")

;; (defun refs-check-get-url()
;;   (let ((rawurl (url-generic-parse-url refs-check-url)))
;;     (format "%s://%s:%s%s/login/xmlrpc"
;; 	    (url-type rawurl)
;; 	    (url-host rawurl)
;; 	    (url-port rawurl)
;; 	    (url-filename rawurl))))

;; (defun refs-check-get-ticket(id)
;;   (let ((url (refs-check-get-url)))
;;     (if (xml-rpc-method-call url 'ticket.query (format "id=%s" id))
;; 	(nth 3 (xml-rpc-method-call url 'ticket.get id))
;;       "invalid ticket id")))

;; (defun refs-check-show-ticket-summaries()
;;   "Fetch IDs of trac tickets from the cursor's position, and show
;;    summaries of those in minibuffer."
;;   (interactive)
;;   (let ((oldpos (point)) refs id ticket summary msg)
;;     (progn
;;       (while (re-search-forward "#\\([0-9]+\\)" (point-at-eol) t)
;; 	(progn
;; 	  (setq refs (match-string-no-properties 0))
;; 	  (setq id   (match-string-no-properties 1))
;; 	  (setq ticket (refs-check-get-ticket id))
;; 	  (setq summary (format " #%-5s : %-8s : %s" id
;; 				(cdr (assoc "status"  ticket))
;; 				(cdr (assoc "summary" ticket))))
;; 	  (setq msg (concat msg (if msg "\n" "") summary))))
;;       (message msg)
;;       (goto-char oldpos))))

;; (provide 'refs-check)

;; (setq refs-check-url "http://ntrac.sm.sony.co.jp/ikatrac")

;; (global-set-key [?\C-:] 'refs-check-show-ticket-summaries)

(defun do-org-show-all-inline-images ()
  (interactive)
  (org-display-inline-images t t))
(global-set-key (kbd "C-c C-x C v")
                'do-org-show-all-inline-images)
