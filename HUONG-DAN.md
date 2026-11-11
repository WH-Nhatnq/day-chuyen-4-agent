# Dây chuyền 4 agent – hướng dẫn ngắn

Đưa một yêu cầu (ý tưởng, hoặc một mục trong file thiết kế sản phẩm) qua 4 lớp, mỗi lớp là một agent riêng, chuyển giao bằng file:

```
Yêu cầu ─▶ 1 KẾ HOẠCH ─▶ 2 THỰC THI ─▶ 3 TEST ─▶ 4 REVIEW ─▶ BẠN DUYỆT
           (nb-plan)     (nb-thuc-thi)  (nb-test)  (nb-review)   (duyet)
           01-ke-hoach   san-pham/ +    03-ket-    04-danh-gia   ghi quyết định
                         code nhánh     qua-test   + bảng tiến độ
```

Bản gốc: https://github.com/WH-Nhatnq/day-chuyen-4-agent. Trong mỗi repo sản phẩm, `.claude/agents/nb-*.md`, `.claude/commands/day-chuyen*.md`, `.claude/day-chuyen/` là **bản sao đồng bộ – đừng sửa tay ở đây**, sửa ở repo trung tâm. Phần riêng của sản phẩm: `business/cau-hinh.md`, `business/<slug>/…`, `docs/tien-do-theo-thiet-ke.md`.

## Lệnh

| Bạn gõ | Việc xảy ra |
|---|---|
| `/day-chuyen <slug> Làm P01` | Mở vòng mới làm đúng mục P01 trong file thiết kế (tiêu chí nghiệm thu chép nguyên văn) |
| `/day-chuyen <slug> <mô tả ý tưởng hoặc file .md>` | Mở vòng mới cho một ý tưởng tự do |
| `/day-chuyen <slug> tiep` | Chạy lớp kế tiếp của vòng đang dở |
| `/day-chuyen <slug> duyet QUA CONG <ghi chú>` | Ghi quyết định của bạn (QUA CONG / LAM LAI / PIVOT / DUNG) |
| Thêm `--qua-dem` vào cuối | Chạy liền 4 lớp không dừng hỏi, cuối cùng commit + push + tạo PR |
| `/day-chuyen-khoi-tao <file thiết kế>` | Một lần cho sản phẩm mới: điền cấu hình, dựng bảng tiến độ |

`slug` = tên ngắn của việc, chữ thường, gạch nối, không dấu (VD `p01`, `sprint-0`).

## Chế độ chạy (`business/cau-hinh.md`, dòng `che_do_chay`)
- **tung-lop**: dừng sau mỗi lớp để bạn đọc và gõ `tiep`.
- **ca-chuoi**: chạy liền 4 lớp, chỉ dừng khi Kế hoạch có câu hỏi bỏ ngỏ, Test KHÔNG ĐẠT, hoặc tới cổng cuối.
- **`--qua-dem`** (cờ, cho một lần): không dừng ở đâu cả; câu hỏi thì agent chọn phương án khuyên và ghi `[AGENT TỰ CHỌN – PO cần xác nhận]`; Test rớt thì tự sửa tối đa 2 lần; kết thúc bằng PR. Không bao giờ tự merge, deploy, tiêu tiền, đụng dữ liệu thật.

## Giao việc buổi tối, sáng mai có kết quả (cloud)
Mở phiên mới ở claude.ai/code (repo sản phẩm, nhánh `main`), dán:
```
/day-chuyen <slug> Làm <mã> theo <file thiết kế> <§>. Dựa trên docs/tien-do-theo-thiet-ke.md và kết quả các vòng trước. --qua-dem
```
Sáng hôm sau: đọc tin nhắn cuối + PR → `duyet ...` → thấy ổn thì Merge. Mỗi đêm một việc, một phiên.
Lớp Kế hoạch/Thực thi cần tra web (nguồn, giá…) mà môi trường cloud để mạng **Limited** thì có thể bị chặn: thêm tên miền được phép trong cài đặt môi trường, hoặc dùng **Full** cho vòng nghiên cứu.

## Cổng dừng – ai quyết
| Chỗ dừng | Khi nào | Bạn làm gì |
|---|---|---|
| Sau Kế hoạch | `CAU HOI BO NGO: CO` | Trả lời câu hỏi |
| Sau Test | `KET QUA TEST: KHONG DAT` | Sửa lại (Thực thi) hay vẫn đi Review |
| Cổng cuối | Luôn luôn | Đọc `04-danh-gia.md`, gõ `duyet ...` |
| Merge / deploy / gửi tin cho khách / tiêu tiền | Agent không bao giờ tự làm | Bạn tự làm |

## File của mỗi vòng: `business/<slug>/vong-NN/`
`00-y-tuong.md` · `01-ke-hoach.md` · `san-pham/` · `02-thay-doi.md` · `03-ket-qua-test.md` · `test/` · `04-danh-gia.md` · `TRANG-THAI.md`. Nhật ký quyết định: `business/<slug>/NHAT-KY.md`. Vòng cũ giữ nguyên.
Sản phẩm đang ở đâu so với thiết kế: `docs/tien-do-theo-thiet-ke.md` (Review cập nhật cuối mỗi vòng, chỉ theo điều Test đã kiểm).

## Sản phẩm mới
1. Repo sản phẩm có trên GitHub, có file thiết kế (VD `docs/concept/01_Product_Design.md`).
2. Mở phiên Claude Code ở repo đó (cloud hoặc máy), nói:
   > Cài dây chuyền 4 agent: clone https://github.com/WH-Nhatnq/day-chuyen-4-agent vào thư mục tạm, chạy `bash <thư mục tạm>/scripts/cai-dat.sh .`, xoá thư mục tạm, commit và tạo PR.
3. Gộp PR. Mở phiên **mới** (agent chỉ được nạp khi phiên bắt đầu), gõ `/day-chuyen-khoi-tao <file thiết kế>`.
4. Bật một lần: GitHub repo → Settings → Actions → General → *Allow GitHub Actions to create and approve pull requests* (để Action đồng bộ tự mở PR).

## Cập nhật dây chuyền
- Sửa agent/lệnh/mẫu ở repo trung tâm `day-chuyen-4-agent` (một chỗ).
- Mỗi repo sản phẩm có Action *Đồng bộ dây chuyền 4 agent*: chạy mỗi thứ Hai, hoặc bấm *Run workflow* ở tab Actions → mở PR "Cập nhật dây chuyền 4 agent" → bạn Merge.
- Phiên cloud đang chạy dùng bản cũ cho tới khi mở phiên mới sau khi Merge.
- Repo đang dùng bản nào: xem `.claude/day-chuyen/PHIEN-BAN` (commit của repo trung tâm).
