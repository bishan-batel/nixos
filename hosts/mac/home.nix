{ pkgs, config, lib, inputs, ... }: {

  imports = [
    ../../modules/home/terminal/starship.nix
    ../../modules/home/nvim.nix
    ../../modules/home/git.nix
    ../../modules/home/terminal/kitty.nix
    ../../modules/home/terminal/tmux.nix
    ../../modules/home/rice/spicetify.nix
    ../../modules/home/terminal/nu.nix
    ../../modules/home/terminal/filemanage.nix
    inputs.catppuccin.homeModules.catppuccin
    inputs.mac-app-util.homeManagerModules.default
    # (builtins.fetchurl {
    #   url = "https://raw.githubusercontent.com/Atemu/home-manager/e6d905336181ed8f98d48a1f6c9965b77f18e304/modules/targets/darwin.nix";
    #   sha256 = "0lsa8ncwvv5qzar2sa8mxblhg6wcq5y6h9ny7kgmsby4wzaryz67";
    # })
  ];


  programs.home-manager.enable = true;

  home = { 
    username = "bishan_";
    stateVersion = "23.11";
    homeDirectory = "/Users/bishan_";
  };

  home.file."Applications/home-manager".source = let
    apps = pkgs.buildEnv {
      name = "home-manager-applications";
      paths = config.home.packages;
      pathsToLink = "/Applications";
    };
  in "${apps}/Applications";

  home.activation = {
    aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      app_folder=$(echo ~/Applications);
      for app in $(find "$genProfilePath/home-path/Applications" -type l); do
	$DRY_RUN_CMD rm -f $app_folder/$(basename $app)
	$DRY_RUN_CMD osascript -e "tell app \"Finder\"" -e "make new alias file at POSIX file \"$app_folder\" to POSIX file \"$app\"" -e "set name of result to \"$(basename $app)\"" -e "end tell"
      done
    '';
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";

    yazi.enable = true;
    bat.enable = true;
    fzf.enable = true;
    kitty.enable = true;
    starship.enable = true;
    gh-dash.enable = true;
    delta.enable = true;
    # gtk.enable = true;
    # gtk.icon.enable = true;
    zathura.enable = true;
    btop.enable = true;

    mpv.enable = true;
    imv.enable = true;
    nvim.enable = false;
    tmux = {
      enable = true;
      extraConfig =
        /*
        tmux
        */
        ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "basic"

          set -ogq @catppuccin_pane_default_fill "number"
          set -ogq @catppuccin_pane_number_position "left" # right, left

          # Make the status line pretty and add some modules
          set -g status-right-length 100
          set -g status-left-length 100

          # set -g status-left ""
          set -g status-left ""

          set -g status-right "#{E:@catppuccin_status_application}"
          set -agF status-right "#{E:@catppuccin_status_cpu}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
          set -agF status-right "#{E:@catppuccin_status_battery}"
        '';
    };

  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
	monospace = ["JetBrainsMono"];
	sansSerif = ["JetBrainsMono"];
	serif = ["JetBrainsMono"];
      };
    };
  };

  home.packages = with pkgs; [
    # spotify
    nerd-fonts.jetbrains-mono
    nerd-fonts.agave
  ];

  programs.sketchybar = {
    enable = true;
    extraPackages = [
      pkgs.jq
    ];

    config = /* bash */ '' 
	  # This is a demo config to showcase some of the most important commands.
    # It is meant to be changed and configured, as it is intentionally kept sparse.
    # For a (much) more advanced configuration example see my dotfiles:
    # https://github.com/FelixKratz/dotfiles

    PLUGIN_DIR="$CONFIG_DIR/plugins"

    ##### Bar Appearance #####
    # Configuring the general appearance of the bar.
    # These are only some of the options available. For all options see:
    # https://felixkratz.github.io/SketchyBar/config/bar
    # If you are looking for other colors, see the color picker:
    # https://felixkratz.github.io/SketchyBar/config/tricks#color-picker

    sketchybar --bar position=top height=40 blur_radius=30 color=0x40000000

    ##### Changing Defaults #####
    # We now change some default values, which are applied to all further items.
    # For a full list of all available item properties see:
    # https://felixkratz.github.io/SketchyBar/config/items

    default=(
      padding_left=5
      padding_right=5
      icon.font="Hack Nerd Font:Bold:17.0"
      label.font="Hack Nerd Font:Bold:14.0"
      icon.color=0xffffffff
      label.color=0xffffffff
      icon.padding_left=4
      icon.padding_right=4
      label.padding_left=4
      label.padding_right=4
    )
    sketchybar --default "$\{default[@]}"

    ##### Adding Mission Control Space Indicators #####
    # Let's add some mission control spaces:
    # https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item
    # to indicate active and available mission control spaces.

    SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
    for i in "$\{!SPACE_ICONS[@]}"
    do
      sid="$(($i+1))"
      space=(
	space="$sid"
	icon="$\{SPACE_ICONS[i]}"
	icon.padding_left=7
	icon.padding_right=7
	background.color=0x40ffffff
	background.corner_radius=5
	background.height=25
	label.drawing=off
	script="$PLUGIN_DIR/space.sh"
	click_script="yabai -m space --focus $sid"
      )
      sketchybar --add space space."$sid" left --set space."$sid" "$\{space[@]}"
    done

    ##### Adding Left Items #####
    # We add some regular items to the left side of the bar, where
    # only the properties deviating from the current defaults need to be set

    sketchybar --add item chevron left \
	       --set chevron icon= label.drawing=off \
	       --add item front_app left \
	       --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
	       --subscribe front_app front_app_switched

    ##### Adding Right Items #####
    # In the same way as the left items we can add items to the right side.
    # Additional position (e.g. center) are available, see:
    # https://felixkratz.github.io/SketchyBar/config/items#adding-items-to-sketchybar

    # Some items refresh on a fixed cycle, e.g. the clock runs its script once
    # every 10s. Other items respond to events they subscribe to, e.g. the
    # volume.sh script is only executed once an actual change in system audio
    # volume is registered. More info about the event system can be found here:
    # https://felixkratz.github.io/SketchyBar/config/events

    sketchybar --add item clock right \
	       --set clock update_freq=10 icon=  script="$PLUGIN_DIR/clock.sh" \
	       --add item volume right \
	       --set volume script="$PLUGIN_DIR/volume.sh" \
	       --subscribe volume volume_change \
	       --add item battery right \
	       --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
	       --subscribe battery system_woke power_source_change

    ##### Force all scripts to run the first time (never do this in a script) #####
    sketchybar --update
      '';
  };


}
