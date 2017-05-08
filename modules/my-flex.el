;;; my-flex.el --- Flex matching settings -*- lexical-binding: t -*-

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

;; Using flx-ido to replace default ido
;; https://github.com/lewang/flx
(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights
  (setq ido-enable-flex-matching t
        ido-use-faces nil
        gc-cons-threshold 20000000))

;; Enable it everywhere
(use-package ido-ubiquitous
  :defer 2
  :config
  (ido-ubiquitous-mode))

(use-package smex
  :config
  (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ;; Old M-x
  ("C-c C-c M-x" . execute-extended-command))

(provide 'my-flex)

;;; my-flex.el ends here
