---
description: Khởi tạo phần riêng của dây chuyền 4 agent cho sản phẩm này (cấu hình + bảng tiến độ từ file thiết kế)
argument-hint: <đường dẫn file thiết kế sản phẩm> [tên sản phẩm]
---

Bạn chuẩn bị repo này để chạy `/day-chuyen`. Trả lời người dùng bằng tiếng Việt, ngắn.

Tham số: `$ARGUMENTS`

## 1. Kiểm tra phần chung
- Có `.claude/agents/nb-plan.md`, `nb-thuc-thi.md`, `nb-test.md`, `nb-review.md`, `.claude/commands/day-chuyen.md`, `.claude/day-chuyen/mau/`? Thiếu → dừng, bảo người dùng làm bước cài đặt trong `.claude/day-chuyen/HUONG-DAN.md` (mục "Sản phẩm mới").

## 2. Cấu hình `business/cau-hinh.md`
- Chưa có → chép từ `.claude/day-chuyen/mau/cau-hinh.md`. Đã có → chỉ điền chỗ còn `[ĐIỀN]`, không đổi giá trị người dùng đã đặt.
- Tự điền được: tên sản phẩm (tham số, hoặc tiêu đề file thiết kế, hoặc tên repo), `repo_github` (từ `git remote get-url origin`), đường dẫn + phiên bản file thiết kế (tham số 1; phiên bản đọc trong file).
- Phần còn lại cần người dùng (chủ thể, giờ/tuần, ngân sách, ngôn ngữ cho khách, tài liệu "không dùng"): hỏi trong MỘT lần (hộp hỏi nếu có, mỗi câu kèm mặc định). Người dùng không trả lời → giữ mặc định của mẫu, ghi "(mặc định)".

## 3. Bảng tiến độ `docs/tien-do-theo-thiet-ke.md`
- Đọc toàn bộ file thiết kế. Dựng bảng theo mẫu `.claude/day-chuyen/mau/tien-do-theo-thiet-ke.md`:
  - Mỗi nhóm lớn của thiết kế (thành phần hiện có, màn hình/chức năng có mã như P01/A01, dữ liệu/entity, nội dung/danh mục, chất lượng/bàn giao) = một bảng.
  - Mỗi mục = một dòng, **dùng đúng mã và tên trong thiết kế**, ghi số mục (§) để truy vết. Trạng thái ban đầu ⬜; mục thiết kế ghi rõ là sau MVP → ⏸.
  - Bảng Tổng quan đếm đúng số dòng mỗi nhóm.
- Đã có bảng tiến độ với dữ liệu thật → KHÔNG ghi đè; chỉ báo các mục thiết kế chưa có dòng.

## 4. Không làm
- Không sửa code, không tạo vòng, không chạy 4 lớp, không push lên main trực tiếp nếu đang ở phiên cloud (commit lên nhánh của phiên, tạo PR).

## 5. Báo lại (≤ 10 dòng)
- File đã tạo/sửa; số dòng mỗi nhóm trong bảng tiến độ; các chỗ `[ĐIỀN]` còn lại.
- Lệnh đầu tiên gợi ý: `/day-chuyen sprint-0 Audit hiện trạng code so với <file thiết kế>, đối chiếu dữ liệu, lập backlog có ước lượng --qua-dem` (repo đã có code), hoặc `/day-chuyen <slug> Làm <mã đầu tiên>` (repo trống).
