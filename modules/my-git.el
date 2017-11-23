;;; my-git.el --- Git settings -*- lexical-binding: t -*-

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

(use-package magit
  :bind
  (("C-x g" . magit-status)
  :map magit-status-mode-map
  ("q" . magit-quit-session))
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))

  ;; full screen magit-status
  ;; from http://whattheemacsd.com/setup-magit.el-01.html

  (defadvice magit-status (around magit-fullscreen activate)
    "Open magit status as a fullscreen buffer."
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defun magit-quit-session ()
    "Restore the previous window configuration and kill the magit buffer."
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen)))

(provide 'my-git)

;;; my-git.el ends here

