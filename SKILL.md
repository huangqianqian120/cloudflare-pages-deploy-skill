---
name: cloudflare-pages-deploy
description: 一键部署 web 项目到 Cloudflare Pages，生成可外网访问的链接。使用 wrangler CLI，适用场景：(1) 部署静态网站 (2) 部署 Next.js/Nuxt 等前端项目 (3) 快速分享原型给外网人员。触发：当用户说"部署到 Cloudflare"、"发布网页"、"一键部署"、"deploy to cloudflare"时使用。
---

# Cloudflare Pages 一键部署

## ⚠️ 前提条件（部署前必须完成）

### 1. 获取 Cloudflare API Token（国内用户必须用这个）

由于网络原因，OAuth 授权会超时，需手动创建 API Token：

1. 访问 https://dash.cloudflare.com/profile/api-tokens
2. 点击「Create Token」
3. 使用「Edit Cloudflare Workers」模板
4. 复制生成的 Token

然后在终端设置：
```bash
export CLOUDFLARE_API_TOKEN="你的Token"
```

**建议把 Token 写入 `~/.zshrc` 永久保存**：
```bash
echo 'export CLOUDFLARE_API_TOKEN="你的Token"' >> ~/.zshrc && source ~/.zshrc
```

### 2. 安装 Wrangler CLI

```bash
npm install -g wrangler
```

### 3. 验证配置

```bash
wrangler whoami
```

看到账号信息即表示配置成功。

---

## 支持的项目类型

### 纯静态项目（需先构建）
- **HTML 单页**：纯 HTML + CSS + JS
- **Vite 项目**：React/Vue/Svelte 等，构建后 `dist/`
- **Create React App**：构建后 `build/`
- **Tailwind CSS 项目**：构建后 `dist/`

### 框架项目
- **Next.js**：`npx @cloudflare/next-on-pages` 后部署 `.next/`
- **Nuxt**：构建后 `.output/public/`

### 其他
- **图片/H5 静态页**
- **文档站点**（docsify、VitePress）
- **任何包含 `index.html` 的构建产物目录**

## 部署命令

### 静态网站（最常用）

```bash
wrangler pages deploy <构建目录> --project-name=<项目名>
```

示例：
```bash
wrangler pages deploy dist --project-name=my-app
wrangler pages deploy build --project-name=my-app
```

### Next.js

```bash
npx @cloudflare/next-on-pages
wrangler pages deploy .next --project-name=<项目名>
```

### 交互式部署（脚本自动引导）

```bash
bash cloudflare-pages-deploy/scripts/deploy.sh
```

## 部署后

Wrangler 返回 `https://<项目名>.pages.dev`，直接分享即可，**无需账号即可访问**。

## 常用选项

- `--project-name`：Cloudflare Pages 项目名
- `--branch`：部署分支，默认 `production`
