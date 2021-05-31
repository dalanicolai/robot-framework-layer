(require 'lsp)

(defgroup lsp-robot-framework nil
  "Settings for robocorp robot-framework language server.")

(defcustom lsp-robot-language-server-python ""
  "Path to the python executable used to start the Robot
   Framework Language Server (the default is searching python on
   the PATH).\nRequires a restart to take effect."
  :type 'string
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-language-server-args nil
  "Arguments to be passed to the Robot Framework Language
   Server (i.e.: [\"-vv\",
   \"--log-file=~/robotframework_ls.log\"]).\nRequires a restart
   to take effect."
  :type 'lsp-string-vector
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-language-server-tcp-port 0
  "If the port is specified, connect to the language server
   previously started at the given port.\nRequires a restart to
   take effect."
  :type 'number
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-python-executable ""
  "Secondary python executable used to load user code and
   dependent libraries (the default is using the same python used
   for the language server)."
  :type 'string
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-python-env nil
  "Environment variables used to load user code and dependent
   libraries.\n(i.e.: {\"MY_ENV_VAR\": \"some_value\"})"
  :type 'nil
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-variables nil
  "Custom variables passed to RobotFramework (used when resolving
   variables and automatically passed to the launch config as
   --variable entries).\n(i.e.: {\"EXECDIR\":
   \"c:/my/proj/src\"})"
  :type 'nil
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-pythonpath nil
  "Entries to be added to the PYTHONPATH (used when resolving
   resources and imports and automatically passed to the launch
   config as --pythonpath entries).\n(i.e.: [\"c:/my/pro/src\"])"
  :type 'lsp-string-vector
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-lint-robocop-enabled nil
  "Specifies whether to lint with Robocop."
  :type 'boolean
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-completions-section-headers-form "plural"
  "Defines how completions should be shown for section
   headers (i.e.: *** Setting(s) ***).\nOne of: plural, singular,
   both."
  :type '(choice (:tag "plural" "singular" "both"))
  :package-version '(lsp-mode . "7.1.0"))

;; (defcustom lsp-robot-completions-keywords-format ""
;;   "Defines how keyword completions should be applied.\nOne of:
;;    First upper, Title Case, ALL UPPER, all lower."
;;   :type '(choice (:tag "First upper" "Title Case" "ALL UPPER" "all lower"))
;;    :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-workspace-symbols-only-for-open-docs nil
  "Collecting workspace symbols can be resource intensive on big
   projects and may slow down code-completion, in this case, it's
   possible collect info only for open files on big projects."
  :type 'boolean
  :package-version '(lsp-mode . "7.1.0"))

(defcustom lsp-robot-editor-4spaces-tab t
  "Replaces the key stroke of tab with 4 spaces. Set to 'false'
   to active VSCode default."
  :type 'boolean
  :package-version '(lsp-mode . "7.1.0"))

 (lsp-register-custom-settings
  '(("robot.editor.4spacesTab" lsp-robot-editor-4spaces-tab t)
    ("robot.workspaceSymbolsOnlyForOpenDocs" lsp-robot-workspace-symbols-only-for-open-docs t)
    ("robot.completions.keywords.format" lsp-robot-completions-keywords-format)
    ("robot.completions.section_headers.form" lsp-robot-completions-section-headers-form)
    ("robot.lint.robocop.enabled" lsp-robot-lint-robocop-enabled t)
    ("robot.pythonpath" lsp-robot-pythonpath)
    ("robot.variables" lsp-robot-variables)
    ("robot.python.env" lsp-robot-python-env)
    ("robot.python.executable" lsp-robot-python-executable)
    ("robot.language-server.tcp-port" lsp-robot-language-server-tcp-port)
    ("robot.language-server.args" lsp-robot-language-server-args)
    ("robot.language-server.python" lsp-robot-language-server-python)))


(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("/home/floris/.virtualenvs/system-tests/bin/python3.8"
                                                          "-u"
                                                          "/home/floris/.vscode/extensions/robocorp.robotframework-lsp-0.16.0/src/robotframework_ls/__main__.py"
                                                          "-v"))
                  :activation-fn (lsp-activate-on "robot")
                  :server-id 'robocorp))

(define-derived-mode robot-mode prog-mode "Robot")

(add-to-list 'auto-mode-alist '("\\.robot\\'" . robot-mode))

(provide 'lsp-robot-framework)
