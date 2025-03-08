;;; cappuccino-noir-theme.el --- Coffee at night
;;; Version: 1.0
;;; Commentary:
;;; A night theme that feels like morning cup of coffee.
;;;
;;; This theme is a reimplementation of the original Cappuccino Noir
;;; theme using the tools provided by `gligan-themes.el'.
;;;
;;; Code:

(require 'gligan-themes)

(define-gligan-palette cappuccino-noir-palette
  ;; The palette colours
  ((main-bg         . "#170e0b")
   (main-fg         . "#e4c3ab")
   (contrast-fg     . "#f1daca")

   (cappu-1         . "#25150f")
   (cappu-2         . "#351e17")
   (cappu-3         . "#482c22")
   (cappu-4         . "#633f33")
   (cappu-5         . "#956758")

   (c1              . "#ddb680")
   (c2              . "#f59c20")
   (c3              . "#f5aa73")
   (c4              . "#c8dad6")
   (c5              . "#c1d2e2")
   (c6              . "#efb78e")

   (ceramic         . "#fcfff9")
   (youthful-coral  . "#ec7e70")
   (blue-rice       . "#96b9ea")
   (cool-cyan       . "#7ddbd0")
   (ethereal-green  . "#cbc8b1"))

  ;; The palette associations
  ((background . main-bg)
   (foreground . main-fg)

   (cursor . main-fg)
   (region . cappu-3)
   (fringe . main-bg)

   ;; (background-accent-strong . )
   (background-accent-medium . cappu-3)
   (background-accent-light  . cappu-2)

   (accent-strong . contrast-fg)
   (accent-medium . contrast-fg)

   (grey-neutral . cappu-4)
   (grey-accent  . cappu-5)

   (line-number             . cappu-4)
   (current-line-number     . cappu-5)
   (current-line-background . cappu-1)

   (white   . ceramic)
   (black   . cappu-1)
   (red     . youthful-coral)
   (green   . ethereal-green)
   (yellow  . c1)
   (blue    . blue-rice)
   (magenta . "#ff00ff")
   (cyan    . cool-cyan)

   (success . ethereal-green)
   (warning . youthful-coral)

   (built-in            . c4)
   (preprocessor        . ethereal-green)
   (comment             . cappu-5)
   (comment-delimiter   . cappu-4)
   (comment-doc         . c6)
   ;; (comment-doc-markup  . )
   ;; (punctuation         . )
   (type                . c1)
   (function-name       . c2)
   (variable-name       . c3)
   (keyword             . youthful-coral)
   (string              . c5)
   ;; (escaped-char        . )
   (negation            . youthful-coral)
   (number              . ethereal-green)
   (constant            . ethereal-green)
   ;; (regexp              . )
   (stand-out           . youthful-coral)
   (trailing-whitespace . youthful-coral)

   (minibuffer-prompt . c1)))

(define-gligan-theme cappuccino-noir
  dark
  cappuccino-noir-palette
  "A night theme that feels like morning cup of coffee")

;;; cappuccino-noir-theme.el ends here
