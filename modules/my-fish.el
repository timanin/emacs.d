;;; my-fish.el --- Fish mode settings -*- lexical-binding: t -*-

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

(use-package fish-mode
  :init
  ;; run fish_indent before save:
  (add-hook 'fish-mode-hook
           (lambda ()
             (add-hook 'before-save-hook 'fish_indent-before-save))))

(provide 'my-fish)

;;; my-fish.el ends here

