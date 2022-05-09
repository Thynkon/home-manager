{ config, pkgs, lib, ... }:

{
  programs = {
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
      enableSyntaxHighlighting = true;
      defaultKeymap = "vicmd";

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
        EDITOR = "nvim";
      };

      envExtra = ''
        export XDG_CACHE_HOME=${config.xdg.cacheHome}
        export XDG_CONFIG_HOME=${config.xdg.configHome}
        export XDG_DATA_HOME=${config.xdg.dataHome}
        export ANDROID_SDK_ROOT=$HOME/Android/Sdk
        export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
        export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
        export PATH=$XDG_DATA_HOME/npm/bin:$PATH
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
        # bindkey -v '^?' backward-delete-char
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
          "colored-man-pages"
          "command-not-found"
          "docker-compose"
          "fd"
          "fzf"
          "laravel"
          "mvn"
          "rails"
          "rust"
        ];
      };
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
          "$jobs"
          "$line_break"
          "$character"
        ];

        right_format = lib.concatStrings [
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
          "$time"
          "$status"
        ];

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
