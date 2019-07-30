{ stdenvNoCC, fetchurl, makeWrapper, sticker }:

let
  stickerModel = import ./model.nix;
  deWordEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/de-structgram-20190426-opq.fifu;
    sha256 = "0b75bpsrfxh173ssa91pql3xmvd7x9f2qwc6rv27jj6pxlhayfql";
  };
  deTagEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/de-structgram-tags-20190426.fifu;
    sha256 = "159p71xdkxf5z6pg612imscb6v9plwnf8yn6fxrqlvq8i3wwwx66";
  };
  deUdTagEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/de-structgram-tags-ud-20190629.fifu;
    sha256 = "1dglh4y04v9nagxa7rjlh4381652gmv53v64asin09x69wa3hi2j";
  };
  nlWordEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/nl-structgram-20190623-opq.fifu;
    sha256 = "1byvg8ach98y7jmikjkcqghxzby8nq2bqxcs8c137h0w8dm7nzbx";
  };
  nlTagEmbeds = fetchurl {
    url = https://blob.danieldk.eu/sticker-models/nl-structgram-tags-20190623.fifu;
    sha256 = "0ijjzl92wsa5p32207w6p2saxshrwby4c6s7fhz9jx9jlicq23w2";
  };
in {
  de-deps = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-deps";
    version = "20190617";
    sha256 = "0h4cw5fd2inzg1va2k6jg21p3fgzg109d91q25gc0wacaiip2qky";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };

    tagEmbeds = {
      filename = "de-structgram-tags-20190426.fifu";
      embeds = deTagEmbeds;
    };
  };

  de-deps-ud = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-deps-ud";
    version = "20190705";
    sha256 = "1v1jyg27zvrby9dbxslis26r3pgl8pxd22p2lq8cjl40807gbyq0";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };

    tagEmbeds = {
      filename = "de-structgram-tags-ud-20190629.fifu";
      embeds = deUdTagEmbeds;
    };
  };

  de-pos = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-pos";
    version = "20190615";
    sha256 = "1x060sbmjjbf0mpn6gh9m0ngxk902x3p06yl9q0jq8mzc7hwqpyw";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };
  };

  de-pos-ud = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-pos-ud";
    version = "20190705";
    sha256 = "19kdl0rg2b2i0k7xdchfickc7z0pxcnqzr7xm2x2l2yv9wn7r4ac";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };
  };

  de-topo = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-topo";
    version = "20190615";
    sha256 = "082nq2qih0pyrf1dhnvd456cickpj7ghdavp5ss643f75xkjc7zq";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };

    tagEmbeds = {
      filename = "de-structgram-tags-20190426.fifu";
      embeds = deTagEmbeds;
    };
  };

  nl-deps-ud = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "nl-deps-ud";
    version = "20190628";
    sha256 = "17vzwzyvh9hp3a55h824f4cxm4r9vg48jhahjd1xfwnhynhgmihn";

    wordEmbeds = {
      filename = "nl-structgram-20190623-opq.fifu";
      embeds = nlWordEmbeds;
    };

    tagEmbeds = {
      filename = "nl-structgram-tags-20190623.fifu";
      embeds = nlTagEmbeds;
    };
  };

  nl-pos-ud = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "nl-pos-ud";
    version = "20190623";
    sha256 = "0aabx884wki4zkdhmnizj6fc0fgkpbgx73brica3ds4kf09708dl";

    wordEmbeds = {
      filename = "nl-structgram-20190623-opq.fifu";
      embeds = nlWordEmbeds;
    };
  };

}
