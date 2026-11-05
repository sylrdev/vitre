import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: "en-US",
  title: "Vitre",
  description: "Developer focused UI based on Vide",
  base: "vitre",
  head: [["link", { rel: "icon", href: "/vitre/logo.svg" }]],
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: "/logo.svg",

    nav: [
      { text: "Home", link: "/" },
      { text: "Get Started", link: "/get-started/1-introduction" },
      { text: "API", link: "/api/vitre/1-setup" },
    ],

    search: {
      provider: "local",
    },

    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2026 sylrdev",
    },

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
          text: "Vitre",
          items: [
            { text: ":setup()", link: "/api/vitre/1-setup" },
            { text: ":append()", link: "/api/vitre/2-append" },
            {
              text: ":overrideUserInput()",
              link: "/api/vitre/3-override-user-input",
            },
            { text: ":overrideTheme()", link: "/api/vitre/4-override-theme" },
            { text: ".Window()", link: "/api/vitre/5-window" },
            { text: ".Widget", link: "/api/vitre/6-widget" },
            { text: ".Vide", link: "/api/vitre/7-vide" },
          ],
        },
        {
          text: "Widgets",
          items: [{ text: ".Text()", link: "/api/widgets/1-text" }],
        },
        {
          text: "Types",
          items: [{ text: ".Prop", link: "/api/types/1-prop" }],
        },
      ],
    },

    socialLinks: [
      { icon: "discord", link: "https://discord.gg/Bakn4qDtYz" },
      { icon: "github", link: "https://github.com/sylrdev/vitre" },
    ],
  },
});
