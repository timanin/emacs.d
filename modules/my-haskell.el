;;; my-haskell.el --- Haskell mode settings -*- lexical-binding: t -*-

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

;; Based on: http://haskell.github.io/haskell-mode/manual/latest/Interactive-Haskell.html#Interactive-Haskell

(use-package haskell-mode
  :defer t
  :config
  (add-hook 'haskell-mode-hook 'haskell-doc-mode)
  :bind
  (:map haskell-mode-map
        ("C-c C-l" . haskell-process-load-file)
        ("C-`" . haskell-interactive-bring)
        ("C-c C-t" . haskell-process-do-type)
        ("C-c C-i" . haskell-process-do-info)
        ("C-c C-c" . haskell-process-cabal-build)
        ("C-c C-k" . haskell-interactive-mode-clear)
        ("C-c c" . haskell-process-cabal)
        ("C-c C-." . haskell-indent-align-guards-and-rhs)
   :map haskell-cabal-mode-map
        ("C-`" . haskell-interactive-bring)
        ("C-c C-k" . haskell-interactive-mode-clear)
        ("C-c C-c" . haskell-process-cabal-build)
        ("C-c c" . haskell-process-cabal)))
(use-package ghc
  :defer t)
(use-package hi2
  :defer t
  :config
  (add-hook 'haskell-mode-hook 'turn-on-hi2))
(use-package intero
  :defer t)
(use-package flycheck-haskell
  :defer t)
(use-package company-ghc
  :defer t
  :config
  (add-hook 'haskell-mode-hook 'company-mode)
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t)))

;; Intero
;(add-hook 'haskell-mode-hook 'intero-mode)

;; Customizations
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

;; GHCi process type
(custom-set-variables
 '(haskell-process-type 'cabal-repl))

(setq haskell-process-path-cabal "~/.cabal/bin/cabal")

(eval-after-load "align"
  '(add-to-list 'align-rules-list
               '(haskell-types
                 (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode)))))
(eval-after-load "align"
  '(add-to-list 'align-rules-list
               '(haskell-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode)))))
(eval-after-load "align"
  '(add-to-list 'align-rules-list
               '(haskell-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode)))))
(eval-after-load "align"
  '(add-to-list 'align-rules-list
               '(haskell-left-arrows
                 (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode)))))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(provide 'my-haskell)

;;; my-haskell.el ends here

