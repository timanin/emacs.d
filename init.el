;;; init.el -- The mother of it all -*- lexical-binding: t -*-

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
(unless package--initialized (package-initialize t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Ensure packages added with use-package are installed by default
(setq use-package-always-ensure t)
(setq use-package-verbose t)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(x mac ns))
    (exec-path-from-shell-initialize)))

;; Add modules directory to the list of directories to search for
;; files to load
(add-to-list 'load-path "~/.emacs.d/modules")

;; Effectively disable the custom facility
;; http://irreal.org/blog/?p=3765
(setq custom-file (make-temp-file "emacs-custom"))

;; Load provided features
(require 'my-appearance)
(require 'my-completion)
(require 'my-diff)
(require 'my-editing)
(require 'my-flex)
(require 'my-font)
(require 'my-general)
(require 'my-server)
(require 'my-help)
(require 'my-windows)

(require 'my-git)
(require 'my-project)
(require 'my-snippets)
(require 'my-syntax-check)

(require 'my-json)
(require 'my-markdown)
(require 'my-org)
(require 'my-yaml)
(require 'my-toml)

(require 'my-ansible)
(require 'my-elisp)
(require 'my-fish)
(require 'my-groovy)
(require 'my-haskell)
(require 'my-hashicorp)
(require 'my-python)
(require 'my-web)

;;; init.el ends here
