_: let
  font = "JetBrainsMono Nerd Font Mono";
  fontsize = "12";
  primary_accent = "cba6f7";
  secondary_accent = "89b4fa";
  tertiary_accent = "f5f5f5";
  background = "11111B";
  opacity = ".85";
  cursor = "Catppuccin-Mocha-Dark-Cursors";
in {
  mainBar = {
    position = "top";
    layer = "top";
    height = 35;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "hyprland/window"
      "custom/playerctl#backward"
      "custom/playerctl#play"
      "custom/playerctl#foward"
    ];
    modules-center = [
      "cava#left"
      "hyprland/workspaces"
      "cava#right"
    ];
    modules-right = [
      # "custom/notification"
      # "tray"
      "battery"
      "memory"
      "pulseaudio"
      # "network"
      "clock"
    ];
    clock = {
      format = "󰥔  {:%a, %d %b, %I:%M %p}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "   {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      all-outputs = true;
      disable-scroll = false;
      on-scroll-up = "hyprctl dispatch workspace e-1";
      on-scroll-down = "hyprctl dispatch workspace e+1";
      format = "{icon}";
      on-click = "activate";
      persistent-workspaces = {
        "DP-1" = [1 2 3 4 5 6 7 8];
        "DP-2" = [9 10 11];
        "HDMI-A-1" = [9 10 11];
        "HDMI-A-2" = [9 10 11];
        "eDP-1" = [1 2 3 4 5 6 7 8 9 10];
      };
      icon-size = 30;
      format-icons = {
        "1" = "󱄅";
        "2" = "";
        "3" = "";
        "4" = "󰡁";
        "5" = "";
        "6" = "";
        "7" = "";
        "8" = "";
        "9" = "";
        "10" = "";
        "11" = "";

        # urgent = "";
        # active = "";
        # default = "";
        sort-by-number = true;
      };
    };
    "cava#left" = {
      framerate = 60;
      autosens = 0;
      sensitivity = 5;
      bars = 16;
      lower_cutoff_freq = 50;
      higher_cutoff_freq = 10000;
      method = "pipewire";
      source = "auto";
      stereo = true;
      reverse = false;
      bar_delimiter = 0;
      monstercat = false;
      waves = false;
      input_delay = 2;
      format-icons = [
        "<span foreground='#${primary_accent}'>▁</span>"
        "<span foreground='#${primary_accent}'>▂</span>"
        "<span foreground='#${primary_accent}'>▃</span>"
        "<span foreground='#${primary_accent}'>▄</span>"
        "<span foreground='#${secondary_accent}'>▅</span>"
        "<span foreground='#${secondary_accent}'>▆</span>"
        "<span foreground='#${secondary_accent}'>▇</span>"
        "<span foreground='#${secondary_accent}'>█</span>"
      ];
    };
    "cava#right" = {
      framerate = 60;
      autosens = 0;
      sensitivity = 5;
      bars = 16;
      lower_cutoff_freq = 50;
      higher_cutoff_freq = 10000;
      method = "pipewire";
      source = "auto";
      stereo = true;
      reverse = false;
      bar_delimiter = 0;
      monstercat = false;
      waves = false;
      input_delay = 2;
      format-icons = [
        "<span foreground='#${primary_accent}'>▁</span>"
        "<span foreground='#${primary_accent}'>▂</span>"
        "<span foreground='#${primary_accent}'>▃</span>"
        "<span foreground='#${primary_accent}'>▄</span>"
        "<span foreground='#${secondary_accent}'>▅</span>"
        "<span foreground='#${secondary_accent}'>▆</span>"
        "<span foreground='#${secondary_accent}'>▇</span>"
        "<span foreground='#${secondary_accent}'>█</span>"
      ];
    };
    "custom/playerctl#backward" = {
      format = "󰙣 ";
      on-click = "playerctl previous";
      on-scroll-up = "playerctl volume .05+";
      on-scroll-down = "playerctl volume .05-";
    };
    "custom/playerctl#play" = {
      format = "{icon}";
      return-type = "json";
      exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      on-click = "playerctl play-pause";
      on-scroll-up = "playerctl volume .05+";
      on-scroll-down = "playerctl volume .05-";
      format-icons = {
        Playing = "<span>󰏥 </span>";
        Paused = "<span> </span>";
        Stopped = "<span> </span>";
      };
    };
    "custom/playerctl#foward" = {
      format = "󰙡 ";
      on-click = "playerctl next";
      on-scroll-up = "playerctl volume .05+";
      on-scroll-down = "playerctl volume .05-";
    };
    "custom/playerlabel" = {
      format = "<span>󰎈 {} 󰎈</span>";
      return-type = "json";
      max-length = 40;
      exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      on-click = "";
    };
    battery = {
      states = {
        good = 95;
        warning = 30;
        critical = 15;
      };
      format = "{icon}  {capacity}%";
      format-charging = "  {capacity}%";
      format-plugged = " {capacity}% ";
      format-alt = "{icon} {time}";
      format-icons = ["" "" "" "" ""];
    };

    memory = {
      format = "󰍛 {}%";
      format-alt = "󰍛 {used}/{total} GiB";
      interval = 5;
    };
    cpu = {
      format = "󰻠 {usage}%";
      format-alt = "󰻠 {avg_frequency} GHz";
      interval = 5;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰈀 100% ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 0% ";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰝟";
      format-icons = {
        default = ["󰕿" "󰖀" "󰕾"];
      };
      # on-scroll-up= "bash ~/.scripts/volume up";
      # on-scroll-down= "bash ~/.scripts/volume down";
      scroll-step = 5;
      on-click = "pavucontrol";
    };
    "custom/randwall" = {
      format = "󰏘";
      # on-click= "bash $HOME/.config/hypr/randwall.sh";
      # on-click-right= "bash $HOME/.config/hypr/wall.sh";
    };
    "custom/launcher" = {
      format = "";
      on-click = "rofi -show drun";
      # on-click= "bash $HOME/.config/rofi/launcher.sh";
      # on-click-right= "bash $HOME/.config/rofi/run.sh";
      tooltip = "false";
    };
    "custom/notification" = {
      exec = "~/.config/waybar/scripts/notification.sh";
      on-click = "dunstctl set-paused toggle";
      on-click-right = "wallpaper";
      return-type = "json";
      max-length = 50;
      format = "{}";
    };
  };
}
