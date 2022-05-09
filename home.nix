{ config, pkgs, lib, ... }:

{
  imports = [
    ./shell
    ./vscode
    ./neovim
  ];
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
  home.stateVersion = "22.05";

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "thynkon";
      userEmail = "thynkon@protonmail.com";
    };

    zoxide.enable = true;

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
