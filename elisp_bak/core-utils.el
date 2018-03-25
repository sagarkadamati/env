;; Core utilities.  Please always load this file.
;;
;; Load-path related
;;
;; http://www.emacswiki.org/cgi-bin/wiki/SubdirsToList
(defun add-subdirs-to-list (my-directory my-list)
  "Adds all immediate subdirectories of `my-directory' to `my-list'.
    More precisely, this uses only the subdirectories whose names start
    with letters or digits; it excludes any subdirectory named `RCS' or
    `CVS', and any subdirectory that contains a file named `.nosearch'."
  ;; This is a derivation of normal-top-level-add-subdirs-to-load-path
  ;; and there is still some crud left from it.
  (let (dirs
    	attrs
    	(pending (list my-directory))
    	subdirs-inode-list)
    (let* ((this-dir (car pending))
    	   (contents (directory-files this-dir))
    	   (default-directory this-dir)
    	   (canonicalized (and (eq system-type 'windows-nt)
    			       (untranslated-canonical-name this-dir))))
      ;; The Windows version doesn't report meaningful inode
      ;; numbers, so use the canonicalized absolute file name of the
      ;; directory instead.
      (setq attrs (or canonicalized
		      (nthcdr 10 (file-attributes this-dir))))
      (unless (member attrs subdirs-inode-list)
	(setq my-add-subdirs-inode-list
	      (cons attrs subdirs-inode-list))
	(while contents
	  ;; The lower-case variants of RCS and CVS are for DOS/Windows.
	  (unless (member (car contents) '("." ".." "RCS" "CVS" "rcs" "cvs"))
	    (when (and (string-match "\\`[[:alnum:]]" (car contents))
		       ;; Avoid doing a `stat' when it isn't necessary
		       ;; because that can cause trouble when an NFS server
		       ;; is down.
		       (not (string-match "\\.elc?\\'" (car contents)))
		       (file-directory-p (car contents)))
	      (let ((expanded (expand-file-name (car contents))))
		(unless (file-exists-p (expand-file-name ".nosearch"
							 expanded))
		  (setq dirs (nconc dirs (list expanded)))))))
	  (setq contents (cdr contents)))))
    (list my-list)
    (dolist (my-dir dirs)
      (add-to-list my-list my-dir)))
  (eval my-list))

(defun add-to-load-path (path)
  (setq load-path (cons (expand-file-name path) load-path))
  (add-subdirs-to-list path 'load-path))
