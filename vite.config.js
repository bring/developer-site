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
      input: "./js/main.js",
    },
  },
  plugins: [legacy(), react()],
})