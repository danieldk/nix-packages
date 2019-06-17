{ dockerTools, model, tagPrefix }:

dockerTools.buildLayeredImage {
  name = "danieldk/sticker";
  tag = "${tagPrefix}-${model.version}";
  contents = model;
  maxLayers = 100;
}
