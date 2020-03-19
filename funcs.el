(defun spacemacs//robot-framework-setup-lsp ()
  "Setup lsp backend."
  (if (configuration-layer/layer-used-p 'lsp)
        (lsp))
    (message "`lsp' layer is not installed, please add `lsp' layer to your dotfile."))
