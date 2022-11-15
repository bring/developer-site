import { defineConfig } from "vite"
import legacy from "@vitejs/plugin-legacy"
import react from "@vitejs/plugin-react"

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
        "bring-env/main": "./js/webcomponent/bring-env/main.js"
      },
      output: {
        entryFileNames: asset => {
          return asset.name.includes("bring-env") ? "[name].js" : "[name].[hash].js"
        }
      }
    }
  },
  plugins: [legacy(), react()],
})
