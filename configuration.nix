# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:



{
  imports =
    [ 
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bowyn = {
    isNormalUser = true;
    description = "bowyn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


#,------.                ,--.     ,--.                 
#|  .-.  \  ,---.  ,---. |  |,-.,-'  '-. ,---.  ,---.  
#|  |  \  :| .-. :(  .-' |     /'-.  .-'| .-. || .-. | 
#|  '--'  /\   --..-'  `)|  \  \  |  |  ' '-' '| '-' ' 
#`-------'  `----'`----' `--'`--' `--'   `---' |  |-'  
#                                             `--'    

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  
#,------.               ,--.                                 
#|  .--. ' ,--,--. ,---.|  |,-. ,--,--. ,---.  ,---.  ,---.  
#|  '--' |' ,-.  || .--'|     /' ,-.  || .-. || .-. :(  .-'  
#|  | --' \ '-'  |\ `--.|  \  \\ '-'  |' '-' '\   --..-'  `) 
#`--'      `--`--' `---'`--'`--'`--`--'.`-  /  `----'`----'  
#                                     `---'          
  
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    git
    kitty
    vscode
    waybar
    rofi
    nerdfonts

    # audio
    pipewire
    pamixer
    # network
    networkmanager
    networkmanagerapplet
    # bluetooth
    bluez
    blueman
    brightnessctl
    
    # qt support
    

    dunst
    wlogout
    swww

    # screenshot
    grimblast
    slurp
    swappy
    cliphist

    # dependencies
    polkit-kde-agent
    xdg-desktop-portal-hyprland
    parallel
    jq
    imagemagick
    ffmpegthumbs
    kde-cli-tools

    # theme stuff
    nwg-look
    qt5ct
    qt6ct
    


  ];


  fonts.fonts = with pkgs; [
    nerdfonts
  ];




#,---.                          ,--.                     
#'   .-'  ,---. ,--.--.,--.  ,--.`--' ,---. ,---.  ,---.  
#`.  `-. | .-. :|  .--' \  `'  / ,--.| .--'| .-. :(  .-'  
#.-'    |\   --.|  |     \    /  |  |\ `--.\   --..-'  `) 
#`-----'  `----'`--'      `--'   `--' `---' `----'`----'  
                                                         
  services.openssh.enable = true;
  services.vscode-server.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];




  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  # Enable networking
  networking.networkmanager.enable = true;
  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
