{ dockerTools, model }:

dockerTools.buildLayeredImage {
  name = "danieldk/sticker";
  tag = "${model.pname}-${model.version}";
  contents = model;
  maxLayers = 100;
}
