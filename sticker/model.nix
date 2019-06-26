{ stdenvNoCC, fetchurl, makeWrapper, sticker, tagEmbeds ? null, wordEmbeds, modelName, sha256, version }:

stdenvNoCC.mkDerivation rec {
  inherit version;

  pname = "sticker-${modelName}";

  src = fetchurl {
    inherit sha256;

    url = "https://blob.danieldk.eu/sticker-models/${modelName}-${version}.tar.gz";
  };

  nativeBuildInputs = [ makeWrapper ];

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

    makeWrapper ${sticker}/bin/sticker-tag $out/bin/sticker-tag-${modelName} \
      --add-flags "$out/share/sticker/models/${modelName}/sticker.conf"
    makeWrapper ${sticker}/bin/sticker-server $out/bin/sticker-server-${modelName} \
      --add-flags "$out/share/sticker/models/${modelName}/sticker.conf"
  '';

  meta = with stdenvNoCC.lib; {
    homepage = https://github.com/danieldk/sticker/;
    description = "Sticker ${modelName} model";
    license = licenses.unfreeRedistributable;
    platforms = platforms.unix;
     maintainers = with maintainers; [ danieldk ];
  };
}
