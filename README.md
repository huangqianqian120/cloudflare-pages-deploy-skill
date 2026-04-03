# cloudflare-pages-deploy

一键部署 web 项目到 Cloudflare Pages，生成可访问的链接。

## 安装

```bash
# 下载 skill
git clone https://github.com/huangqianqian120/cloudflare-pages-deploy-skill.git

# 放入 OpenClaw skills 目录
mv cloudflare-pages-deploy ~/.local/lib/node_modules/openclaw/skills/
```

## 前提条件

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

**永久保存**：
```bash
echo 'export CLOUDFLARE_API_TOKEN="你的Token"' >> ~/.zshrc && source ~/.zshrc
```

### 2. 安装 Wrangler CLI

```bash
npm install -g wrangler
```

### 3. 验证

```bash
wrangler whoami
```

## 使用

```bash
wrangler pages deploy <构建目录> --project-name=<项目名>
```

示例：
```bash
wrangler pages deploy dist --project-name=my-app
```

## 支持项目类型

- 纯静态网站（HTML/CSS/JS）
- Vite 项目（React/Vue/Svelte）
- Next.js（需先运行 `npx @cloudflare/next-on-pages`）
- Nuxt
- 文档站点（docsify、VitePress）
