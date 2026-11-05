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
            { text: "Gallery", link: "/get-started/3-gallery" },
          ],
        },

        {
          text: "Use Vitre",
          items: [
            { text: "Setting Up", link: "/get-started/4-setting-up" },
            {
              text: "Your First Window",
              link: "/get-started/5-your-first-window",
            },
            { text: "Reactive Window", link: "/get-started/6-reactive-window" },
            { text: "Stories", link: "/get-started/7-stories" },
          ],
        },
      ],
      "/api/": [
        {
          text: "",
          items: [],
        },
      ],
    },

    socialLinks: [
      { icon: "discord", link: "https://discord.gg/Bakn4qDtYz" },
      { icon: "github", link: "https://github.com/sylrdev/vitre" },
    ],
  },
});
