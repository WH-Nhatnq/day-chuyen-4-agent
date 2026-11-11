# Dây chuyền 4 agent cho Claude Code

Kế hoạch → Thực thi → Test → Review, mỗi lớp là một subagent Claude Code riêng, chuyển giao bằng file Markdown, có cổng duyệt và chế độ chạy qua đêm (`--qua-dem`) kết thúc bằng một pull request. Dùng để build sản phẩm theo một file thiết kế (mỗi mục như `P01` thành một vòng) hoặc thử một ý tưởng kinh doanh.

Đây là **bản gốc dùng chung**. Mỗi repo sản phẩm giữ một bản sao trong `.claude/` (Claude Code trên web/iPad chỉ đọc agent và lệnh nằm trong repo, không cài plugin), được Action *Đồng bộ dây chuyền 4 agent* cập nhật bằng PR.

Hướng dẫn sử dụng: [HUONG-DAN.md](HUONG-DAN.md) (tiếng Việt).

## Cấu trúc
| Đường dẫn | Nội dung | Vào repo sản phẩm thành |
|---|---|---|
| `agents/nb-plan.md`, `nb-thuc-thi.md`, `nb-test.md`, `nb-review.md` | 4 subagent | `.claude/agents/` |
| `commands/day-chuyen.md` | Lệnh điều phối `/day-chuyen` | `.claude/commands/` |
| `commands/day-chuyen-khoi-tao.md` | Lệnh `/day-chuyen-khoi-tao` cho sản phẩm mới | `.claude/commands/` |
| `mau/` | Mẫu tài liệu mỗi lớp, mẫu cấu hình, khung bảng tiến độ | `.claude/day-chuyen/mau/` |
| `HUONG-DAN.md` | Hướng dẫn | `.claude/day-chuyen/HUONG-DAN.md` |
| `scripts/cai-dat.sh` | Cài lần đầu vào một repo sản phẩm | – |
| `scripts/dong-bo.sh` | Đồng bộ phần chung (dùng bởi Action) | – |
| `github-workflow/dong-bo-day-chuyen.yml` | Action đồng bộ hằng tuần | `.github/workflows/` |

## Cài vào repo sản phẩm
```bash
git clone https://github.com/WH-Nhatnq/day-chuyen-4-agent /tmp/day-chuyen-4-agent
bash /tmp/day-chuyen-4-agent/scripts/cai-dat.sh <repo sản phẩm>
```
Rồi trong Claude Code ở repo đó: `/day-chuyen-khoi-tao <file thiết kế>`.

## Nguyên tắc
- Mỗi lớp chỉ ghi file của mình; người chấm (Test) không phải người làm (Thực thi).
- Không bao giờ tự merge, deploy, tiêu tiền, liên hệ khách hay đụng dữ liệu thật; mọi việc đó là của người duyệt.
- Không bịa bằng chứng: thang E0–E4 (AI suy luận không tính; chỉ khách thật cam kết/trả tiền là bằng chứng mạnh).
