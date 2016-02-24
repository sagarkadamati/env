(set-background-color "#FDF6E3")
(set-foreground-color "#657B83")

(set-cursor-color "#657B83")

;; Frame color
(setq default-frame-alist
      (append default-frame-alist
       '((foreground-color . "#657B83")
	 (background-color . "#FDF6E3")
	 (cursor-color . "#000070")
	 (frame-name "Little"))
       ))

;; Frame Transparent Mode
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

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

(set-face-attribute 'hl-line nil
		    :background "#F9F3E2"
		    :foreground nil)
;; Mode line
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

;; Coding (Keyword color)
(set-face-attribute  'font-lock-string-face nil :weight 'medium)
;; (set-face-foreground 'font-lock-string-face "#657B83")
;; (set-face-foreground 'font-lock-string-face "#586e75")
(set-face-foreground 'font-lock-string-face "#2aa198")
(set-face-foreground 'font-lock-constant-face "#2aa198")
(set-face-foreground 'font-lock-negation-char-face "#2aa198")

(set-face-foreground 'font-lock-comment-delimiter-face "#93a1a1")
(set-face-attribute  'font-lock-comment-face nil :weight 'medium :slant 'italic)
;; (set-face-foreground 'font-lock-comment-face "light pink")
(set-face-foreground 'font-lock-comment-face "#93a1a1")

(set-face-attribute  'font-lock-keyword-face nil :weight 'bold)
(set-face-foreground 'font-lock-keyword-face "#586e75")

;; (set-face-attribute  'font-lock-type-face nil :weight 'bold)
(set-face-foreground 'font-lock-type-face "#b58900")
;; (set-face-foreground 'font-lock-variable-name-face "red")
;; (set-face-foreground 'font-lock-variable-name-face "#073642")
(set-face-foreground 'font-lock-variable-name-face "#d33682")

(set-face-foreground 'font-lock-preprocessor-face "#6c71c4")
(set-face-attribute  'font-lock-function-name-face nil :weight 'bold)
(set-face-foreground 'font-lock-function-name-face "#6c71c4")
;; (set-face-foreground 'font-lock-function-name-face "#586e75")
;; "#859900")

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
