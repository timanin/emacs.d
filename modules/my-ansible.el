;;; my-ansible.el --- Ansible mode settings -*- lexical-binding: t -*-

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

(require 'my-completion)

(use-package ansible
  :defer t
  :init
  ;; Auto-enable for yaml files
  (add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
  :config
  (use-package company-ansible
    :config
    (add-hook 'ansible-hook 'company-mode)
    (add-to-list 'company-backends 'company-ansible)))

(use-package ansible-doc
  :defer t
  :init
  (add-hook 'yaml-mode-hook #'ansible-doc-mode))

(provide 'my-ansible)

;;; my-ansible.el ends here

