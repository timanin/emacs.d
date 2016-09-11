;;; -*- lexical-binding: t -*-
;;; editing.el --- General editor settings.

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
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

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

;; Navigate CamelCase words as if they were separate words
(global-subword-mode 1)
(diminish 'subword-mode)

(provide 'editing)

;;; editing.el ends here

