let
  source = import ./tow-boot.nix;

  towBoot = source.towBoot;
  pkgs = source.pkgs;

  evalFor = device:
    import "${towBoot}/support/nix/eval-with-configuration.nix" {
      inherit device;
      inherit pkgs;
      verbose = true;
      configuration = {
        imports = [
          {
            system.automaticCross = true;
          }
        ];
      };
    };
in {
  friendlyElec-nanoPiR4S-SPI = evalFor ./boards/friendlyElec-nanoPiR4S-SPI;
  tanix-tx3-mini = evalFor ./boards/tanix-tx3-mini;
}
