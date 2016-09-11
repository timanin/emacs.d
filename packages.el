;;; -*- lexical-binding: t -*-
;;; packages.el --- Packages to install

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

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(use-package color-theme)
(use-package base16-theme)
(use-package hlinum)

(use-package lice)

(use-package magit
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  :bind ("C-x g" . magit-status))

;;; packages.el ends here
