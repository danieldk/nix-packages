{ stdenvNoCC, fetchurl, makeWrapper, sticker, tagEmbeds ? null, wordEmbeds, modelName, sha256, version }:

stdenvNoCC.mkDerivation rec {
  inherit version;

  pname = "sticker-${modelName}";

  src = fetchurl {
    inherit sha256;

    url = "http://www.sfs.uni-tuebingen.de/a3-public-data/sticker-models/${modelName}-${version}.tar.gz";
  };

  nativeBuildInputs = [ makeWrapper ];

  preConfigure = ''
    substituteInPlace sticker.conf \
      --replace "../embeddings/structured-skipgram-mincount-30-ctx-10-dims-300-zipf-0.75.fifu" \
        "${wordEmbeds}"
  '' + stdenvNoCC.lib.optionalString (tagEmbeds != null) ''
    substituteInPlace sticker.conf \
      --replace "../embeddings/taz-wiki-ep-r4-tags.fifu" \
        "${tagEmbeds}"
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
