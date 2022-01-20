{
  description = "CNix NixOS setup";

  # Specifies other flakes that this flake depends on.
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    home-manager.url = "github:nix-community/home-manager";
    emacs-overlay.url  = "github:nix-community/emacs-overlay";
  };

  # Function that produces an attribute set.
  # Its function arguments are the flakes specified in inputs.
  # The self argument denotes this flake.
  outputs = inputs@{ self, nixpkgs, nixpkgs-wayland, home-manager, ... }: {
    nixosConfigurations = {
      cnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./host/cnix/configuration.nix)

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # home-manager.users = {
            #   cnix = import ./user/cnix.nix;
            # };
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
