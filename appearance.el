;;; -*- lexical-binding: t -*-
;;; appearance.el --- Appearance settings & customisations.

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

;; Set colour theme
(require 'color-theme)
(load-theme 'base16-tomorrow-night t)

;; Change frame size & position on start
(setq default-frame-alist
      '((width . 120) (height . 58)
        (left . 650) (top . 25)))

;; Define font face and size
(add-to-list 'default-frame-alist '(font . "Fira Code-14"))
(custom-set-faces
 '(buffer-menu-buffer ((t (:weight normal))))
 '(ido-first-match ((t (:weight normal)))))

;; More sensible UI settings
(tool-bar-mode -1)                             ; No toolbar
(define-key menu-bar-tools-menu [games] nil)   ; Remove games menu
(scroll-bar-mode -1)                           ; No scrollbar
(setq inhibit-startup-message t)               ; No message at startup
(setq visible-bell nil)                        ; This is the default behaviour
(setq ring-bell-function (lambda ()            ; Instead blink the modeline
			   (invert-face 'mode-line)
			   (run-with-timer 0.1 nil 'invert-face 'mode-line)))
(global-font-lock-mode 1)                      ; Color enabled
(global-hl-line-mode t)                        ; Highlight cursor line

;; Cursor and mouse
(blink-cursor-mode 0)                          ; No blinking cursor
(setq track-eol nil)                           ; Cursor don't track end-of-line
(setq scroll-preserve-screen-position t)       ; Scroll without moving cursor
(setq mouse-wheel-progressive-speed nil)       ; Don't accelerate scrolling
(setq mouse-wheel-scroll-amount '(0.02))       ; Slower scrolling
(column-number-mode t)                         ; Show column number in mode-line

;; Tabs, spaces, lines and parenthesis
(setq-default indent-tabs-mode nil)            ; Use spaces instead of tabs
(setq-default tab-width 4)                     ; Length of tab is 4 SPC
(setq sentence-end-double-space nil)           ; Sentences end with one space
(setq truncate-partial-width-windows nil)      ; Don't truncate long lines
(setq-default indicate-empty-lines t)          ; Show empty lines
(setq next-line-add-newlines t)                ; Add newline when at buffer end
(setq require-final-newline 't)                ; Always newline at end of file
(setq ns-pop-up-frames nil)                    ; Do not open new frame for new file

(global-linum-mode 1)                          ; Show line numbers on buffers
(require 'hlinum)                              ; Highlight the current line number

(show-paren-mode 1)                            ; Highlight parenthesis pairs
(setq blink-matching-paren-distance nil)       ; Blinking parenthesis

;; Misc
(eldoc-mode 1)                                 ; Show small help in echo area

(defalias 'yes-or-no-p 'y-or-n-p)              ; Ask y/n instead of yes/no

(setq confirm-kill-emacs 'y-or-n-p)            ; Confirm quitting emacs

(add-hook 'after-init-hook
          #'global-flycheck-mode)              ; Enable syntax checking with Flycheck

(provide 'appearance)

;;; appearance.el ends here

