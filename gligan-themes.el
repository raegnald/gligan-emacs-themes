
(require 'cl-lib)


(defgroup gligan-themes ()
  "Options that apply to all themes in the Gligan collection."
  :group 'faces)

(defcustom gligan/modeline-padding 6
  "Amount of pixels to apply as padding to the modeline."
  :group 'gligan-themes)

(defcustom gligan/spacious-frame t
  "Whether or not to apply extra margin to the Emacs frame."
  :group 'gligan-themes)


(defvar gligan/light-themes '(ellas))
(defvar gligan/dark-themes '(cappuccino-noir somnus))


(defmacro define-gligan-palette (palette-name
                                 palette-colours
                                 palette-associations)
  (declare (indent defun))
  (let* ((associate-palette-name-with-colour
          (lambda (palette-association)
            (cl-destructuring-bind (name . colour) palette-association
              (cons name (or (alist-get colour palette-colours)
                             colour)))))

         (palette
          (mapcar associate-palette-name-with-colour
                  palette-associations)))

    `(defvar ,palette-name (quote ,palette))))


(defun --colour (palette &rest names)
  "Return the first available colour associated with a name."
  (let (colour)
    (while (and (null colour) names)
      (setq colour (alist-get (pop names) (eval palette))))
    colour))

(defmacro define-gligan-theme (theme-name light-or-dark palette &optional doc)
  (declare (indent defun) (doc-string 4))

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
  (append gligan/light-themes gligan/dark-themes))

;;;###autoload
(defun gligan/set-theme (theme &optional dont-disable-rest)
  (interactive
   (list
    (intern (completing-read "Theme: " (gligan/themes)))))

  (unless dont-disable-rest
    (dolist (enabled-theme custom-enabled-themes)
      (disable-theme enabled-theme)))

  (load-theme theme t)

  (run-hooks 'gligan/after-theme-toggle-hook))

(defun gligan/spacious-frame-style-tweaks ()
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
