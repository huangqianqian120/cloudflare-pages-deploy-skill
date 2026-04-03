#!/bin/bash

# Cloudflare Pages 一键部署脚本
# 用法: bash deploy.sh [项目目录] [项目名]

set -e

PROJECT_DIR="${1:-}"
PROJECT_NAME="${2:-}"

# 检查 wrangler
if ! command -v wrangler &> /dev/null; then
    echo "❌ wrangler 未安装"
    echo "请先运行以下命令安装:"
    echo "  npm install -g wrangler"
    echo "然后运行:"
    echo "  wrangler login"
    exit 1
fi

# 检查是否已登录
if ! wrangler whoami &> /dev/null; then
    echo "❌ 未登录 Cloudflare"
    echo "请先运行: wrangler login"
    exit 1
fi

# 交互式输入项目目录
if [ -z "$PROJECT_DIR" ]; then
    echo "📁 请输入项目目录路径（包含构建产物）:"
    read -r PROJECT_DIR
fi

if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ 目录不存在: $PROJECT_DIR"
    exit 1
fi

# 交互式输入项目名
if [ -z "$PROJECT_NAME" ]; then
    echo "📝 请输入 Cloudflare Pages 项目名:"
    read -r PROJECT_NAME
fi

if [ -z "$PROJECT_NAME" ]; then
    echo "❌ 项目名不能为空"
    exit 1
fi

echo "🚀 开始部署 $PROJECT_DIR -> $PROJECT_NAME..."

# 执行部署
wrangler pages deploy "$PROJECT_DIR" --project-name="$PROJECT_NAME"

echo "✅ 部署完成！访问: https://$PROJECT_NAME.pages.dev"
