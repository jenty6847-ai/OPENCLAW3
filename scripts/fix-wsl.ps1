$ErrorActionPreference = "SilentlyContinue"

Write-Host "=========================================="
Write-Host "国学IP数字工厂 - 底层环境自动修复程序"
Write-Host "=========================================="
Write-Host "正在强制清理僵死的 WSL 虚拟化引擎..."

# 获取 LxssManager 所在的进程 ID 并强制结束
$svc = Get-WmiObject Win32_Service -Filter "Name='LxssManager'"
if ($svc.ProcessId -ne 0) { 
    Stop-Process -Id $svc.ProcessId -Force 
}

Write-Host "正在重置网络层通信协议 (解决 Docker 无法连接)..."
netsh winsock reset

Write-Host "正在尝试更新并重启 WSL 核心组件..."
wsl --update
Start-Service LxssManager

Write-Host "=========================================="
Write-Host "修复指令已下发完毕！"
Write-Host "=========================================="
Write-Host "本窗口将在 8 秒后自动关闭..."
Start-Sleep -Seconds 8
