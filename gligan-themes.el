
;;;###autoload
  (and load-file-name
       (boundp 'custom-theme-load-path)
       (add-to-list 'custom-theme-load-path
                    (file-name-as-directory
                     (file-name-directory load-file-name))))

(provide 'gligan-themes)
