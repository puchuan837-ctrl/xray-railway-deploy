# Xray VLESS+WS+TLS on Railway 部署说明

## 你的节点信息（已生成）
- UUID: `8088e1b6-b22c-4532-8680-3b907209c707`
- WS 路径: `/ray`
- 协议: VLESS + WS + TLS（TLS 由 Railway 自动提供）

## 部署步骤

1. 用你的 GitHub 账号登录 https://railway.app
2. New Project → Deploy from GitHub repo，把本目录 `xray-railway` 推到你的 GitHub 仓库后选择它
   - 或直接用 Dockerfile 部署
3. 在 Railway 的 Variables 里确认（可选，默认已内置）：
   - `UUID=8088e1b6-b22c-4532-8680-3b907209c707`
   - `WS_PATH=/ray`
4. 点 Settings → Networking → Generate Domain，得到你的域名，如 `xxx.up.railway.app`
5. 回到本机运行生成二维码：
   ```
   python3 gen_qr.py xxx.up.railway.app
   ```
   会输出小火箭链接，并在目录下生成 `vless-qr-real.png`，用小火箭扫码即可导入。

## 小火箭链接格式
```
vless://UUID@域名:443?encryption=none&security=tls&sni=域名&type=ws&host=域名&path=%2Fray#Railway-VLESS
```

## 拨测
部署完成后，在小火箭里打开节点看延迟，或访问 `https://你的域名/ray` 应返回 400（说明 WS 通道正常）。

## 文件说明
- `Dockerfile` / `entrypoint.sh` / `config-template.json`: Railway 部署用
- `gen_qr.py`: 生成链接和二维码
- `vless-qr.png`: 示例二维码（域名为占位符，部署后重新生成）
<!-- redeploy trigger 2026-10-21 -->
