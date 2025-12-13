{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
    imports = [
      inputs.noctalia.homeModules.default
    ];
    
    programs.noctalia-shell.systemd.enable = true;

    programs.noctalia-shell = {
      enable = true;
      settings = {
        bar = {
          density = "compact";
	  position = "right";
	  showCapsule = false;
	  widgets = {
            left = [
              {
	        id = "ControlCenter";
		useDistroLogo = true;
	      }
	      {
                id = "WiFi";
	      }
	      {
                id = "Bluetooth";
	      }
	    ];
	    center = [
              {
                hideUnoccupied = false;
		id = "Workspace";
		labelMode = "none";
	      }
	    ];
	    right = [
              {
	        alwaysShowPercentage = false;
		id = "Battery";
		warningThreshold = 30;
	      }
	      {
	        formatHorizontal = "HH:mm";
		formatVertical = "HH mm";
		id = "Clock";
		useMonospacedFont = true;
		usePrimaryColor = true;
	      }
	    ];
	  };
	};
	colorSchemes.predefinedScheme = "Monochrome";
	general = {
	  avatarImage = "/home/ganyaowl/.face";
	  radiusRatio = 0.2;
	};
	location = {
	  monthBeforeDay = true;
	  name = "Tashkent, Uzbekistan";
	};
      };
    };
    
    home.file.".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "/home/ganyaowl/Pictures/wallpaper.png";
      };
    };
}
