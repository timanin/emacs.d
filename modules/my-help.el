;;; my-help.el --- Help settings -*- lexical-binding: t -*-

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

;; Which-key helps discover keybindings available for the current
;; buffer mode
(use-package which-key
  :defer 10
  ;; :bind
  ;; ("C-h C-k" . which-key-show-top-level)
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-popup-type 'side-window)
  (setq which-key-side-window-location 'bottom)
  (setq which-key-side-window-max-height 0.33)
  ;; Show small help in echo area
  (eldoc-mode 1)
  :diminish
  (which-key-mode eldoc-mode))

(provide 'my-help)

;;; my-help.el ends here
