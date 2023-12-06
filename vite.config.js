import { defineConfig } from "vite"
import legacy from "@vitejs/plugin-legacy"
import preact from "@preact/preset-vite"

export default defineConfig({
  define: {
    __ALGOLIA_INDEX__: `"${process.env.ALGOLIA_INDEX || "devsite_qa"}"`,
  },
  build: {
    manifest: true,
    outDir: "./static/assets",
    assetsDir: ".",
    rollupOptions: {
      input: {
        main: "./js/main.js",
        "bring-env/main": "./js/webcomponent/bring-env/main.js",
        "api-updates-subscribe/main": "./js/webcomponent/api-updates-subscribe/main.js",
        "api-updates-subscribe/cr-script": "./js/webcomponent/api-updates-subscribe/cr-script.js"
      },
      output: {
        entryFileNames: asset => {
          return asset.name.includes("bring-env") || asset.name.includes("api-updates-subscribe") ? "[name].js" : "[name].[hash].js"
        }
      }
    }
  },
  plugins: [legacy(), preact()],
})
