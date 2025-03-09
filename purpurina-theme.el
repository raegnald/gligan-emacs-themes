;;; purpurina-theme.el --- I'm a star
;;; Version: 1.0
;;; Commentary:
;;; A glamorous theme for your nocturnal needs.
;;; Code:

(require 'gligan-themes)

(define-gligan-palette purpurina-palette
  ;; Palette colours
  ((main-bg . "#21071d")
   (main-fg . "#dac0d7")

   (grey-1 . "#dbcdd9")
   (grey-2 . "#bdafbb")
   (grey-3 . "#9e919c")

   (makeup-powder       . "#d3899b")
   (kiss                . "#fbd8f7")
   (kiss-darkened       . "#e1b8db")
   (kiss-darkened-twice . "#cba2c6")
   (blush-essence       . "#e2adf5")
   (chicle              . "#ff9dbc")
   (chicle-darker       . "#e087a3")
   (money-rubber        . "#ff9d9e")
   (orangeish           . "#f7a991")

   (paradise-green . "#afe89b")

   (purpu-0 . "#310c2c")
   (purpu-1 . "#4d1546")
   (purpu-2 . "#6f2765")
   (purpu-3 . "#8e3882")
   (purpu-4 . "#ae54a2")

   (golden              . "#f2ee69")
   (golden-darker       . "#c6c132")

   (liquid-blue-darker  . "#3d93a4")
   (liquid-blue         . "#53bacf")
   (liquid-blue-lighter . "#8bdbeb"))

  ;; Palette associations
  ((background . main-bg)
   (foreground . main-fg)

   (cursor . golden)
   (region . purpu-1)

   (background-accent-medium . purpu-1)
   (background-accent-light  . purpu-0)

   (accent-strong . golden)
   (accent-medium . liquid-blue-darker)

   (minibuffer-prompt . golden-darker)

   (buffer-name . kiss)

   (line-number             . purpu-2)
   (current-line-number     . purpu-3)
   (current-line-background . purpu-0)

   (white   . kiss)
   (black   . purpu-2)
   (red     . money-rubber)
   (green   . paradise-green)
   (yellow  . golden)
   (blue    . liquid-blue)
   (magenta . purpu-4)
   (cyan    . liquid-blue-lighter)

   (success . paradise-green)
   (warning . money-rubber)

   (built-in            . kiss-darkened-twice)
   (preprocessor        . kiss-darkened-twice)
   (comment             . grey-2)
   (comment-delimiter   . grey-3)
   ;; (comment-doc         . )
   ;; (comment-doc-markup  . )
   ;; (punctuation         . )
   (type                . blush-essence)
   (function-name       . kiss)
   (variable-name       . kiss-darkened)
   (keyword             . chicle-darker)
   (string              . makeup-powder)
   (escaped-char        . orangeish)
   (negation            . money-rubber)
   (number              . orangeish)
   (constant            . orangeish)
   (regexp              . orangeish)
   (stand-out           . golden-darker)
   (trailing-whitespace . money-rubber)))

(define-gligan-theme purpurina
  dark
  purpurina-palette
  "A glamorous theme for your nocturnal needs.")

;;; purpurina-theme.el ends here
