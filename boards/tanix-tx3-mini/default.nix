let
  tx3MiniFirmware = ./fip;
in {
  device = {
    manufacturer = "Tanix";
    name = "TX3 Mini";
    identifier = "tanix-tx3-mini";
    supportLevel = "best-effort";
  };

  hardware = {
    soc = "amlogic-s905x";
    mmcBootIndex = "1";
  };

  Tow-Boot = {
    defconfig = "tanix_tx3_defconfig";
    patches = [
      ./u-boot.patch
    ];
    builder.additionalArguments = {
      FIPDIR = "${tx3MiniFirmware}";
    };
  };
}
