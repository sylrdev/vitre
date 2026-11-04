import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Vitre",
  description: "Developer focused UI based on Vide",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "Get Started", link: "/get-started/1-introduction" },
      { text: "API", link: "/api/" },
    ],

    sidebar: {
      "/get-started/": [
        {
          text: "Get Started",
          items: [
            { text: "Introduction", link: "/get-started/1-introduction" },
            { text: "Installation", link: "/get-started/2-installation" },
          ],
        },
      ],
      "/api/": [
        {
          text: "Examples",
          items: [],
        },
      ],
    },

    socialLinks: [
      { icon: "github", link: "https://github.com/vuejs/vitepress" },
    ],
  },
});
