;;; -*- lexical-binding: t -*-
;;; init.el -- The mother of it all.

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

;; Configure & initialise package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Ensure packages added with use-package are installed by default
(setq use-package-always-ensure t)

;; Add modules directory to the list of directories to search for
;; files to load
(add-to-list 'load-path "~/.emacs.d/modules")

;; Load provided features
(require 'appearance)
(require 'general)
(require 'windows)
(require 'editing)
(require 'git)
(require 'support)

;;; init.el ends here

