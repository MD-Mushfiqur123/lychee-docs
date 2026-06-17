import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Lychee Docs',
  description: 'Documentation for Lychee — Local LLM Orchestration Layer',
  lang: 'en-US',
  base: '/lychee-docs/',
  
  themeConfig: {
    logo: '/lychee-logo.svg',
    
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/getting-started' },
      { text: 'GitHub', link: 'https://github.com/MD-Mushfiqur123/lychee' },
    ],

    sidebar: {
      '/guide/': [
        {
          text: 'Guide',
          items: [
            { text: 'Getting Started', link: '/guide/getting-started' },
            { text: 'CLI Reference', link: '/guide/cli' },
            { text: 'API Reference', link: '/guide/api' },
            { text: 'Docker', link: '/guide/docker' },
            { text: 'HuggingFace Integration', link: '/guide/huggingface' },
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/MD-Mushfiqur123/lychee' }
    ],

    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2026 Lychee'
    }
  }
})
