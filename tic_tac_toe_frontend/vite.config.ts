import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import reactNativeWeb from 'vite-plugin-react-native-web';

export default defineConfig({
  plugins: [reactNativeWeb(), react()],
  resolve: {
    alias: {
      'react-native': 'react-native-web',
    },
  },
  server: {
    /**
     * The Kavia preview exposes the container on port 3000 by default.
     * This project also defines EXPO_PUBLIC_PORT=3000 in its environment.
     * Use it when present so the dev server matches the preview port.
     */
    port: Number(process.env.EXPO_PUBLIC_PORT ?? 3000),

    /**
     * In containerized environments, the server must listen on all interfaces
     * so the platform can route traffic into it.
     */
    host: true,

    strictPort: false,

    /**
     * Allow the Kavia preview hostnames.
     */
    allowedHosts: ['*.kavia.ai'],
  },
});
