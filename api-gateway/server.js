const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const port = 3000;

// 配置处理接收到的文字 (JSON格式) 的工具
app.use(express.json());

// 找到我们刚刚建立的安全保险箱
const vaultPath = path.join(__dirname, 'vault', 'secret.txt');

// 原有的健康检查门岗
app.get('/health', (req, res) => {
    res.json({ status: "ok", node: "Z3_Gateway_Active" });
});

// 新增的“存钱口”：接收机密并写死在本地硬盘
app.post('/secret', (req, res) => {
    const secretContent = req.body.content;
    if (!secretContent) {
        return res.status(400).json({ error: "没有收到机密内容" });
    }
    // 把文字强行写进保险箱（覆盖旧机密）
    fs.writeFileSync(vaultPath, secretContent, 'utf8');
    res.json({ status: "success", message: "机密已成功锁入本地保险箱" });
});

// 新增的“取钱口”：从本地硬盘把机密原封不动拿出来
app.get('/secret', (req, res) => {
    if (fs.existsSync(vaultPath)) {
        const secretContent = fs.readFileSync(vaultPath, 'utf8');
        res.json({ status: "success", content: secretContent });
    } else {
        res.status(404).json({ error: "保险箱目前是空的" });
    }
});

app.listen(port, () => {
    console.log(`Z3 Gateway (带机密保险箱) listening at http://localhost:${port}`);
});