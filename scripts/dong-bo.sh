#!/usr/bin/env bash
# Đồng bộ phần CHUNG của dây chuyền 4 agent vào một repo sản phẩm.
#   bash scripts/dong-bo.sh <thư mục repo sản phẩm>
# Ghi đè: .claude/agents/nb-*.md, .claude/commands/day-chuyen*.md, .claude/day-chuyen/
# KHÔNG đụng: business/ (cấu hình, các vòng), docs/, code, .github/workflows/
set -euo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)"
DST="${1:?Cần đường dẫn repo sản phẩm}"
[ -d "$DST/.git" ] || { echo "Không phải git repo: $DST" >&2; exit 1; }

mkdir -p "$DST/.claude/agents" "$DST/.claude/commands" "$DST/.claude/day-chuyen"

# Xoá bản cũ của phần chung (để agent/lệnh bị bỏ ở trung tâm cũng bị bỏ ở sản phẩm)
rm -f "$DST"/.claude/agents/nb-*.md "$DST"/.claude/commands/day-chuyen*.md
rm -rf "$DST/.claude/day-chuyen"
mkdir -p "$DST/.claude/day-chuyen"

cp "$SRC"/agents/nb-*.md "$DST/.claude/agents/"
cp "$SRC"/commands/day-chuyen*.md "$DST/.claude/commands/"
cp -r "$SRC/mau" "$DST/.claude/day-chuyen/mau"
cp "$SRC/HUONG-DAN.md" "$DST/.claude/day-chuyen/HUONG-DAN.md"

VER="$(git -C "$SRC" rev-parse --short HEAD 2>/dev/null || echo local)"
DATE="$(git -C "$SRC" log -1 --format=%cs 2>/dev/null || date +%F)"
cat > "$DST/.claude/day-chuyen/PHIEN-BAN" <<EOF
nguon: https://github.com/WH-Nhatnq/day-chuyen-4-agent
commit: $VER
ngay: $DATE
EOF
echo "Đã đồng bộ dây chuyền 4 agent (commit $VER) vào $DST"
