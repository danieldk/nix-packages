{ stdenvNoCC, fetchurl, makeWrapper, sticker }:

let
  stickerModel = import ./model.nix;
  wordEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/de-structgram-20190426-opq.fifu;
    sha256 = "0b75bpsrfxh173ssa91pql3xmvd7x9f2qwc6rv27jj6pxlhayfql";
  };
  tagEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/de-structgram-tags-20190426.fifu;
    sha256 = "159p71xdkxf5z6pg612imscb6v9plwnf8yn6fxrqlvq8i3wwwx66";
  };
in {
  de-deps = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker tagEmbeds wordEmbeds;

    modelName = "de-deps";
    version = "20190617";
    sha256 = "0h4cw5fd2inzg1va2k6jg21p3fgzg109d91q25gc0wacaiip2qky";
  };

  de-pos = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker wordEmbeds;

    modelName = "de-pos";
    version = "20190615";
    sha256 = "1x060sbmjjbf0mpn6gh9m0ngxk902x3p06yl9q0jq8mzc7hwqpyw";
  };

  de-topo = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker tagEmbeds wordEmbeds;

    modelName = "de-topo";
    version = "20190615";
    sha256 = "082nq2qih0pyrf1dhnvd456cickpj7ghdavp5ss643f75xkjc7zq";
  };
}
