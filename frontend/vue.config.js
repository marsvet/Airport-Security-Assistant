module.exports = {
  transpileDependencies: ["vuetify"],
  configureWebpack: {
    externals: {
      BMap: "BMap"
    }
  }
};
