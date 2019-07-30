{ dockerTools, model, tagPrefix }:

dockerTools.buildLayeredImage {
  name = "danieldk/sticker";
  tag = "${tagPrefix}-${model.model.version}";
  contents = model.wrapper;
  maxLayers = 100;
}
