;;; -*- lexical-binding: t -*-
;;; my-diff.el --- Ediff buffers settings.

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

;; ediff: split horizontally
(setq ediff-split-window-function 'split-window-horizontally)

;; ediff: do not spawn a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(provide 'my-diff)

;;; my-diff.el ends here
