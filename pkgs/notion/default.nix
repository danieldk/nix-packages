{ stdenv
, fetchurl
, libicns
, makeDesktopItem
, makeWrapper
, undmg
, electron_6
}:

stdenv.mkDerivation rec {
  pname = "notion";
  version = "2.0.5";

  src = fetchurl {
    url = "https://desktop-release.notion-static.com/Notion-${version}.dmg";
    sha256 = "04bks8b6pk7awq0p4jjqg6dvf87wslqfda6hcn5j7rzk9ck31fki";
  };

  dontBuild = true;

  nativeBuildInputs = [
    libicns
    makeWrapper
    undmg
  ];

  preInstallPhase = ''
  '';

  installPhase = let
    desktopItem = makeDesktopItem {
      name = pname;
      desktopName = "Notion";
      icon = "${pname}.png";
      categories = "Office;";
      exec = "notion";
    };
  in ''
    mkdir -p $out/share
    cp -r Contents/Resources $out/share/notion
    makeWrapper ${electron_6}/bin/electron $out/bin/notion \
      --add-flags $out/share/notion/app.asar \
      --run "cd $out/share/notion"

    icns2png -x Contents/Resources/Notion.icns
    install -Dm644 Notion_512x512x32.png \
      $out/share/icons/hicolor/512x512/apps/notion.png

    ${desktopItem.buildCommand}
  '';

  meta = with stdenv.lib; {
    description = "All-in-one workspace for notes, tasks, and wikis";
    license = licenses.unfree;
    maintainers = with maintainers; [ danieldk ];
    hydraPlatforms = [];
  };

}
