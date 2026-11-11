# Cấu hình – Dây chuyền 4 agent · [ĐIỀN tên sản phẩm]

Mọi agent đọc file này trước. Sửa ở đây = đổi hành vi cả dây chuyền **cho sản phẩm này**.
File này thuộc về sản phẩm: bản đồng bộ từ repo trung tâm `day-chuyen-4-agent` KHÔNG ghi đè nó.

## 1. Chạy
- **che_do_chay:** tung-lop
  - `tung-lop`: dừng sau MỖI lớp để bạn đọc và gõ `tiep` (dùng lúc mới làm quen).
  - `ca-chuoi`: chạy liền 4 lớp; chỉ dừng khi Kế hoạch có câu hỏi bỏ ngỏ, Test KHÔNG ĐẠT, hoặc tới cổng cuối.
- **notion_hub:** (để trống = không đẩy tóm tắt lên Notion; điền link trang Notion nhận tóm tắt mỗi vòng)
- **repo_github:** https://github.com/[ĐIỀN chủ]/[ĐIỀN repo] (dùng làm link trong tóm tắt)

## 1b. Thiết kế sản phẩm (nguồn chuẩn khi build)
- **Thiết kế:** `[ĐIỀN đường dẫn file thiết kế, VD docs/concept/01_Product_Design.md]` (v[ĐIỀN])
- **Bảng tiến độ:** `docs/tien-do-theo-thiet-ke.md`
- **Không dùng:** [ĐIỀN tài liệu không phải yêu cầu build, nếu có; để trống nếu không]
- Lệnh ngắn như "Làm P01" = làm đúng mục P01 trong thiết kế, tiêu chí nghiệm thu lấy nguyên văn từ thiết kế. Thiết kế đổi bản → sửa dòng trên.

## 2. Chủ thể & nguồn lực
- **Chủ thể:** [ĐIỀN: cá nhân / công ty]. Người quyết mọi cổng: [ĐIỀN, mặc định chính bạn].
- **Giờ/tuần cho business:** 6 giờ [ĐIỀN nếu khác]
- **Ngân sách tiền túi mỗi vòng:** tối đa 5.000.000 VND [ĐIỀN nếu khác]; vượt → cắt phạm vi trước.
- **Thời gian suy nghĩ** trước khi duyệt cổng có bỏ tiền (cổng 3, 4, 6): 24 giờ.
- [ĐIỀN giới hạn riêng, nếu có – VD không dùng dữ liệu của công ty nơi bạn làm việc]

## 3. Ngôn ngữ
- Nội bộ (kế hoạch, test, review): tiếng Việt.
- Tài liệu cho khách: [ĐIỀN ngôn ngữ], kèm bản tiếng Việt. Bản dịch máy ghi `[cần người bản xứ duyệt]`.

## 4. Thang bằng chứng
- **E0** AI suy luận, persona giả, ý kiến người làm, số ChatGPT ước tính → không tính
- **E1** dữ liệu bàn giấy có nguồn (nguồn công khai có link)
- **E2** khách thật kể về hành vi/quá khứ thật (phỏng vấn) – lời khen chung / "nếu có tôi mua" = E2 yếu
- **E3** khách thật cam kết phi tiền (để lại liên hệ, đặt chỗ không cọc, giới thiệu)
- **E4** khách thật trả tiền (cọc hoặc thanh toán)

## 5. Sáu giai đoạn & tiêu chí cổng (rút từ skill new-business-ca-nhan)
| GĐ | Câu hỏi cổng | Qua cổng khi |
|---|---|---|
| 1 Concept | Có đáng bỏ một sprint giờ + tiền không? | Khách mục tiêu rõ; vấn đề có dấu hiệu thật ≥ E1; lợi thế riêng rõ; kế hoạch sprint vừa giờ/tuần + ngân sách |
| 2 Sprint build & bán | Khách thật có muốn đúng thứ này, ở giá này? | ≥ 10 khách thật xem offer/demo; ≥ 3 cam kết (E3); giá không bị bác hoàn toàn. 5 lần chào không có cam kết → báo ngay |
| 3 Kế hoạch KD *(bỏ tiền)* | Bao lâu hoà vốn, lỗ tối đa bao nhiêu, khi nào dừng? | Số chính dựa trên bằng chứng ≥ E3; mức lỗ tối đa và điều kiện dừng rõ |
| 4 Build MVP *(bỏ tiền)* | Chạy với khách thật, giao đều được trong số giờ có? | Khách pilot dùng thật; quy trình giao vừa giờ/tuần |
| 5 Ra thị trường | Bán được cho khách mới với chi phí hợp lý? | ≥ 1–3 khách trả tiền (E4); biên dương |
| 6 Vận hành *(bỏ tiền)* | Tiếp tục, mở rộng hay dừng? | Doanh thu đều; thu nhập trên mỗi giờ bỏ ra đạt ngưỡng [ĐIỀN] |

## 6. Quyền của từng lớp
| Lớp | Được ghi | Không được |
|---|---|---|
| Kế hoạch | `01-ke-hoach.md` | code, deliverable |
| Thực thi | `san-pham/`, `02-thay-doi.md`, code trên nhánh `nb/...` | đổi kế hoạch/ngưỡng, deploy, push, merge, liên hệ khách |
| Test | `03-ket-qua-test.md`, `test/` | sửa code hay deliverable |
| Review | `04-danh-gia.md`, `docs/tien-do-theo-thiet-ke.md` (chỉ theo kết quả Test) | quyết định thay người dùng |
| Người dùng | quyết định cổng (`duyet`), merge, deploy, gửi tin cho khách, tiêu tiền | |
