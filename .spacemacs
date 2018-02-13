;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     yaml
     windows-scripts
     javascript
     rust
     html
     csv
     ruby
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     (org :variables
          org-enable-github-support t)
     (latex :variables
            latex-enable-auto-fill t
            latex-enable-folding t
            )
     bibtex
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     python
     octave
     go
     extra-langs
     evernote
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t
            )

     ;; vagrant
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; multiple-cursors
                                      ;; smartrep
                                      dracula-theme
                                      seti-theme
                                      solarized-theme
                                      exec-path-from-shell
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         spacemacs-dark
                         spacemacs-dark-disable-background
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Myrica M"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layer
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; ime setting >>
  ;; 入力ソースの設定が必要
  (setq default-input-method "W32-IME")
  ;; 日本語入力時にカーソルの色を変える設定 (色は適宜変えてください)
  ;; (add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "orange")))
  ;; (add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "white")))
  ;; ミニバッファに移動した際は最初に日本語入力が無効な状態にする
  (add-hook 'minibuffer-setup-hook 'deactivate-input-method)

  ;; isearch に移行した際に日本語入力を無効にする
  (add-hook 'isearch-mode-hook '(lambda ()
                                  (deactivate-input-method)
                                  (setq w32-ime-composition-window (minibuffer-window))))
  (add-hook 'isearch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))
  ;; evilのnormal-stateになったらIMEを英語に戻す
  (add-hook 'evil-hybrid-state-entry-hook
            '(lambda () (deactivate-input-method)))
  ;; EmacsをアクティブにしたらIMEを英語に戻す
  (add-hook 'focus-in-hook
            '(lambda () (deactivate-input-method)))
  ;; helm 使用中に日本語入力を無効にする
  (advice-add 'helm :around '(lambda (orig-fun &rest args)
                               (let ((select-window-functions nil)
                                     (w32-ime-composition-window (minibuffer-window)))
                                 (deactivate-input-method)
                                 (apply orig-fun args))))
  ;; >>
  ;; 句読点を一括返還------------------------
  (defun replace-punctuation (a1 a2 b1 b2)
    "Replace periods and commas"
    (let ((s1 (if mark-active "選択領域" "バッファ全体"))
          (s2 (concat a2 b2))
          (b (if mark-active (region-beginning) (point-min)))
          (e (if mark-active (region-end) (point-max))))
      (if (y-or-n-p (concat s1 "の句読点を「" s2 "」にしますがよろしいですか?"))
          (progn
            (replace-string a1 a2 nil b e)
            (replace-string b1 b2 nil b e)))))
  (defun replace-punctuation-ten-maru ()
    "選択領域またはバッファ全体の句読点を「、。」にします"
    (interactive)
    (replace-punctuation "，" "、" "．" "。"))
  (defun replace-punctuation-comma-maru ()
    "選択領域またはバッファ全体の句読点を「，。」にします"
    (interactive)
    (replace-punctuation "、" "，" "．" "。"))
  (defun replace-punctuation-comma-period ()
    "選択領域またはバッファ全体の句読点を「，．」にします"
    (interactive)
    (replace-punctuation "、" "，" "。" "．"))
  (defalias 'replace-punctuation-o 'replace-punctuation-ten-maru)
  (defalias 'replace-punctuation-\, 'replace-punctuation-comma-maru)
  (defalias 'replace-punctuation-. 'replace-punctuation-comma-period)
  (defalias 'tenmaru 'replace-punctuation-ten-maru)
  (defalias 'commamaru 'replace-punctuation-comma-maru)
  (defalias 'commaperiod 'replace-punctuation-comma-period)
  ;; ------------------------
  (global-set-key (kbd "C-;") 'evil-escape)
  (setq markdown-open-command "vmd")
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;; org-mode の設定は以下にラップして書く
  (with-eval-after-load 'org
    ;; here goes your Org config :
    ;; ....
    (setq org-latex-pdf-process '("latexmk %f"))
    (setq org-startup-with-inline-images nil)
    (add-to-list 'org-latex-classes
                 '("T1"
                   "\\documentclass[a4j,11pt]{ujarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{amsmath,amssymb}
                \\usepackage{booktabs}
                \\usepackage{float}
                \\usepackage{textcomp}
                \\usepackage{bm}
                \\usepackage{multicol}
                \\usepackage{multirow}
                \\usepackage{nidanfloat}
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{fancybox,ascmac}
                \\usepackage{setspace}
                \\usepackage{tabularx}
                \\usepackage{titlesec}
                \\usepackage{url}
                \\usepackage{hyperref}
                \\usepackage{longtable}
                \\usepackage{nomencl}
                \\usepackage{fancyhdr}
                \\renewcommand{\\figurename}{Fig}
                \\renewcommand{\\tablename}{Table}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
        (add-to-list 'org-latex-classes
                 '("master-thesis"
                   "\\documentclass[a4j,11pt]{ujbook}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage{amsmath,amssymb}
                \\usepackage{booktabs}
                \\usepackage{float}
                \\usepackage{textcomp}
                \\usepackage{bm}
                \\usepackage{multicol}
                \\usepackage{multirow}
                \\usepackage{nidanfloat}
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{fancybox,ascmac}
                \\usepackage{setspace}
                \\usepackage{tabularx}
                \\usepackage{titlesec}
                \\usepackage{url}
                \\usepackage{hyperref}
                \\usepackage{longtable}
                \\usepackage{nomencl}
		            \\usepackage{cite}
                \\usepackage[dvipdfmx]{graphicx}
                \\renewcommand{\\figurename}{Fig}
                \\renewcommand{\\tablename}{Table}
                \\renewcommand{\\bibname}{参考文献}
                \\usepackage{fancyhdr}
                \\def\\vector#1{\\mbox{\\boldmath $#1$}}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

        (add-to-list 'org-latex-classes
                 '("T2"
                   "\\documentclass[twocolumn,a4j,10.5pt]{ujarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{amsmath,amssymb}
                \\usepackage{booktabs}
                \\usepackage{float}
                \\usepackage{textcomp}
                \\usepackage{bm}
                \\usepackage{multirow}
                \\usepackage{nidanfloat}
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{fancybox,ascmac}
                \\usepackage{setspace}
                \\usepackage{tabularx}
                \\usepackage{titlesec}
                \\usepackage{url}
                \\usepackage{hyperref}
                \\usepackage{longtable}
                \\usepackage{nomencl}
                \\usepackage{fancyhdr}
                \\renewcommand{\\figurename}{Fig}
                \\renewcommand{\\tablename}{Table}
                \\renewcommand{\\abstractname}{Abstract}
                \\def\\vector#1{\\mbox{\\boldmath $#1$}}
                % 書式設定
                %　sectionのスタイル
                \\titleformat*{\\section}{\\bfseries}
                \\titleformat*{\\subsection}{\\bfseries}
                "
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
        (add-to-list 'org-latex-classes
                 '("T2X"
                   "\\documentclass[twocolumn,a4j,10.5pt]{ujarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{amsmath,amssymb}
                \\usepackage{booktabs}
                \\usepackage{float}
                \\usepackage{textcomp}
                \\usepackage{bm}
                \\usepackage{multirow}
                \\usepackage{nidanfloat}
                \\usepackage[dvipdfmx]{graphicx}
                \\usepackage{fancybox,ascmac}
                \\usepackage{setspace}
                \\usepackage{tabularx}
                \\usepackage{titlesec}
                \\usepackage{url}
                \\usepackage{hyperref}
                \\usepackage{longtable}
                \\usepackage{nomencl}
                \\usepackage{fancyhdr}
                \\usepackage[english]{babel}
                \\renewcommand{\\figurename}{Fig}
                \\renewcommand{\\tablename}{Table}
                \\renewcommand{\\abstractname}{Abstract}
                \\def\\vector#1{\\mbox{\\boldmath $#1$}}
                % 書式設定
                %　sectionのスタイル
                \\titleformat*{\\section}{\\bfseries}
                \\titleformat*{\\subsection}{\\bfseries}
                "
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
        (add-to-list 'org-latex-classes
                     '("T0"
                       "\\documentclass[twocolumn,a4j,10.5pt]{ujarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]"))
    )
  (setq org-ref-default-bibliography '("~/Dropbox//bib/library.bib")
        ;; org-ref-pdf-directory "~/Papers/"
        ;; org-ref-bibliography-notes "~/Papers/notes.org"
        )
  (setq japanese-TeX-engine-default 'uptex) ;; upTeX を標準に
  (setq org-html-htmlize-output-type 'nil)
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq-default ispell-program-name "aspell")
  (eval-after-load "ispell"
    '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(evil-want-Y-yank-to-eol nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (insert-shebang fish-mode company-shell yaml-mode powershell ghub let-alist web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern tern coffee-mode org-category-capture solarized-theme seti-theme dracula-theme dash-functional smartrep ox-gfm org-ref pdf-tools key-chord ivy tablist helm-bibtex parsebib disaster company-c-headers cmake-mode clang-format biblio biblio-core toml-mode racer flycheck-rust seq cargo rust-mode powerline spinner hydra parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish bind-map bind-key packed f dash s helm avy helm-core async popup git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl vagrant-tramp vagrant web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data multiple-cursors company-auctex auctex-latexmk auctex csv-mode mozc ddskk cdb ccc geeknote rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby org-projectile org-present org-pomodoro alert log4e gntp org-download mwim htmlize gnuplot flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck auto-dictionary vmd-mode wolfram-mode thrift stan-mode scad-mode qml-mode matlab-mode julia-mode go-guru go-eldoc company-go go-mode arduino-mode yapfify xterm-color smeargle shell-pop pyvenv pytest pyenv-mode py-isort pip-requirements orgit multi-term mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode hy-mode helm-pydoc helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help cython-mode company-statistics company-anaconda company auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
