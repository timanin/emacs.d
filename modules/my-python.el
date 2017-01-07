;;; my-python.el --- Python settings & customisations -*- lexical-binding: t -*-

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

(defun my-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(use-package company-jedi
  :defer t
  :init
  (eval-after-load "company"
    '(add-hook 'python-mode-hook 'my-python-mode-hook)))

(use-package anaconda-mode
  :defer t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :defer t
  :config
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda)))

(provide 'my-python)

;;; my-python.el ends here

