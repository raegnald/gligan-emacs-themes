;;; gligan-themes.el --- The Gligan theme collection  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ronaldo Gligan

;; Author: Ronaldo Gligan <ronaldogligan@gmail.com>
;; Keywords: faces

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This file contains common functionality used by all the Gligan
;; themes. It mainly defines two macros: one for creating a palette of
;; colours and the associations between those colours to the elements
;; they should correspond to, and another macro for creating a theme
;; out of that palette (see macros `define-gligan-palette' and
;; `define-gligan-theme'). On the other hand, it provides extra
;; customisations for making the Emacs frame and windows more sleek,
;; by giving them padding.

;;; Code:

(require 'cl-lib)
(require 'custom)

(defgroup gligan-themes ()
  "Options that apply to all themes in the Gligan collection."
  :group 'faces)

(defcustom gligan/modeline-padding 6
  "Amount of pixels to apply as padding to the modeline."
  :group 'gligan-themes
  :type 'integer)

(defcustom gligan/spacious-frame t
  "Whether or not to apply extra margin to the Emacs frame."
  :group 'gligan-themes
  :type 'boolean)


(defvar gligan/light-themes '(ellas))
(defvar gligan/dark-themes '(cappuccino-noir somnus purpurina))


(defmacro define-gligan-palette (palette-name
                                 palette-colours
                                 palette-associations)
  "Define a palette with a given PALETTE-NAME.
The second argument is an alist of PALETTE-COLOURS in
the format (name . value). The argument PALETTE-ASSOCIATIONS is
another alist of colour associations."
  (declare (indent defun))
  (let* ((associate-palette-name-with-colour
          (lambda (palette-association)
            (cl-destructuring-bind (name . colour) palette-association
              (cons name (or (alist-get colour palette-colours)
                             colour)))))

         (palette
          (mapcar associate-palette-name-with-colour
                  palette-associations)))

    `(eval-when-compile (defvar ,palette-name (quote ,palette)))))


(defun --colour (palette &rest names)
  "Return a color from a PALETTE.
Takes a list of colour NAMES and returns the colour with the
first matching name."
  (let (colour)
    (while (and (null colour) names)
      (setq colour (alist-get (pop names) (eval palette))))
    colour))

(defmacro define-gligan-theme (theme-name light-or-dark palette &optional doc)
  "Create a theme given a THEME-NAME and a PALETTE.
LIGHT-OR-DARK can be either they symbol `light' or `dark'.
Optionally add a DOC string."
  (declare (indent defun) (doc-string 4))

  ;; Checking that the theme being defined is part of the theme list
  (let ((correct-theme-list
         (pcase light-or-dark
           ('dark  gligan/dark-themes)
           ('light gligan/light-themes))))
    (unless (memq theme-name correct-theme-list)
      (error "%s is not part of the theme list" theme-name)))

  `(progn
     (deftheme ,theme-name ,doc)
     (custom-theme-set-faces
      (quote ,theme-name)
      '(default ((t (:background ,(--colour palette 'background)
                     :foreground ,(--colour palette 'foreground)))))
      '(cursor ((t (:background ,(--colour palette 'cursor)))))
      '(region ((t (:background ,(--colour palette 'region)))))
      '(fringe ((t (:background ,(--colour palette 'fringe 'background)))))
      '(vertical-border ((t (:foreground ,(--colour palette
                                                    'window-border
                                                    'background-accent-strong)))))
      '(trailing-whitespace ((t (:background ,(--colour palette
                                                        'trailing-whitespace
                                                        'red)))))

      '(line-number              ((t (:foreground ,(--colour palette
                                                             'line-number
                                                             'grey-neutral)))))
      '(line-number-current-line ((t (:foreground ,(--colour palette
                                                             'current-line-number
                                                             'grey-accent)))))

      '(highlight           ((t (:background ,(--colour palette
                                                        'primary-highlight
                                                        'background-accent-medium)))))
      '(secondary-selection ((t (:background ,(--colour palette
                                                        'secondary-highlight
                                                        'background-accent-light) ))))

      '(mode-line          ((t (:foreground ,(--colour palette
                                                       'mode-line-foreground
                                                       'foreground)
                                :background ,(--colour palette
                                                       'mode-line-background
                                                       'background-accent-medium)
                                :box (:line-width ,gligan/modeline-padding
                                      :color ,(--colour palette
                                                        'mode-line-background
                                                        'background-accent-medium)
                                      :style nil)))))
      '(mode-line-inactive ((t (:foreground ,(--colour palette
                                                       'mode-line-inactive-foreground
                                                       'foreground)
                                :background ,(--colour palette
                                                       'mode-line-inactive-background
                                                       'background-accent-light)
                                :box (:line-width ,gligan/modeline-padding
                                      :color ,(--colour palette
                                                       'mode-line-inactive-background
                                                       'background-accent-light)
                                      :style nil)))))
      '(mode-line-buffer-id ((t (:foreground ,(--colour palette
                                                        'buffer-name
                                                        'accent-medium)
                                 :bold t))))

      '(ansi-color-black   ((t (:foreground ,(--colour palette 'black)
                                :background ,(--colour palette 'black)))))
      '(ansi-color-white   ((t (:foreground ,(--colour palette 'white)
                                :background ,(--colour palette 'white)))))
      '(ansi-color-red     ((t (:foreground ,(--colour palette 'red)
                                :background ,(--colour palette 'red)))))
      '(ansi-color-green   ((t (:foreground ,(--colour palette 'green)
                                :background ,(--colour palette 'green)))))
      '(ansi-color-yellow  ((t (:foreground ,(--colour palette 'yellow)
                                :background ,(--colour palette 'yellow)))))
      '(ansi-color-blue    ((t (:foreground ,(--colour palette 'blue)
                                :background ,(--colour palette 'blue)))))
      '(ansi-color-magenta ((t (:foreground ,(--colour palette 'magenta)
                                :background ,(--colour palette 'magenta)))))
      '(ansi-color-cyan    ((t (:foreground ,(--colour palette 'cyan)
                                :background ,(--colour palette 'cyan)))))

      '(success ((t (:foreground ,(--colour palette 'success 'green)
                     :weight bold))))
      '(warning ((t (:foreground ,(--colour palette 'warning 'red)
                     :weight bold))))

      '(font-lock-builtin-face           ((t (:foreground ,(--colour palette 'built-in)
                                              :bold t))))
      '(font-lock-preprocessor-face      ((t (:foreground ,(--colour palette 'preprocessor)
                                              :bold t))))
      '(font-lock-comment-face           ((t (:foreground ,(--colour palette 'comment)
                                              :slant italic))))
      '(font-lock-comment-delimiter-face ((t (:foreground ,(--colour palette 'comment-delimiter)
                                              :slant italic))))
      '(font-lock-doc-face               ((t (:foreground ,(--colour palette 'comment-doc)))))
      '(font-lock-doc-markup-face        ((t (:foreground ,(--colour palette 'comment-doc-markup)))))
      '(font-lock-punctuation-face       ((t (:foreground ,(--colour palette 'punctuation)))))
      '(font-lock-type-face              ((t (:foreground ,(--colour palette 'type)))))
      '(font-lock-function-name-face     ((t (:foreground ,(--colour palette 'function-name)
                                              :bold t))))
      '(font-lock-variable-name-face     ((t (:foreground ,(--colour palette 'variable-name)))))
      '(font-lock-keyword-face           ((t (:foreground ,(--colour palette 'keyword)))))
      '(font-lock-string-face            ((t (:foreground ,(--colour palette 'string)))))
      '(font-lock-escape-face            ((t (:foreground ,(--colour palette 'escaped-char)))))
      '(font-lock-negation-char-face     ((t (:foreground ,(--colour palette 'negation)))))
      '(font-lock-number-face            ((t (:foreground ,(--colour palette 'number)))))
      '(font-lock-constant-face          ((t (:foreground ,(--colour palette 'constant)))))
      '(font-lock-regexp-face            ((t (:foreground ,(--colour palette 'regexp)))))
      '(font-lock-warning-face           ((t (:foreground ,(--colour palette 'stand-out)
                                                          :bold t))))

      '(minibuffer-prompt ((t (:foreground ,(--colour palette
                                                      'minibuffer-prompt
                                                      'accent-strong)
                               :bold t))))

      '(italic ((t (:slant italic :underline nil))))

      '(match ((t nil)))
      '(show-paren-match ((t (:inverse-video t))))

      '(link ((t (:foreground ,(--colour palette 'link-foreground 'grey-neutral)
                  :underline t))))

      '(hl-line ((t (:background ,(--colour palette
                                            'current-line-background
                                            'background-accent-light)))))
      )
     (provide-theme (quote ,theme-name))))


(defvar gligan/after-theme-toggle-hook nil
  "Hook that is run after an Gligan theme has loaded.")

(defun gligan/themes ()
  "Get all available themes."
  (append gligan/light-themes gligan/dark-themes))

;;;###autoload
(defun gligan/set-theme (theme &optional dont-disable-rest)
  "Set the current theme to THEME.

By default, this function disables all loaded themes before
applying the new one. The argument DONT-DISABLE-REST, when non
nil, inhibits this behaviour."
  (interactive
   (list
    (intern (completing-read "Theme: " (gligan/themes)))))

  (unless dont-disable-rest
    (dolist (enabled-theme custom-enabled-themes)
      (disable-theme enabled-theme)))

  (load-theme theme t)

  (run-hooks 'gligan/after-theme-toggle-hook))

(defun gligan/spacious-frame-style-tweaks ()
  "Apply the stylistic tweaks that make the frame sleek."
  (when gligan/spacious-frame
    (modify-all-frames-parameters
     '((internal-border-width . 15)
       (right-divider-width . 15)
       (left-fringe . 8)
       (right-fringe . 8)))

    (let ((bg (face-attribute 'default :background)))
      (set-face-attribute 'window-divider nil
                          :foreground bg)
      (set-face-attribute 'window-divider-first-pixel nil
                          :foreground bg)
      (set-face-attribute 'window-divider-last-pixel nil
                          :foreground bg))))

(add-hook 'gligan/after-theme-toggle-hook
          'gligan/spacious-frame-style-tweaks)

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))


(provide 'gligan-themes)

;;; gligan-themes.el ends here
