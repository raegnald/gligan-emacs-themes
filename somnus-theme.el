;;; somnus-theme.el --- The perfect companion for Emacs at night
;;; Version: 1.0
;;; Commentary:
;;; A theme to focus and not to strain your eyes during a late night
;;; software development session.
;;;
;;; This theme is a reimplementation of the original Somnus theme
;;; using the tools provided by `gligan-themes.el'.
;;;
;;; Code:

(require 'gligan-themes)

(define-gligan-palette somnus-palette
  ;; The palette colours
  ((main-bg              . "#090e13")
   (main-fg              . "#dee8f1")

   (modeline-bg          . "#24384b")
   (modeline-bg-inactive . "#162330")
   (subtle-difference    . "#0c1319")

   (light-violet         . "#dabdfc")
   (cold-lips            . "#bdbffc")
   (liliac               . "#bfb5ff")
   (pineapple            . "#e8d283")
   (champagne            . "#e2d7ae")
   (keyword-yellow       . "#f1d384")
   (make-up              . "#e2bbae")
   (almost-grey          . "#ccc9c9")
   (cotton-candy         . "#f5c5d1")
   (autumn               . "#ffb951")
   (meh-blue             . "#aac7e0")
   (region-blue          . "#225487")
   (modern-blue          . "#b7d0ea")
   (nice-blue            . "#9dcdff")
   (link-cyan            . "#14e5e5")
   (salmonish            . "#ff8660")
   (old-green-wall       . "#aad2ae")
   (almost-black         . "#05080a"))

  ;; The palette associations
  ((background . main-bg)
   (foreground . main-fg)

   (cursor      . pineapple)
   (region      . modeline-bg)
   (fringe      . main-bg)
   (buffer-name . main-fg)

   (background-accent-strong . modeline-bg)
   (background-accent-medium . modeline-bg-inactive)
   (background-accent-light  . modeline-bg-inactive)

   (accent-strong . keyword-yellow)
   (accent-medium . pineapple)
   (accent-light  . champagne)

   (grey-neutral . almost-grey)
   (grey-accent  . meh-blue)

   (line-number             . almost-grey)
   (current-line-number     . almost-grey)
   (current-line-background . subtle-difference)

   (white   . main-fg)
   (black   . almost-black)
   (red     . salmonish)
   (green   . old-green-wall)
   (yellow  . keyword-yellow)
   (blue    . region-blue)
   (magenta . cotton-candy)
   (cyan    . nice-blue)

   (success . old-green-wall)
   (warning . salmonish)

   (built-in            . liliac)
   (preprocessor        . liliac)
   (comment             . make-up)
   (comment-delimiter   . almost-grey)
   (comment-doc         . cold-lips)
   (comment-doc-markup  . light-violet)
   (punctuation         . main-fg)
   (type                . champagne)
   (function-name       . nice-blue)
   (variable-name       . modern-blue)
   (keyword             . keyword-yellow)
   (string              . cotton-candy)
   (escaped-char        . old-green-wall)
   (negation            . autumn)
   (number              . autumn)
   (constant            . autumn)
   (regexp              . cotton-candy)
   (stand-out           . salmonish)
   (trailing-whitespace . salmonish)

   (link . link-cyan)

   (minibuffer-prompt . nice-blue)))

(define-gligan-theme somnus
  dark
  somnus-palette
  "A theme to focus and not to strain your eyes during a late
night software development session.")

;;; somnus-theme.el ends here
