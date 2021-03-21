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
      doom-variable-pitch-font (font-spec :family "SF Compact" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-challenger-deep)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-agenda-files (directory-files-recursively "~/iCloud/org/" "\\.org$"))
(setq org-roam-directory "~/iCloud/org")
(add-hook 'after-init-hook 'org-roam-mode)

(setq org-journal-dir "~/iCloud/org/Journal/")
(setq org-journal-date-format "%A, %B %d %Y")
(setq org-journal-file-format "%Y-%m-%d (W%V).org")
(setq org-journal-enable-agenda-integration t)
(setq org-journal-file-header "#+TITLE: Weekly Notes - Week %V %Y\n\n")
(setq org-journal-file-type 'weekly)

(after! org-journal
        (setq org-roam-completion-everywhere t)
)


(after! org-roam
        (setq org-roam-completion-everywhere t)
        (map! :leader
            :prefix "n"
            :desc "org-roam" "l" #'org-roam
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
            :desc "org-roam-find-file" "f" #'org-roam-find-file
            :desc "org-roam-show-graph" "g" #'org-roam-show-graph
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-capture" "c" #'org-roam-capture))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq writeroom-width 1)
(add-hook 'writeroom-mode-hook (lambda ()
                                (display-line-numbers-mode -1)
                                (text-scale-increase 1)
                                ))

(setq-default line-spacing 2)
(setq doom-modeline-height 35)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

(add-hook 'after-init-hook 'global-hl-todo-mode)
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
)

(setq org-startup-with-inline-images t)
(setq org-image-actual-width (/ (display-pixel-width) 3))
(setq org-download-annotate-function (lambda (_link) ""))
(use-package org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "_images")
  (org-download-heading-lvl nil)
  (org-download-screenshot-method "pngpaste %s")
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-clipboard)
         ("s-y" . org-download-yank))))

(after! org
       (setq org-todo-keywords
             '((sequence "TODO" "HOLD" "NOTE" "|" "DONE" "DEAD")
               (sequence "{ }" "{-}" "{?}" "|" "{X}" "{.}"))
             )


       (setq hl-todo-keyword-faces
             '(("TODO" . org-todo)
               ("NOTE" . (:foreground "LightSalmon" :weight "bold"))
               ("HOLD" . org-done)
               ("DEAD" . org-done)))

        ;; (setq org-agenda-prefix-format "%-13.13c %s")
        (setq org-agenda-prefix-format "  ")
        (setq org-agenda-include-diary t)
        (setq org-agenda-span 7)
        (setq org-agenda-start-on-weekday 1)
        (setq org-log-done 'time)
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
