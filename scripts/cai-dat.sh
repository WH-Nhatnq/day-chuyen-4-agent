#!/usr/bin/env bash
# Cài dây chuyền 4 agent vào một repo sản phẩm MỚI (chạy một lần).
#   bash scripts/cai-dat.sh <thư mục repo sản phẩm>
# Làm: đồng bộ phần chung + tạo phần riêng còn thiếu (không ghi đè cái đã có)
#   - business/cau-hinh.md            (từ mẫu, có chỗ [ĐIỀN])
#   - docs/tien-do-theo-thiet-ke.md   (khung, lệnh /day-chuyen-khoi-tao điền từ thiết kế)
#   - .github/workflows/dong-bo-day-chuyen.yml (tự kéo bản mới mỗi tuần)
set -euo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)"
DST="${1:?Cần đường dẫn repo sản phẩm}"

bash "$SRC/scripts/dong-bo.sh" "$DST"

mkdir -p "$DST/business" "$DST/docs" "$DST/.github/workflows"
copy_if_missing() { if [ -e "$2" ]; then echo "Giữ nguyên (đã có): ${2#$DST/}"; else cp "$1" "$2"; echo "Tạo: ${2#$DST/}"; fi; }
copy_if_missing "$SRC/mau/cau-hinh.md" "$DST/business/cau-hinh.md"
copy_if_missing "$SRC/mau/tien-do-theo-thiet-ke.md" "$DST/docs/tien-do-theo-thiet-ke.md"
copy_if_missing "$SRC/github-workflow/dong-bo-day-chuyen.yml" "$DST/.github/workflows/dong-bo-day-chuyen.yml"

grep -q '^\.claude/worktrees/' "$DST/.gitignore" 2>/dev/null || printf '\n# git worktrees của /day-chuyen\n.claude/worktrees/\n' >> "$DST/.gitignore"

echo
echo "Xong. Bước tiếp: trong Claude Code ở repo này gõ  /day-chuyen-khoi-tao <đường dẫn file thiết kế>"
