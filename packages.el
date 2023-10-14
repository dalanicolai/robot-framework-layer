;;; packages.el --- Robot framework layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: %USER_FULL_NAME% <%USER_MAIL_ADDRESS%>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;;; Code:

(defconst robot-framework-packages
  '((robot-mode :location (recipe
                           :fetcher github
                           :repo "davidshepherd7/robot-mode"))))

(defun robot-framework/init-robot-mode ()
  (use-package robot-mode
    :defer t
    :init  (spacemacs/add-to-hook 'robot-mode-hook
                                  '(spacemacs//robot-framework-setup-lsp
                                    spacemacs//pyvenv-mode-set-local-virtualenv
                                    pyvenv-tracking-mode))))


;;; packages.el ends here
