# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.

---

## 🦞 小龙虾武装配置 (2026-02-26)

### 已安装技能

| 技能 | 用途 | 配置 |
|------|------|------|
| `multi-search-engine` | 17 个搜索引擎 (无 API) | 无需配置 |
| `security-auditor` | OWASP 安全审计 | 无需配置 |
| `find-skills` | 技能发现与安装 | 无需配置 |
| `tavily-search` | AI 优化 web 搜索 | 需 `TAVILY_API_KEY` |

### ✅ 已安装 (第二阶段 - 2026-02-26)

| 技能 | 用途 | 配置 |
|------|------|------|
| `n8n-workflow-automation` | 自动化工作流引擎 | 需 n8n 实例 |
| `cron-scheduling` | 智能调度系统 | Linux/macOS (cron/systemd) |

### 搜索引擎快捷方式

**Google 高级搜索**:
- 站点：`site:github.com`
- 文件：`filetype:pdf`
- 时间：`tbs=qdr:w` (周) / `tbs=qdr:d` (日)

**DuckDuckGo Bangs**:
- `!gh` → GitHub
- `!w` → Wikipedia
- `!so` → Stack Overflow
- `!yt` → YouTube
