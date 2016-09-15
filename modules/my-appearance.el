;;; -*- lexical-binding: t -*-
;;; my-appearance.el --- Appearance settings & customisations.

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

;; Change frame size & position on start
(setq default-frame-alist
      '((width . 120) (height . 58)
        (left . 650) (top . 25)))

;; Set colour theme
(use-package base16-theme
  :config (load-theme 'base16-tomorrow-night t))

;; Define font face and size
(add-to-list 'default-frame-alist '(font . "Fira Code-14"))
(custom-set-faces
 '(buffer-menu-buffer ((t (:weight normal))))
 '(ido-first-match ((t (:weight normal)))))

;; Start in OS X native fullscreen
;(add-hook 'window-setup-hook
;	  'toggle-frame-fullscreen t)

;; Disable toolbar
(tool-bar-mode -1)

;; Remove games menu
(define-key menu-bar-tools-menu [games] nil)

;; Disable scrollbar
(scroll-bar-mode -1)

;; Get rid of the default startup screen
(setq inhibit-startup-message t)

;; Blink the modeline instead of making noise
(setq ring-bell-function (lambda ()
			   (invert-face 'mode-line)
			   (run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; Highlight cursor line
(global-hl-line-mode 1)

;; Show tooltips in minibuffer instead of as a hover-on
(tooltip-mode -1)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Show line numbers on buffers
(global-linum-mode t)
(setq linum-format (if (not window-system) "%4d " "%4d"))

;; Highlight the current line number
(use-package hlinum
  :config
  (hlinum-activate))

;; Show column number in modeline
(column-number-mode t)

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Automatically insert a closing parenthesis
(electric-pair-mode 1)

;; Blinking parenthesis
(setq blink-matching-paren-distance nil)

;; Tidy modeline
(use-package diminish)

(use-package "smart-mode-line"
  :commands sml/setup
  :demand t
  :init
  (setq sml/theme 'respectful)
  ;; recommended defaults
        sml/shorten-directory t
        sml/shorten-modes t
        sml/name-width 40
        sml/mode-width 'full)
  :config
  (sml/setup))

(provide 'my-appearance)

;;; my-appearance.el ends here

