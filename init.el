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

;; Load packages and activate them
(package-initialize)

;; Refresh the packages description
(unless package-archive-contents (package-refresh-contents))

;; Paradox is the new replacement for a default package manager, it
;; has a more modern user interface and support for things like github
;; stars
(when (not (package-installed-p 'paradox))
  (package-install 'paradox))

;; Bootstrap use-package for managing packages
(paradox-require 'use-package)
(require 'use-package)

;; Ensure packages added with use-package are installed by default
(setq use-package-always-ensure t)

(paradox-require 'exec-path-from-shell)

(when (memq window-system '(x mac ns))
  (exec-path-from-shell-initialize))

;; Add modules directory to the list of directories to search for
;; files to load
(add-to-list 'load-path "~/.emacs.d/modules")

;; Start server if not running yet
(load "server")
(unless (server-running-p) (server-start))

;; Edit server
(use-package edit-server
  :init
  (edit-server-start)
  :config
  (setq edit-server-new-frame nil))

;; Load provided features
(require 'my-ansible)
(require 'my-appearance)
(require 'my-completion)
(require 'my-diff)
(require 'my-editing)
(require 'my-elisp)
(require 'my-fish)
(require 'my-flex)
(require 'my-general)
(require 'my-git)
(require 'my-haskell)
(require 'my-json)
(require 'my-markdown)
(require 'my-org)
(require 'my-snippets)
(require 'my-support)
(require 'my-syntax-check)
(require 'my-web)
(require 'my-windows)
(require 'my-yaml)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(markdown-command "/usr/local/bin/markdown"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffer-menu-buffer ((t (:weight normal))))
 '(ido-first-match ((t (:weight normal)))))
