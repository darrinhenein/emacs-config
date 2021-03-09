;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Darrin Henein"
      user-mail-address "darrinhenein@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Variable" :size 12 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Source Code Variable" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-challenger-deep)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(require 'darkroom)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

(add-hook 'after-init-hook 'global-hl-todo-mode)
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
)
;;
;;
(after! org
       (setq org-todo-keywords
             '((sequence "TODO" "PAUSED" "NOTE" "|" "DONE" "DEAD")
               (sequence "[ ]" "[-]" "[?]" "|" "[X]" "[.]"))
             )
       (setq hl-todo-keyword-faces
             '(("TODO" . org-todo)
               ("NOTE" . (:foreground "LightSalmon" :weight "bold"))
               ("PAUSED" . org-done)
               ("DEAD" . org-done)))

        ;; (setq org-agenda-prefix-format "%-13.13c %s")
        (setq org-agenda-prefix-format "  ")
        (setq org-agenda-include-diary t)
        (setq org-agenda-span 7)
        (setq org-agenda-start-on-weekday 1)
)


(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100
      org-agenda-compact-blocks t)

(setq org-super-agenda-groups
       '((:auto-category t)))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
