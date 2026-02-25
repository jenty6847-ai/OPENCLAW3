const express = require('express');
const app = express();
const port = 3000;

app.get('/health', (req, res) => {
    res.json({ status: "ok", node: "Z3_Gateway_Active" });
});

app.listen(port, () => {
    console.log(`Z3 Gateway listening at http://localhost:${port}`);
});