{ config, pkgs, lib, ... }:

{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium; # You can skip this if you want to use the unfree version
      userSettings = {
        "workbench.startupEditor" = "newUntitledFile";
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
        "vscode-neovim.neovimExecutablePaths.linux" = "${config.home.homeDirectory}/.nix-profile/bin/nvim";
        "emmet.triggerExpansionOnTab" = true;
        "blade.format.enable" = true;
        "remote.SSH.configFile" = "/home/thynkon/vm/ssh_config";
        "rubyTestExplorer.logpanel" = true;
        "rubyTestExplorer.testFramework" = "rspec";
      };
      extensions = (with pkgs.vscode-extensions; [
        github.github-vscode-theme
        ms-python.python
        # ms-vscode-remote.remote-ssh
        asvetliakov.vscode-neovim
        mikestead.dotenv
        tabnine.tabnine-vscode
        # js
        dbaeumer.vscode-eslint
        christian-kohler.path-intellisense
        wix.vscode-import-cost
        bradlc.vscode-tailwindcss
        # nix
        bbenoist.nix
        jnoortheen.nix-ide
        arrterian.nix-env-selector
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
          name = "PHP-Namespace-Resolver";
          publisher = "MehediDracula";
          version = "1.1.8";
          sha256 = "95bc07b2d28bd5c46c04a85e32124b24010bd9ccb05c34a5aa1adef37352fdc8";
        }
        # {
        #   name = "php-debug";
        #   publisher = "felixfbecker";
        #   version = "1.22.0";
        #   sha256 = "9a908ea87d0fa0c3eae615253f81031bf5f0863d65b471c7ddde5b0d0c99f783";
        # }
        # {
        #   name = "php-cs-fixer";
        #   publisher = "junstyle";
        #   version = "0.2.8";
        #   sha256 = "6a8340fe5718c3f4f4d29c3ab7adaa8d4c5fddbdc86a20206b30f7edde42d1b0";
        # }
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
        {
          name = "solargraph";
          publisher = "castwide";
          version = "0.23.0";
          sha256 = "d6a418ed6313c44b1fddf411a15fa1d5e14505f183454eb090221c13b0e76a47";
        }
        {
          name = "vscode-ruby-test-adapter";
          publisher = "connorshea";
          version = "0.9.0";
          sha256 = "fce59369b6ebe541e83d7d310e07341e11d741456e105db7816733985f3a892e";
        }
        {
          name = "erb-helpers";
          publisher = "rayhanw";
          version = "0.5.0";
          sha256 = "d8fc528023a0451178ad843deb1ca143493c4145c12ce089ce1e7590e303117c";
        }
        {
          name = "rails-snippets";
          publisher = "hridoy";
          version = "1.0.8";
          sha256 = "39287f061071b38571e6cf2d4d194422593db1746fa632ea67a06a8c62e07a60";
        }
        {
          name = "ruby-rubocop";
          publisher = "misogi";
          version = "0.8.6";
          sha256 = "ea1809cce7ab1820977290039c849aedec109d158b027ea4e8ae242c9474f542";
        }
        {
          name = "vscode-ruby-test-adapter";
          publisher = "connorshea";
          version = "0.9.0";
          sha256 = "fce59369b6ebe541e83d7d310e07341e11d741456e105db7816733985f3a892e";
        }
        {
          name = "erb";
          publisher = "CraigMaslowski";
          version = "0.0.1";
          sha256 = "8d0f4b47c1b72a505129fc5dc25d8fd5122d82298517537e65ab9cba79c44b9d";
        }
        {
          name = "vscode-erb-beautify";
          publisher = "aliariff";
          version = "0.3.5";
          sha256 = "900752f921497c5cdbff6526a5dd43625224e631fd668370a550546e937a77f3";
        }
        {
          name = "erb-vscode-snippets";
          publisher = "ZneuRay";
          version = "0.0.4";
          sha256 = "099d14a6dfb7c479514d5bb1a34dc95677f4f92bb945de1ee877e8212270fc1a";
        }
        # js
        {
          name = "vscode-jest";
          publisher = "Orta";
          version = "4.3.1";
          sha256 = "20206cffc74ed46ea97287e0b45740306287aa7f5ee79abbb0fdc4e05e140e0b";
        }
        {
          name = "JavaScriptSnippets";
          publisher = "xabikos";
          version = "1.8.0";
          sha256 = "86de969b55fbce27a7f9f8ccbfceb8a8ff8ecf833a5fa7f64578eb4e1511afa7";
        }
        {
          name = "vscode-react-native";
          publisher = "msjsdiag";
          version = "1.9.2";
          sha256 = "17a13b7f1f4547ab2d7297b81dc6ba864855ec552c4e2fe6a332918462fe4a06";
        }
        {
          name = "vscode-typescript-next";
          publisher = "ms-vscode";
          version = "4.7.20220408";
          sha256 = "69c33d63bbf6f42a461a5c1fefc8e3301503bf9428dc96ba66517557a92cac2e";
        }
        {
          name = "es7-react-js-snippets";
          publisher = "dsznajder";
          version = "4.4.3";
          sha256 = "405f79d0986f5486ad840ca0bdadf0c143b304b8c19bb1c4dd281ca7b7f6d0f7";
        }
        {
          name = "aws-toolkit-vscode";
          publisher = "amazonwebservices";
          version = "1.37.0";
          sha256 = "886051764db7ce625adebca0a8e7ac704e5b8413394fc8e232e85b8a53d73c79";
        }
      ];
    };
  };
}
