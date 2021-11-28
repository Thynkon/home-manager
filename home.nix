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
    };
}
