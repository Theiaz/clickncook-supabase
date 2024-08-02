import { sentryVitePlugin } from '@sentry/vite-plugin'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import { VitePWA } from 'vite-plugin-pwa'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['favicon.ico', 'apple-touch-icon.png', 'mask-icon.svg'],
      manifest: {
        name: "Click 'n' Cook",
        short_name: "C'n'C",
        description: 'Get random recipes for cooking!',
        theme_color: '#00473E',
        icons: [
          {
            src: '/pwa-192x192.png',
            sizes: '192x192',
            type: 'image/png',
            purpose: 'any'
          },
          {
            src: '/pwa-512x512.png',
            sizes: '512x512',
            type: 'image/png',
            purpose: 'any'
          },
          {
            src: '/pwa-maskable-192x192.png',
            sizes: '192x192',
            type: 'image/png',
            purpose: 'maskable'
          },
          {
            src: '/pwa-maskable-512x512.png',
            sizes: '512x512',
            type: 'image/png',
            purpose: 'maskable'
          }
        ],
        shortcuts: [
          {
            name: 'Create a new recipe',
            short_name: 'Create',
            icons: [
              {
                src: '/shortcut-new.png',
                sizes: '192x192',
                type: 'image/png',
                purpose: 'any'
              }
            ],
            description: 'Create a new recipe',
            url: '/new'
          },
          {
            name: 'View my recipes list',
            short_name: 'My recipes',
            icons: [
              {
                src: '/shortcut-my.png',
                sizes: '192x192',
                type: 'image/png',
                purpose: 'any'
              }
            ],
            description: 'View your saved recipes',
            url: '/my'
          }
        ]
      },
      devOptions: {
        enabled: false // enable sw on development
      }
    }),
    sentryVitePlugin({
      org: 'julian-schaefer',
      project: 'clickncook-supabase'
    })
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  build: {
    target: 'es2022',
    sourcemap: true
  },
  worker: {
    format: 'es'
  }
})
