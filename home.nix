{ config, pkgs, lib, ... }:

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
    home.username = "thynkon";
    home.homeDirectory = "/home/thynkon";

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
    home.stateVersion = "21.11";

    programs = {
        # Let Home Manager install and manage itself.
        home-manager.enable = true;

        git = {
            enable = true;
            userName = "thynkon";
            userEmail = "thynkon@protonmail.com";
        };

        zsh = {
            enable = true;
            # If a command is issued that can't be executed as a normal command, and the
            # command is the name of a directory, perform the cd command to that directory.
            # This option is only applicable if the option SHIN_STDIN is set, i.e. if
            # commands are being read from standard input. The option is designed for
            # interactive use; it is recommended that cd be used explicitly in scripts to
            # avoid ambiguity.
            autocd = true;
            dotDir = ".config/zsh";
            enableCompletion = true;
            enableAutosuggestions = true;

            shellAliases = {
                ll = "ls -l";
                update = "sudo nixos-rebuild switch";
            };
            history = {
                size = 10000;
                path = "${config.xdg.dataHome}/zsh/history";
            };

            sessionVariables = {
                ZSH_PLUGINS_ALIAS_TIPS_TEXT = "Alias tip: ";
                # If KEYTIMEOUT is lesser than 20ms the
                # keybing above wont work
                KEYTIMEOUT = 20;
            };

            envExtra = ''
                export XDG_CACHE_HOME=${config.xdg.cacheHome}
                export XDG_CONFIG_HOME=${config.xdg.configHome}
                export XDG_DATA_HOME=${config.xdg.dataHome}
            '';


            initExtra = ''
                # Map "jk" to "esc"
                bindkey 'jk' vi-cmd-mode

                # enable zsh's completion menu
                zmodload zsh/complist

                # Use vim keys in tab complete menu:
                bindkey -M menuselect 'j' vi-backward-char
                bindkey -M menuselect 'l' vi-up-line-or-history
                bindkey -M menuselect 'é' vi-forward-char
                bindkey -M menuselect 'k' vi-down-line-or-history
                bindkey -v '^?' backward-delete-char

                eval "$(zoxide init zsh)"
                eval "$(starship init zsh)"
            '';

            zplug = {
                enable = true;
                plugins = [
                    { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
                    { name = "djui/alias-tips"; }
                    { name = "spwhitt/nix-zsh-completions"; }
                ];
            };
            oh-my-zsh = {
                enable = true;

                plugins = [
                    "adb"
                    "cargo"
                    "colored-man-pages"
                    "command-not-found"
                    "docker-compose"
                    "fd"
                    "fzf"
                    "laravel"
                    "mvn"
                    "rust"
                    "rustup"
                ];
            };

            prezto = {
                enable = true;
                editor = {
                    dotExpansion = true;
                    keymap = "vi";
                };
                pmodules = [
                    "environment"
                    "terminal"
                    "editor"
                    "history"
                    "directory"
                    "spectrum"
                    "utility"
                    "completion"
                    "prompt"
                    "history-substring-search"
                    "autosuggestions"
                    "syntax-highlighting"
                    "git"
                ];
            };
        };

        fzf = {
            enable = true;
            enableZshIntegration = true;
        };

        starship = {
            enable = true;
            settings = {
                # Inserts a blank line between shell prompts
                add_newline = true;

                # Which is equivalent to
                format = lib.concatStrings [
                    "$username"
                    "$hostname"
                    "$shlvl"
                    "$directory"
                    "$vcsh"
                    "$git_branch"
                    "$git_commit"
                    "$git_state"
                    "$git_status"
                    "$hg_branch"
                    "$shell"
                    "$docker_context"
                    "$package"
                    "$cmake"
                    "$deno"
                    "$golang"
                    "$java"
                    "$kotlin"
                    "$nodejs"
                    "$perl"
                    "$php"
                    "$python"
                    "$nix_shell"
                    "$ruby"
                    "$rust"
                    "$vagrant"
                    "$memory_usage"
                    "$env_var"
                    "$custom"
                    "$cmd_duration"
                    "$lua"
                    "$jobs"
                    "$time"
                    "$status"
                    "$line_break"
                    "$character"
                ];

#                right_format = lib.concatStrings [
#                   "$docker_context"
#                   "$package"
#                   "$cmake"
#                   "$deno"
#                   "$golang"
#                   "$java"
#                   "$kotlin"
#                   "$nodejs"
#                   "$perl"
#                   "$php"
#                   "$python"
#                   "$nix_shell"
#                   "$ruby"
#                   "$rust"
#                   "$vagrant"
#                   "$memory_usage"
#                   "$env_var"
#                   "$custom"
#                   "$cmd_duration"
#                   "$lua"
#                   "$jobs"
#                   "$time"
#                   "$status"
#                ];

                character = {
                    success_symbol = "[❯](bold green) ";
                    error_symbol = "[❯](bold red) ";
                    vicmd_symbol = "[❮](bold green) ";
                };


                nix_shell = {
                    disabled = true;
                    impure_msg = "[impure shell](bold red)";
                    pure_msg = "[pure shell](bold green)";
                    format = "via [☃️ $state( \($name\))](bold blue) ";
                };

                directory = {
                    truncate_to_repo = false;
                };


                git_status = {
                    conflicted = "=";
                    ahead = "⇡\${count}";
                    behind = "\${count}⇣";
                    diverged = "\${count}⇕";
                    untracked = "\${count}?";
                    stashed = "\${count}$";
                    modified = "\${count}!";
                    staged = "\${count}+";
                    renamed = "\${count}»";
                    deleted = "\${count}✘";

                };

                rust = {
                    format = "via [$symbol ($version )]($style)";
                    symbol = "";
                };
            };
        };

        vscode = {
          enable = true;
          package = pkgs.vscodium;    # You can skip this if you want to use the unfree version
            userSettings = {
                "workbench.startupEditor"= "newUntitledFile";
                "telemetry.telemetryLevel" = "off";
                "workbench.colorTheme" = "GitHub Dark Dimmed";
                "window.zoomLevel" = 1;
                "workbench.iconTheme" = "Monokai Pro (Filter Spectrum) Icons";
                "editor.suggestSelection" = "first";
                "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";
                "files.autoSave" = "afterDelay";
                "php.validate.enable" = true;
                "php.validate.executablePath" = "/run/current-system/sw/bin/php";
                "editor.fontFamily" = "FantasqueSansMono Nerd Font Mono";
                "editor.fontLigatures" = true;
                "security.workspace.trust.untrustedFiles" = "open";
                "vscode-neovim.neovimExecutablePaths.linux" = "/etc/profiles/per-user/thynkon/bin/nvim";
                "emmet.triggerExpansionOnTab" = true;
                "blade.format.enable" = true;
            };
          extensions = (with pkgs.vscode-extensions; [
                github.github-vscode-theme
                ms-python.python
                asvetliakov.vscode-neovim
            ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                # laravel
                {
                    name = "laravel-blade";
                    publisher = "onecentlin";
                    version = "1.28.0";
                    sha256 = "5c9430873c3da58a8ac18fa571307c57dd8d7512f3d3ce9e0cc45eb0d1ab23d1";
                }
                {
                    name = "laravel-extra-intellisense";
                    publisher = "amiralizadeh9480";
                    version = "0.6.1";
                    sha256 = "44de3b11944360129350093340808a2dd51f13b762c440f3e26197ca5134c641";
                }
                {
                    name = "dotenv";
                    publisher = "mikestead";
                    version = "1.0.1";
                    sha256 = "762782ccd3887198931aee0cbf9cd8946ee32e1684b09474e6a6f3cf343b4567";
                }
                {
                    name = "laravel5-snippets";
                    publisher = "onecentlin";
                    version = "1.13.0";
                    sha256 = "97c073186b4ad9db3561d00430af96a7b207e0b10cd2a506b39b8a7d90c44ecf";
                }
                {
                    name = "laravel-artisan";
                    publisher = "ryannaddy";
                    version = "0.0.28";
                    sha256 = "87266a261235aeed3ac2c3c28d5d52c8553d71db751a9e0077f8e7595bb762df";
                }
                {
                    name = "laravel-goto-controller";
                    publisher = "stef-k";
                    version = "0.0.15";
                    sha256 = "2c9bdfbf7e546c5eacd0a56dbb603030eb78511ce84dc50d4102b56ffb53c14d";
                }
                {
                    name = "laravel-goto-view";
                    publisher = "codingyu";
                    version = "1.3.4";
                    sha256 = "ecb74342f66441a103a4dc9a6a83aaa49065ef9c246582f2adb86ada1bc90a5f";
                }

                # PHP
                {
                    name = "vscode-intelephense-client";
                    publisher = "bmewburn";
                    version = "1.7.1";
                    sha256 = "e4961a0361eac5b2684734ccb27cd8dda438ec8a00be25fcf048e22f4e398a02";
                }
                {
                    name = "php-debug";
                    publisher = "felixfbecker";
                    version = "1.22.0";
                    sha256 = "9a908ea87d0fa0c3eae615253f81031bf5f0863d65b471c7ddde5b0d0c99f783";
                }
                {
                    name = "php-cs-fixer";
                    publisher = "junstyle";
                    version = "0.2.8";
                    sha256 = "6a8340fe5718c3f4f4d29c3ab7adaa8d4c5fddbdc86a20206b30f7edde42d1b0";
                }
                {
                    name = "php-add-property";
                    publisher = "kotfire";
                    version = "1.1.0";
                    sha256 = "fdf2ec0c204dbd4862c745c180d7704787a1ccd3f28232d5f8f0cb2b05a8688c";
                }
                {
                    name = "php-constructor";
                    publisher = "MehediDracula";
                    version = "0.1.2";
                    sha256 = "7e39f21280ec54bca553f3ef9a01d3fc4fdea18f874b4c8737f2895e274679ff";
                }
                {
                    name = "php-namespace-resolver";
                    publisher = "MehediDracula";
                    version = "1.1.8";
                    sha256 = "95bc07b2d28bd5c46c04a85e32124b24010bd9ccb05c34a5aa1adef37352fdc8";
                }
                {
                    name = "php-docblocker";
                    publisher = "neilbrayfield";
                    version = "2.6.1";
                    sha256 = "e36c9c9048419169d9c0749699d1c0a2bc14445cb97cb0b5732e05fd9260f373";
                }
                {
                    name = "phpunit-snippets";
                    publisher = "onecentlin";
                    version = "1.1.0";
                    sha256 = "38a98eb99e76c2f6e6cb4736ac8d9ad5b10e8cf357f5af99fef65e7b1b2541e4";
                }
                {
                    name = "test-adapter-converter";
                    publisher = "ms-vscode";
                    version = "0.1.4";
                    sha256 = "16af502b733b3aed2350ac5e281ababc4b3ecd05bc8798212066ba69ca216009";
                }
                {
                    name = "vscode-test-explorer";
                    publisher = "hbenl";
                    version = "2.21.1";
                    sha256 = "7c7c9e3ddf1f60fb7bccf1c11a256677c7d1c7e20cdff712042ca223f0b45408";
                }
                {
                    name = "vscode-phpunit";
                    publisher = "recca0120";
                    version = "2.0.76";
                    sha256 = "5c51f52fe339f1cf098d3986b7bd72c871639dae44cd459a1224ca091f10c575";
                }
                # python
                # ruby
                {
                    name = "Ruby";
                    publisher = "rebornix";
                    version = "0.28.1";
                    sha256 = "1c051dbfed93fa7789e5a086890dfba423bac7aaf9ec72149cb9b86a983d2f9d";
                }
                {
                    name = "vscode-ruby";
                    publisher = "wingrunr21";
                    version = "0.28.0";
                    sha256 = "1f77f5f9cdf5c7e9600b38604dbd2e2e0f41767de96722463cfc1fa4262b4bbd";
                }
#                {
#                    name = "codota";
#                    publisher = "tabnine-vscode";
#                    version = "3.5.1";
#                    sha256 = "ccfd7acd7fd54f7b569af9496478c28cee364748dd2d3054b53d1db2b44f941a";
#                }
          ];
        };
    };
}
