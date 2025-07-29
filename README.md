# Hướng dẫn cài đặt ứng dụng Kiosk HCC v1.0
<img width="2872" height="1352" alt="image" src="https://github.com/user-attachments/assets/426ce5cd-b6b6-4c97-83b7-608172b2f9ca" />

<img width="2856" height="1344" alt="image" src="https://github.com/user-attachments/assets/ff4d0ca6-47e2-415e-b07c-e3530c5bd062" />

## 1. Cài đặt Python 3.13.x trên Windows

### Bước 1: Tải Python
- Truy cập trang chính thức của Python: [https://www.python.org/downloads/](https://www.python.org/downloads/)
- Chọn phiên bản Python 3.13.x mới nhất (ví dụ: Python 3.13.0) và tải file cài đặt `.exe` cho Windows (64-bit hoặc 32-bit tùy thuộc vào hệ thống của bạn).

### Bước 2: Cài đặt Python
- Chạy file `.exe` vừa tải về bằng cách nhấp đúp chuột.
- **Quan trọng**: Đánh dấu chọn **"Add Python 3.13 to PATH"** để có thể chạy lệnh `python` từ Command Prompt hoặc PowerShell.
- Nhấp vào **Install Now** để bắt đầu cài đặt. Nếu muốn thay đổi thư mục cài đặt, chọn **Customize installation**.
- Chờ quá trình cài đặt hoàn tất, sau đó nhấp **Close**.

### Bước 3: Kiểm tra cài đặt
- Mở Command Prompt (nhấn `Win + R`, gõ `cmd`, nhấn Enter).
- Gõ lệnh:
  ```
  python --version
  ```
- Nếu hiển thị phiên bản Python (ví dụ: `Python 3.13.0`), cài đặt đã thành công.[](https://kb.pavietnam.vn/huong-dan-cai-dat-python-3-tren-windows.html)

## 2. Mở Rule Firewall Port 8008

### Bước 1: Mở Windows Defender Firewall
- Nhấn `Win + S`, gõ **Windows Defender Firewall**, và chọn **Windows Defender Firewall with Advanced Security**.

### Bước 2: Tạo Rule mới
- Trong cửa sổ **Windows Defender Firewall with Advanced Security**, chọn **Inbound Rules** ở menu bên trái.
- Nhấp vào **New Rule** ở phía bên phải.
- Chọn **Port** > **Next**.
- Chọn **TCP**, nhập **8008** vào ô **Specific local ports** > **Next**.
- Chọn **Allow the connection** > **Next**.
- Đánh dấu chọn tất cả các tùy chọn (**Domain**, **Private**, **Public**) > **Next**.
- Đặt tên cho rule, ví dụ: **Kiosk HCC Port 8008**, và mô tả (tùy chọn) > **Finish**.

### Bước 3: Kiểm tra Rule
- Trong danh sách **Inbound Rules**, đảm bảo rule vừa tạo xuất hiện và được kích hoạt (biểu tượng màu xanh).

## 3. Cài đặt thư viện từ file requirements.txt

### Bước 1: Chuẩn bị file requirements.txt
- Đảm bảo bạn có file `requirements.txt` trong thư mục dự án của ứng dụng Kiosk HCC. File này chứa danh sách các thư viện cần thiết (ví dụ: `flask`, `gunicorn`, v.v.).

### Bước 2: Cài đặt các thư viện
- Mở Command Prompt và điều hướng đến thư mục chứa file `requirements.txt` bằng lệnh:
  ```
  cd đường_dẫn_thư_mục_dự_án
  ```
- Chạy lệnh sau để cài đặt các thư viện:
  ```
  pip install -r requirements.txt
  ```
- Đợi quá trình cài đặt hoàn tất. Nếu gặp lỗi thiếu module, hãy kiểm tra lại file `requirements.txt` hoặc chạy lệnh:
  ```
  pip install ten_thu_vien
  ```
  để cài đặt từng thư viện cụ thể (thay `ten_thu_vien` bằng tên thư viện).[](https://lucidgen.com/cach-chay-file-python-tren-cmd-va-mac/)

## 4. Mở cổng Modem NAT Port

### Bước 1: Truy cập giao diện quản trị Modem
- Mở trình duyệt và nhập địa chỉ IP của modem (thường là `192.168.0.1` hoặc `192.168.1.1`). Kiểm tra mặt sau modem hoặc tài liệu hướng dẫn để biết chính xác địa chỉ IP.
- Đăng nhập bằng tên người dùng và mật khẩu (mặc định thường là `admin`/`admin` hoặc `admin`/`password`, nếu chưa thay đổi).

### Bước 2: Cấu hình NAT Port Forwarding
- Tìm mục **Port Forwarding**, **Virtual Server**, hoặc **NAT** trong giao diện quản trị.
- Thêm một rule mới:
  - **Protocol**: Chọn **TCP** hoặc **TCP/UDP**.
  - **External Port**: Nhập **8008**.
  - **Internal Port**: Nhập **8008**.
  - **Internal IP Address**: Nhập địa chỉ IP của máy tính chạy ứng dụng Kiosk HCC (gõ `ipconfig` trong Command Prompt để kiểm tra).
- Lưu cài đặt và khởi động lại modem nếu được yêu cầu.

### Bước 3: Kiểm tra cổng
- Sử dụng công cụ như [canyouseeme.org](https://canyouseeme.org/) để kiểm tra xem cổng 8008 đã được mở thành công chưa.

## 5. Đăng ký tên miền DynDNS miễn phí

### Bước 1: Tạo tài khoản DynDNS
- Truy cập trang web của một nhà cung cấp DynDNS miễn phí như [No-IP](https://www.noip.com/) hoặc [DynDNS](https://dyn.com/).
- Đăng ký tài khoản bằng email và tạo mật khẩu.

### Bước 2: Tạo hostname
- Sau khi đăng nhập, chọn **Create Hostname**.
- Nhập tên miền mong muốn (ví dụ: `kioskhcc.ddns.net`) và chọn một trong các domain miễn phí được cung cấp.
- Liên kết hostname với địa chỉ IP công cộng của bạn (kiểm tra IP công cộng tại [whatismyipaddress.com](https://whatismyipaddress.com/)).
- Lưu cấu hình.

### Bước 3: Cài đặt Dynamic DNS Client
- Tải xuống và cài đặt ứng dụng Dynamic DNS Client từ nhà cung cấp (ví dụ: No-IP DUC).
- Đăng nhập vào ứng dụng và đảm bảo nó chạy nền để cập nhật IP động của bạn.

## 6. Khởi chạy ứng dụng bằng file start_app

### Bước 1: Chuẩn bị file start_app
- Đảm bảo bạn có file `start_app.py` trong thư mục dự án của ứng dụng Kiosk HCC. File này thường chứa mã để khởi chạy ứng dụng Flask, ví dụ:
  ```python
  from flask import Flask
  app = Flask(__name__)

  @app.route('/')
  def home():
      return 'Chào mừng đến với Kiosk HCC!'

  if __name__ == '__main__':
      app.run(host='0.0.0.0', port=8008)
  ```

### Bước 2: Chạy ứng dụng
- Mở Command Prompt và điều hướng đến thư mục dự án:
  ```
  cd đường_dẫn_thư_mục_dự_án
  ```
- Chạy file `start_app.py` bằng lệnh:
  ```
  python start_app.py
  ```
- Nếu thành công, bạn sẽ thấy thông báo Flask đang chạy trên `http://0.0.0.0:8008`.

### Bước 3: Kiểm tra ứng dụng
- Mở trình duyệt và truy cập `http://localhost:8008` để kiểm tra ứng dụng trên máy cục bộ.
- Nếu đã mở cổng và đăng ký DynDNS, truy cập qua tên miền (ví dụ: `http://kioskhcc.ddns.net:8008`) từ mạng bên ngoài.

## Lưu ý
- Đảm bảo máy tính của bạn luôn chạy để ứng dụng Flask hoạt động liên tục. Để triển khai lâu dài, cân nhắc sử dụng dịch vụ hosting như Heroku hoặc VPS.[](https://pymi.vn/blog/python-free-host/)
- Nếu gặp lỗi, kiểm tra lại các bước cài đặt, firewall, và cấu hình modem. Bạn cũng có thể tìm thêm thông tin từ cộng đồng Python hoặc tài liệu chính thức.
