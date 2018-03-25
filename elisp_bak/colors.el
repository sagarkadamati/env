(set-background-color "#FDF6E3")
(set-foreground-color "#657B83")

(set-cursor-color "#657B83")

;; Frame color
(setq default-frame-alist
      (append default-frame-alist
       '((background-color . "#FDF6E3")
	 (foreground-color . "#657B83")
	 (cursor-color . "#657B83")
	 (frame-name "Coder"))
       ))

;; Frame Transparent Mode
(set-frame-parameter (selected-frame) 'alpha '(92 92))
(add-to-list 'default-frame-alist '(alpha 92 92))

(set-face-attribute 'hl-line nil
		    :background "#F9F3E2"
		    :foreground nil)

(set-face-attribute 'mode-line nil
		    :box nil
		    :background "#F9F3E2"
		    :foreground "#657B83"
		    :overline "#F9F3E2"
		    :underline "#F9F3E2")

(set-face-attribute 'mode-line-inactive nil
		    :box nil
		    :background "#F9F3E2"
		    :foreground "#657B83"
		    :overline "#F9F3E2"
		    :underline "#F9F3E2")

(set-face-attribute 'fringe nil
		    :background "#FDF6E3")

(set-face-attribute 'vertical-border nil
		    :background "#EEE8D5"
		    :foreground "#EEE8D5")

(set-face-attribute 'shadow nil
		    :background "#657B83"
		    :foreground "#FDF6E3")

(set-face-attribute 'region nil
		    :background "#EEE8D5"
		    :foreground nil)
(set-face-foreground 'region nil)

(set-face-attribute 'minibuffer-prompt nil
		    :foreground "#6c71c4")

(set-face-attribute 'buffer-menu-buffer nil
		    :foreground "#657B83")

(set-face-attribute 'isearch nil
		    :background "#657B83"
		    :foreground "#FDF6E3")

(set-face-attribute 'isearch-fail nil
		    :background "#657B83"
		    :foreground "#FDF6E3")

;; Coding (Keyword color)
(set-face-attribute 'font-lock-comment-delimiter-face nil
		    :foreground "#93a1a1")

(set-face-attribute 'font-lock-comment-face nil
		    :foreground "#93a1a1"
		    :weight 'medium
		    :slant 'italic)

(set-face-attribute 'font-lock-doc-face nil
		    :foreground "#93a1a1"
		    :weight 'medium
		    :slant 'italic)

(set-face-attribute 'font-lock-string-face nil
		    :foreground "#2aa198"
		    :weight 'medium)

(set-face-attribute 'font-lock-constant-face nil
		    :foreground "#2aa198")

(set-face-attribute 'font-lock-negation-char-face nil
		    :foreground "#2aa198")

(set-face-attribute 'font-lock-keyword-face nil
		    :foreground "#586e75"
		    :weight 'bold)

(set-face-attribute 'font-lock-preprocessor-face nil
		    :foreground "#6c71c4")

(set-face-attribute 'font-lock-type-face nil
		    :foreground "#b58900")

(set-face-attribute 'font-lock-variable-name-face nil
		    :foreground "#d33682")

(set-face-attribute 'font-lock-function-name-face nil
		    :foreground "#6c71c4"
		    :weight 'bold)

(set-face-attribute 'font-lock-builtin-face nil
		    :foreground "#6c71c4")

(set-face-attribute 'font-lock-warning-face nil
		    :foreground "#6c71c4")

;; (set-face-foreground 'font-lock-preprocessor-face "#6c71c4")

;; (set-face-foreground 'font-lock-comment-delimiter-face "#93a1a1")

;; (set-face-foreground 'font-lock-comment-face "#93a1a1")
;; (set-face-attribute  'font-lock-comment-face nil

;; (set-face-foreground 'font-lock-doc-face "#93a1a1")
;; (set-face-attribute  'font-lock-doc-face nil :weight 'medium :slant 'italic)

;; (set-face-attribute  'font-lock-string-face nil :weight 'medium)
;; (set-face-foreground 'font-lock-string-face "#2aa198")

;; (set-face-foreground 'font-lock-constant-face "#2aa198")
;; (set-face-foreground 'font-lock-negation-char-face "#2aa198")

;; (set-face-foreground 'font-lock-keyword-face "#586e75")
;; (set-face-attribute  'font-lock-keyword-face nil :weight 'bold)

;; (set-face-foreground 'font-lock-type-face "#b58900")
;; (set-face-foreground 'font-lock-variable-name-face "#d33682")

;; (set-face-foreground 'font-lock-function-name-face "#6c71c4")
;; (set-face-attribute  'font-lock-function-name-face nil :weight 'bold)

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

;; (setq term-default-bg-color "#FDF6E3")
;; (setq term-default-fg-color "#657B83")
