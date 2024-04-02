# This is a simple boilerplate NixOS configuration file

{ config, pkgs, ... }:

{
  # Set your system's host name
  networking.hostName = "my-nixos-machine";

  # Define your time zone
  time.timeZone = "Europe/Paris";

  # List users
  users.extraUsers.john = {
    name = "john";
    uid = 1000;
    group = "users";
    home = "/home/john";
    description = "John Doe";
    shell = pkgs.bashInteractive;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7J3Ia/M0NzMHsE0YhVBRUcn4JL4Mr1Ct9RhJmr82ah9MNYXV1UfYH3Bs9rPb4ZL9ZbJCyR2ItaB25Z4c88G02t1kA5YLc2/QK/kZzVnx7Ml/0gI3p1syL6CI1thKiUZ9RgAB1K4+/H0Sg1R7I9FRxvhpkcJ3wTF7mb+bFXkGJ1Uy1YgBsBbUSnIAk9fHniv8Y+M8yIyxHh9GhGXNRHLxD9yLl//cvS4Aa5WuQHsBZ/22gPQLQigNlEvGxuUEgSw7vDv8Be8VzVrHHInwYX//jjD2mMnXPSj5jrujR6UB3ZD86pmHk1mGR5S/xp5p0HnFMyqqAIUVvW0lHVADmlI9K3I7fZvLZ6b95bnsF4njHNINtHg9I5lR3B4Sz0GgPyB5L2qZ1H78w5ml94NjJiBbkx2mXQF5T3QQ1KKb6RkNGVov0v4vqO9EGjuEkcBOSZJ3g5H+PprD80FQCCcT2ETk6iUNe+2BBjycayZsWuUZcOdIfAlbFgLpu8UmkX5XgJCG9GFfoYqmPU6RWT2K6bsN1Xq88Q5AFdI/NPPKemC7o4cCl5WJk4T2EBMUpD1BVxR3Y9JHypNkt3DDuxmyyFKj0ifgYWanD3R+jECXtxbCdj3ywbxob3D9rW9jYXxThgI1Q== john@example.com"
    ];
  };

  # Enable networking
  networking.enable = true;

  # List packages you want installed
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    curl
    ];

  # Configure services
  services = {
    openssh.enable = true;
    postgresql.enable = true;
    nginx = {
      enable = true;
      virtualHosts."example.com" = {
        locations."/" = {
          proxyPass = "http://localhost:8080";
          proxyWebsockets = true;
        };
      };
    };
  };
}
