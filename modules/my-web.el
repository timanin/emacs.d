;;; my-web.el --- Web settings -*- lexical-binding: t -*-

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

;; Enable for the matching filenames
;;
(use-package web-mode
  :mode
  ("\\.phtml\\'" "\\.djhtml\\'" "\\.html\\'")
  ;; Marks the -*- engine: jinja -*- variable as safe
  :init
  (add-hook 'web-mode-hook
            (lambda ()
              (setq safe-local-variable-values
                    '((engine . jinja)))))
  :config
  (setq web-mode-enable-engine-detection t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(provide 'my-web)

;;; my-web.el ends here
