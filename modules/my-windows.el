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
;;   :bind "C-x C-o"
  :init
  (global-set-key [remap other-window] 'ace-window)
  :diminish ace-window-mode)

;; ibuffer
;; https://github.com/purcell/ibuffer-projectile
(use-package ibuffer-projectile
  :after projectile
  :config
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  (global-set-key (kbd "C-x C-b") 'ibuffer)      ; Use Ibuffer for buffer-list
  (setq ibuffer-saved-filter-groups
        (list
         (cons "default"
               (append
                (ibuffer-projectile-generate-filter-groups) ; get groups from
                                        ; ibuffer-projectile
                '(("emacs-config" (filename . ".emacs.d"))
                  ("org" (or
                          (mode . org-mode)
                          (filename . "^.*org$")))
                  ("shell" (or
                            (mode . eshell-mode)
                            (mode . (shell-mode))))
                  ("emacs" (or (name . "*scratch*")
                               (name . "*Messages*"))))))))
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-auto-mode 1)
              (ibuffer-switch-to-saved-filter-groups "default")))
  ;; Don't show filter groups if there are no buffers in that group
  (setq ibuffer-show-empty-filter-groups nil)
  ;; Don't ask for confirmation to delete marked buffers
  (setq ibuffer-expert t))

(provide 'my-windows)

;;; my-windows.el ends here
