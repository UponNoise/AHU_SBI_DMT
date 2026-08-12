import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

const siteOrigin = 'https://uponnoise.github.io';
const siteBase = '/AHU_SBI_DMT';
const absoluteBase = `${siteOrigin}${siteBase}`;

export default defineConfig({
  site: siteOrigin,
  base: siteBase,
  trailingSlash: 'always',
  integrations: [
    starlight({
      title: 'AHU SBI 课程资料索引',
      description: '按专业、学期、课程代码和资料类型快速找到安徽大学纽约石溪学院课程资料。',
      defaultLocale: 'root',
      locales: {
        root: { label: '简体中文', lang: 'zh-CN' },
      },
      customCss: ['./src/styles/custom.css'],
      social: [
        {
          icon: 'github',
          label: '在 GitHub 查看仓库',
          href: 'https://github.com/UponNoise/AHU_SBI_DMT',
        },
      ],
      head: [
        { tag: 'meta', attrs: { name: 'theme-color', content: '#1e3a5f' } },
        { tag: 'meta', attrs: { property: 'og:type', content: 'website' } },
        { tag: 'meta', attrs: { property: 'og:locale', content: 'zh_CN' } },
        { tag: 'meta', attrs: { property: 'og:image', content: `${absoluteBase}/og.png` } },
        { tag: 'meta', attrs: { name: 'twitter:card', content: 'summary_large_image' } },
        { tag: 'meta', attrs: { name: 'twitter:image', content: `${absoluteBase}/og.png` } },
      ],
      sidebar: [
        {
          label: '快速开始',
          items: [
            { label: '首页', slug: '' },
            { label: '全部课程', slug: 'courses' },
          ],
        },
        {
          label: '按专业浏览',
          items: [
            { label: '数字媒体技术', slug: 'curricula/dmt' },
            { label: '应用统计学', slug: 'curricula/ams' },
          ],
        },
        {
          label: '关于项目',
          items: [
            { label: '使用说明', slug: 'about' },
            { label: '参与贡献', slug: 'contribute' },
          ],
        },
      ],
      lastUpdated: false,
      pagination: true,
      credits: false,
    }),
  ],
});
