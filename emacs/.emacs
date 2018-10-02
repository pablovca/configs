(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-enabled-themes (quote (gruvbox-dark-soft)))
 '(custom-safe-themes
   (quote
    ("e08cf6a643018ccf990a099bcf82903d64f02e64798d13a1859e79e47c45616e" "617341f1be9e584692e4f01821716a0b6326baaec1749e15d88f6cc11c288ec6" "8a9be13b2353a51d61cffed5123b157000da0347c252a7a308ebc43e16662de7" "06239857eba54280977d62190690bef6d58f9653465c71b0fe279c560fdcac80" "09844be0970623174299a99f0addcddfb91334a4231f6ad86c82eb0f2c4e78af" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages (quote (helm dracula-theme haskell-mode gruvbox-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Theme
(load-theme 'gruvbox-dark-soft t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(set-default-font "Inconsolata 18")
(setq dired-listing-switches "-l --group-directories-first")

(require 'helm-config)
(helm-mode 1)
