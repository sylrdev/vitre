import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Vitre",
  description: "Developer focused UI based on Vide",
  base: "vitre",
  head: [["link", { rel: "icon", href: "logo.svg" }]],
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: "logo.svg",

    nav: [
      { text: "Home", link: "/" },
      { text: "Get Started", link: "/get-started/1-introduction" },
      { text: "API", link: "/api/1-setup" },
    ],

    search: { provider: "local" },

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
            { text: ":setup()", link: "/api/1-setup" },
            { text: ":append()", link: "/api/2-append" },
            {
              text: ":overrideUserInput()",
              link: "/api/3-override-user-input",
            },
            { text: ":overrideTheme()", link: "" },
            { text: ".Window()", link: "" },
            { text: ".Widget", link: "" },
            { text: ".Vide", link: "" },
          ],
        },
        {
          text: "Widgets",
          items: [
            { text: ".Text()", link: "" },
            { text: ".DividerText()", link: "" },
            { text: ".TextBox()", link: "" },
            { text: ".Divider()", link: "" },
            { text: ".Indent()", link: "" },
            { text: ".SameLine()", link: "" },
            { text: ".Button()", link: "" },
            { text: ".Checkbox()", link: "" },
            { text: ".RadioButton()", link: "" },
          ],
        },
        {
          text: "Types",
          items: [{ text: "TODO", link: "" }],
        },
      ],
    },

    socialLinks: [
      { icon: "discord", link: "https://discord.gg/Bakn4qDtYz" },
      { icon: "github", link: "https://github.com/sylrdev/vitre" },
    ],
  },
});
