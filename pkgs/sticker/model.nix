{ stdenvNoCC, fetchurl, makeWrapper, sticker, tagEmbeds ? null, wordEmbeds, modelName, sha256, version }:

rec {
  model = stdenvNoCC.mkDerivation rec {
    inherit version;

    pname = "sticker-model-${modelName}";

    src = fetchurl {
      inherit sha256;

      url = "https://blob.danieldk.eu/sticker-models/${modelName}-${version}.tar.gz";
    };

    preConfigure = ''
      substituteInPlace sticker.conf \
        --replace "${wordEmbeds.filename}" \
      "${wordEmbeds.embeds}"
    '' + stdenvNoCC.lib.optionalString (tagEmbeds != null) ''
      substituteInPlace sticker.conf \
        --replace "${tagEmbeds.filename}" \
      "${tagEmbeds.embeds}"
    '';

    installPhase = ''
      mkdir -p $out/share/sticker/models/${modelName}
      install -m 0644 *.conf *.graph *.labels *.shapes epoch-* $out/share/sticker/models/${modelName}
    '';

    meta = with stdenvNoCC.lib; {
      homepage = https://github.com/danieldk/sticker/;
      description = "Sticker ${modelName} model";
      license = licenses.unfreeRedistributable;
      platforms = platforms.unix;
      maintainers = with maintainers; [ danieldk ];
    };
  };

  wrapper = stdenvNoCC.mkDerivation rec {
    inherit version;

    pname = "sticker-${modelName}";

    nativeBuildInputs = [ makeWrapper ];

    unpackPhase = "true";

    installPhase = ''
      makeWrapper ${sticker}/bin/sticker-tag $out/bin/sticker-tag-${modelName} \
        --add-flags "${model}/share/sticker/models/${modelName}/sticker.conf"
      makeWrapper ${sticker}/bin/sticker-server $out/bin/sticker-server-${modelName} \
        --add-flags "${model}/share/sticker/models/${modelName}/sticker.conf"
    '';

    meta = with stdenvNoCC.lib; {
      homepage = https://github.com/danieldk/sticker/;
      description = "Sticker ${modelName} model wrapper";
      license = licenses.unfreeRedistributable;
      platforms = platforms.unix;
      maintainers = with maintainers; [ danieldk ];
    };
  };

}
