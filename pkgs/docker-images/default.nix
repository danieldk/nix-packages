{ dockerTools, stickerModels }:

let
  stickerImage = import ./sticker-image.nix;
in {
  sticker = {
    de-deps-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-deps-ud";
      model = stickerModels.de-deps-ud;
    };

    de-ner-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-ner-ud";
      model = stickerModels.de-ner-ud;
    };

    de-pos = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-pos";
      model = stickerModels.de-pos;
    };

    de-pos-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-pos-ud";
      model = stickerModels.de-pos-ud;
    };

    de-topo = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-topo";
      model = stickerModels.de-topo;
    };

    de-deps = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-deps";
      model = stickerModels.de-deps;
    };

    nl-deps-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "nl-deps-ud";
      model = stickerModels.nl-deps-ud;
    };

    nl-pos-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "nl-pos-ud";
      model = stickerModels.nl-pos-ud;
    };
  };
}
