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
    version = "20190822";
    sha256 = "0scyjs4zav68zgds5avdllp4vldgad5m39xnwjyyr723617aazh4";

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
    version = "20190823";
    sha256 = "0dfcajbvs8bcvsvh3cdkaxmwjk1j263k8h4qvlqm6xhg3fhc3wap";

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
    version = "20190822";
    sha256 = "1afa00hh9hr4j2vq6d8fvjjq2kygkpavnrpxh8llvvd8sh574nw8";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };
  };

  de-pos-ud = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-pos-ud";
    version = "20190821";
    sha256 = "163himdn8l1ds6znf1girx0hbplbc8i9z9lmqdwvxsj9d9338svv";

    wordEmbeds = {
      filename = "de-structgram-20190426-opq.fifu";
      embeds = deWordEmbeds;
    };
  };

  de-topo = stickerModel {
    inherit stdenvNoCC fetchurl makeWrapper sticker;

    modelName = "de-topo";
    version = "20190822";
    sha256 = "0q232q1005aaixd9hqjszs4c6yhi37grbqwwwr0lr29h4q7ys0zh";

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
    version = "20190822";
    sha256 = "175xqbzy5lri9mpb5qvj946785m4rc3q9zbcnnwwga6270ii774c";

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
    version = "20190822";
    sha256 = "0ywa0kmpsh1cmdcl4ya0q67wcjq4m6g2n79a1kjgrqmhydc7d59p";

    wordEmbeds = {
      filename = "nl-structgram-20190623-opq.fifu";
      embeds = nlWordEmbeds;
    };
  };

}
