const { defineConfig } = require("@vue/cli-service");

module.exports = defineConfig({
  transpileDependencies: ["@vueform"],
  devServer: {
    port: "9000",
  },
});
