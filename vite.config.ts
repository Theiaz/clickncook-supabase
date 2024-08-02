import { sentryVitePlugin } from '@sentry/vite-plugin'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig, loadEnv } from 'vite'
import { VitePWA } from 'vite-plugin-pwa'

const plugins = [
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
  })
]

export default defineConfig(({ command, mode }) => {
  const isProduction = command === 'build'
  if (isProduction) {
    const env = loadEnv(mode, process.cwd(), '') // Set the third parameter to '' to load all env regardless of the `VITE_` prefix.

    plugins.push(
      sentryVitePlugin({
        authToken: env.SENTRY_AUTH_TOKEN,
        org: 'julian-schafer-b1',
        project: 'clickncook-supabase'
      })
    )
  }

  return {
    plugins,
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
  }
})
