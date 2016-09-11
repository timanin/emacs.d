;;; -*- lexical-binding: t -*-
;;; windows.el --- Windows, frames & buffers settings.

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

;; Buffers and windows
(global-set-key "\C-x\C-b" 'buffer-menu)       ; CxCb puts point on buffer list
(icomplete-mode t)                             ; Completion in mini-buffer
(setq read-buffer-completion-ignore-case 't)   ; Ignore case when completing buffer names
(setq uniquify-buffer-name-style 'forward)     ; Unique representation of the buffer names
(persistent-scratch-setup-default)             ; Persistent *scratch*

;; Files and sessions
; save backup (#file#) files in temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-timeout 60)                    ; Autosave every minute
(setq make-backup-files nil)                   ; Don't create backup files
(setq read-file-name-completion-ignore-case 't); Ignore case when completing file names

;; ace-window
(use-package ace-window
  :ensure t
  :init
  (global-set-key [remap other-window] 'ace-window))

(provide 'windows)

;;; windows.el ends here
