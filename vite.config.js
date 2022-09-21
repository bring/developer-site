import { defineConfig } from "vite"
import legacy from "@vitejs/plugin-legacy"
import react from "@vitejs/plugin-react"
import { viteStaticCopy } from 'vite-plugin-static-copy'

export default defineConfig({
  build: {
    manifest: true,
    outDir: "./static/assets",
    assetsDir: ".",
    rollupOptions: {
      input: "./js/main.js",
    },
  },
  plugins: [
    legacy(), 
    react(),
    viteStaticCopy({
      targets: [{
        src: 'static/assets/manifest.json',
        dest: '../../data'
      }]
    })
  ],
})
