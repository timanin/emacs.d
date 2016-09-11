;;; -*- lexical-binding: t -*-
;;; general.el --- General settings.

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

;; Ask y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Confirm quitting emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Don't create backup files
(setq make-backup-files nil)

;; Save backup (#file#) files in temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Autosave every minute
(setq auto-save-timeout 60)

;; Automatically save buffers before launching M-x compile and friends,
;; instead of asking you if you want to save.
(setq compilation-ask-about-save nil)

;; Typing over a selected region erases it as you'd normally expect
(delete-selection-mode t)

;; Automatically revert a buffer, if the file has changed on disk
(global-auto-revert-mode 1)
(diminish 'auto-revert-mode)

;; Ignore case when completing file names
(setq read-file-name-completion-ignore-case 't)

;; needs to move
;(add-hook 'after-init-hook
;          #'global-flycheck-mode)              ; Enable syntax checking with Flycheck

(provide 'general)

;;; general.el ends here
