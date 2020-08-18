(desktop-save-mode 1)
(add-to-list 'load-path "C:\\Users\\alvar\\AppData\\Roaming\\emacs-load-path")

(require 'package)
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (minsk)))
 '(custom-safe-themes
   (quote
    ("ca2e59377dc1ecee2a1069ec7126b453fa1198fed946304abb9a5b8c7ad5404d" default)))
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (emojify emmet-mode format-all prettier-js neotree go-complete auto-complete minsk-theme)))
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-complete)

(add-hook 'completion-at-point-functions 'go-complete-at-point)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'after-init-hook #'global-emojify-mode)

(ac-config-default)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(put 'upcase-region 'disabled nil)

