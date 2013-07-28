(load-theme 'blackboard t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(column-number-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(tool-bar-mode -1)

;; Shift the selected region right if distance is postive, left if
;; negative
(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 4))

(defun shift-left ()
  (interactive)
  (shift-region -4))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one 
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)

;; set highlight
(global-set-key (kbd "C-c h") 'highlight-80+-mode)

;; set height and width
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

; (define-key read-expression-map [(tab)] 'hippie-expand)
; (defun hippie-unexpand ()
;   (interactive)
;   (hippie-expand 0))

; (define-key read-expression-map [(shift tab)] 'hippie-unexpand)

(defun smart-tab ()
 "This smart tab is minibuffer compliant: it acts as usual in
   the minibuffer. Else, if mark is active, indents region. Else if
   point is at the end of a symbol, expands it. Else indents the
   current line."
  (interactive)
  (if (string-match "Minibuf" (buffer-name))
     (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
       (indent-region (region-beginning)
                      (region-end))
      (if (looking-at "\\>")
          (dabbrev-expand nil)
            (indent-for-tab-command)))))

(global-set-key [tab] 'smart-tab)

;; set font size
;(set-face-attribute 'default nil :height 150)
;;(set-default-font "-apple-Cousine-medium-normal-normal-*-12-*-*-*-m-0-iso10646-")
(set-default-font "Ubuntu Mono-16")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'flymake)

(when (load "flymake" t)
      (defun flymake-pylint-init ()
        (let* ((temp-file (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
          (list "epylint" (list local-file))))
      (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))


;; I don't like the default colors :)
; (set-face-background 'flymake-errline "red4")
; (set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
   (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

       ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
       (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
     (flymake-mode))
       ))

(load "~/.emacs.d/puppet-mode-init.el")
(load "~/.emacs.d/puppet-mode.el")
