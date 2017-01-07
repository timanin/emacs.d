;;; my-windows.el --- Windows, frames & buffers settings -*- lexical-binding: t -*-

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

;; Persistent *scratch*
(use-package persistent-scratch
  :init
  (persistent-scratch-setup-default))

(setq ns-pop-up-frames nil)                    ; Do not open new frame for new file

;; Scroll without moving cursor
(setq scroll-preserve-screen-position t)

;; Don't accelerate scrolling and scroll slower
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(0.02))

;; ace-window
(use-package ace-window
  :bind "C-x C-o"
  :init
  (global-set-key [remap other-window] 'ace-window)
  :diminish
  (ace-window-mode))

(provide 'my-windows)

;;; my-windows.el ends here
