(color-theme-blackboard)
(setq tab-width 4)
(column-number-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

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
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 100))

;; set font size
(set-face-attribute 'default nil :height 150)
(set-default-font "-apple-Cousine-medium-normal-normal-*-12-*-*-*-m-0-iso10646-")
