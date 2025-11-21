import { defineConfig } from '@slidev/cli'
import { resolve } from 'path'

export default defineConfig({
  // Configure Vite to resolve components from the root slides directory
  vite: {
    resolve: {
      alias: {
        // Make components accessible from any deck
        '@components': resolve(__dirname, 'components'),
      },
    },
  },
  // Configure component auto-import to include root components directory
  components: {
    dirs: [resolve(__dirname, 'components')],
  },
})

