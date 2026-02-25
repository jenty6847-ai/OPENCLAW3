Stop-Process -Name node -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1
Start-Process node -ArgumentList 'C:\Users\Y\.openclaw\workspace\api-gateway\server.js' -WindowStyle Hidden
Start-Sleep -Seconds 2

$body = @{ content = '小龙虾的最高指挥代号是18789' } | ConvertTo-Json
$postRes = Invoke-RestMethod -Uri 'http://localhost:3000/secret' -Method Post -Body $body -ContentType 'application/json'
Write-Host "--- 存入保险箱返回 ---"
$postRes | ConvertTo-Json -Compress

$getRes = Invoke-RestMethod -Uri 'http://localhost:3000/secret' -Method Get
Write-Host "--- 从保险箱取出返回 ---"
$getRes | ConvertTo-Json -Compress

Write-Host "--- 真实物理硬盘文件读取 ---"
Get-Content C:\Users\Y\.openclaw\workspace\api-gateway\vault\secret.txt