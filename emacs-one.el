;;; emacs-one.el --- One For Emacs

;; Copyright (C) 2018 Balaji Sivaraman

;; Author: Balaji Sivaraman <balaji@balajisivaraman.com>
;; URL: http://github.com/balajisivaraman/emacs-one-themes
;; Version: 0.1.0

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of the Vim/Atom One colorscheme to Emacs.
;;
;;; Credits
;;
;; This theme is heavily inspired by the Vim port of One created by
;; Ramir Akremi.
;;
;;; Code:

;;; Setup
(defconst emacs-one-colours
  '((dark . ((mono1 . "#ABB2BF")
             (mono2 . "#828997")
             (mono3 . "#5C6370")
             (mono4 . "#4B5263")
             (cyan . "#56B6C2")
             (blue . "#61AFEF")
             (violet . "#C678DD")
             (green . "#98C379")
             (magenta . "#E06C75")
             (red . "#BE5046")
             (orange . "#D19A66")
             (yellow . "#E5C07B")
             (background . "#282C34")
             (contrast-bg . "#2C323C")
             (low-contrast-bg . "#292E37")
             (fringe . "#636D83")
             (accent . "#528BFF")
             (highlight . "#3E4452")))
    (light . ((mono1 . "#494B53")
              (mono2 . "#696C77")
              (mono3 . "#A0A1A7")
              (mono4 . "#C2C2C3")
              (cyan . "#0184BC")
              (blue . "#4078F2")
              (violet . "#A626A4")
              (green . "#50A14F")
              (magenta . "#E45649")
              (red . "#CA1243")
              (orange . "#986801")
              (yellow . "#C18401")
              (background . "#FAFAFA")
              (contrast-bg . "#F0F0F0")
              (low-contrast-bg . "#F5F5F5")
              (fringe . "#9E9E9E")
              (accent . "#526FFF")
              (highlight . "#D0D0D0")))))

(defmacro emacs-one-with-colour-variables (variant &rest body)
  "Helper macro to setup colours for the provided `VARIANT' to be used in `BODY'."
  (declare (indent defun))
  `(let* ((colours (cdr (assoc ,variant emacs-one-colours)))
          (mono1 (cdr (assoc 'mono1 colours)))
          (mono2 (cdr (assoc 'mono2 colours)))
          (mono3 (cdr (assoc 'mono3 colours)))
          (mono4 (cdr (assoc 'mono4 colours)))
          (cyan (cdr (assoc 'cyan colours)))
          (blue (cdr (assoc 'blue colours)))
          (violet (cdr (assoc 'violet colours)))
          (green (cdr (assoc 'green colours)))
          (magenta (cdr (assoc 'magenta colours)))
          (red (cdr (assoc 'red colours)))
          (orange (cdr (assoc 'orange colours)))
          (yellow (cdr (assoc 'yellow colours)))
          (background (cdr (assoc 'background colours)))
          (contrast-bg (cdr (assoc 'contrast-bg colours)))
          (low-contrast-bg (cdr (assoc 'low-contrast-bg colours)))
          (fringe (cdr (assoc 'fringe colours)))
          (accent (cdr (assoc 'accent colours)))
          (highlight (cdr (assoc 'highlight colours)))
          (foreground mono1)
          (comment mono3)
          (class '((class color) (min-colors 89)))
          (background-mode (if (eq ,variant 'light) 'light 'dark)))
     ,@body))

(defun create-one-theme (variant theme-name)
  "Create a `VARIANT' of the theme named `THEME-NAME'."
  (emacs-one-with-colour-variables
   variant
   (custom-theme-set-faces
    theme-name
    ;; Emacs Interface Colours
    `(default ((,class (:foreground ,foreground :background ,background))))
    `(cursor ((,class (:background ,mono1))))
    `(fringe ((,class (:background ,low-contrast-bg :foreground ,fringe))))
    `(linum ((,class (:background ,background :foreground ,comment :italic nil :underline nil))))
    `(highlight ((,class (:background ,contrast-bg))))
    `(vertical-border ((,class (:foreground ,contrast-bg))))
    `(border ((,class (:background ,contrast-bg :foreground ,highlight))))
    `(region ((,class (:background ,highlight :inverse-video nil))))
    `(secondary-selection ((,class (:background ,highlight))))
    `(mode-line ((,class (:foreground ,foreground :background ,contrast-bg :weight normal
                                      :box (:line-width 1 :color ,contrast-bg)))))
    `(mode-line-buffer-id ((,class (:foreground ,mono1 :background nil))))
    `(mode-line-inactive ((,class (:inherit mode-line
                                            :foreground ,comment
                                            :background ,highlight :weight normal))))
    `(mode-line-emphasis ((,class (:foreground ,foreground :slant italic))))
    `(mode-line-highlight ((,class (:foreground ,violet :box nil :weight bold))))
    `(minibuffer-prompt ((,class (:foreground ,blue))))

    ;; Standard font lock faces
    `(font-lock-builtin-face ((,class (:foreground ,mono2))))
    `(font-lock-comment-delimiter-face ((,class (:foreground ,comment :slant italic))))
    `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
    `(font-lock-constant-face ((,class (:foreground ,green))))
    `(font-lock-doc-face ((,class (:foreground ,comment))))
    `(font-lock-doc-string-face ((,class (:foreground ,yellow))))
    `(font-lock-function-name-face ((,class (:foreground ,blue))))
    `(font-lock-keyword-face ((,class (:foreground ,magenta))))
    `(font-lock-negation-char-face ((,class (:foreground ,blue))))
    `(font-lock-preprocessor-face ((,class (:foreground ,yellow))))
    `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow))))
    `(font-lock-regexp-grouping-construct ((,class (:foreground ,violet))))
    `(font-lock-string-face ((,class (:foreground ,green))))
    `(font-lock-type-face ((,class (:foreground ,blue))))
    `(font-lock-variable-name-face ((,class (:foreground ,yellow))))
    `(font-lock-warning-face ((,class (:weight bold :foreground ,red))))
    `(shadow ((,class (:foreground ,comment))))
    `(success ((,class (:foreground ,green))))
    `(error ((,class (:foreground ,red))))
    `(warning ((,class (:foreground ,orange))))
    `(tooltip ((,class (:foreground ,yellow :background ,background :inverse-video t))))
    )))

;;; Footer

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
(file-name-as-directory (file-name-directory load-file-name))))

(provide 'emacs-one)
;;; emacs-one.el ends here
