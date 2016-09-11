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

;; Load packages
(load "~/.emacs.d/packages.el")

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


;;; init.el ends here

