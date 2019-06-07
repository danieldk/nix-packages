{ stdenvNoCC, fetchurl, makeWrapper, sticker }:

let
  stickerModel = import ./model.nix;
  wordEmbeds = fetchurl {
    url = http://www.sfs.uni-tuebingen.de/a3-public-data/sticker-models/de-structgram-20190426.fifu;
    sha256 = "12gl1spxvgk25m03jvpyz9af4w1zrxq360bgszk9qczlp4rvxhmk";
  };
  tagEmbeds = fetchurl {
    url = http://www.sfs.uni-tuebingen.de/a3-public-data/sticker-models/de-structgram-tags-20190426.fifu;
    sha256 = "159p71xdkxf5z6pg612imscb6v9plwnf8yn6fxrqlvq8i3wwwx66";
  };
in {
  de-deps = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker tagEmbeds wordEmbeds;

    modelName = "de-deps";
    version = "20190426";
    sha256 = "1y8p37pi2j3pqbg552gfjikm4j9lmy5nziw399ldpa7snbqgb359";
  };

  de-pos = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker wordEmbeds;

    modelName = "de-pos";
    version = "20190426";
    sha256 = "0rdq2s1x6h5whlscvw2d1lkgldm6aflpvmm0qh4zwinxinnxva5h";
  };

  de-topo = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker tagEmbeds wordEmbeds;

    modelName = "de-topo";
    version = "20190426";
    sha256 = "07prfzwb1n137dc27hsa4w55156rj65kz589lpnqjv7dcbig11zs";
  };
}
