;;; my-editing.el --- General editor settings -*- lexical-binding: t -*-

;; Copyright (C) 2016  Sergey Timanin

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at

;;     http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Commentary:

;;; Code:

;; Ensure UTF-8 is always used
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; Use 4 spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Cursor don't track end-of-line
(setq track-eol nil)

;; Sentences end with one space
(setq sentence-end-double-space nil)

;; Don't truncate long lines
(setq truncate-partial-width-windows nil)

;; Show empty lines
(setq-default indicate-empty-lines t)

;; Add newline when at buffer end
(setq next-line-add-newlines t)

;; Always newline at end of file
(setq mode-require-final-newline nil)
(setq require-final-newline nil)

;; Auto-indent after pressing RET
(define-key global-map (kbd "RET") 'newline-and-indent)
;; Make return key also do indent, globally
(electric-indent-mode 1)

;; Save OS clipboard contents in the kill ring
(setq save-interprogram-paste-before-kill t)

;; Navigate CamelCase words as if they were separate words
(global-subword-mode 1)
(diminish 'subword-mode)

;; Bind C-h to DEL
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; hungry-delete mode
(use-package hungry-delete
  :defer 1
  :config
  (global-hungry-delete-mode))

;; expand-region mode
(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

;; quickly go to a char
(use-package iy-go-to-char
  :config
  (global-set-key (kbd "M-m") 'iy-go-to-char)
  (global-set-key (kbd "M-M") 'iy-go-to-char-backward))

;; Bind C-w to delete previous word
(defun kill-region-or-backward-kill-word (&optional arg region)
  "`kill-region' if the region is active, otherwise `backward-kill-word'.
Don't remember what `ARG' or `REGION' is there for."
  (interactive
   (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated.  However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (_ arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Toggle line comment and move cursor to the next line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (forward-line)))
(global-set-key (kbd "C-;") 'comment-or-uncomment-region-or-line)

;; Bind <f5> to recompile
(global-set-key (kbd "<f5>") 'recompile)

;; Bind M-[ to align
(global-set-key (kbd "M-[") 'align)

;; Bind C-x a r to align-regexp
(global-set-key (kbd "C-x a r") 'align-regexp)

;; Disable the warning when using buffer narrowing
(put 'narrow-to-region 'disabled nil)

;; Similarly, allow to upcase and donwcase a region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; C-x C-r to rename the file opened in the current buffer
;; from http://whattheemacsd.com/file-defuns.el-01.html
(defun rename-current-buffer-file ()
  "Rename current buffer and the file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; C-x C-k to delete the file opened in the current buffer
;; from http://whattheemacsd.com/file-defuns.el-02.html
(defun delete-current-buffer-file ()
  "Remove file connected to current buffer and kill the buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; editorconfig support
(use-package editorconfig
  :config
  (editorconfig-mode 1))

(provide 'my-editing)

;;; my-editing.el ends here
