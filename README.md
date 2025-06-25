# e_commercial

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
├── core/                 # Các lớp và tiện ích dùng chung toàn app
│   ├── constants/        # Giá trị cố định: URL API, màu, padding...
│   ├── errors/           # Xử lý lỗi chung (AppException, Failure...)
│   ├── network/          # Setup Dio client, Interceptors, API base
│   └── utils/            # Hàm tiện ích chung (format tiền, validate...)
│
├── data/                 # Dữ liệu thô từ API, local
│   ├── models/           # Các model JSON (ProductModel, CartModel...)
│   ├── datasources/      # Nguồn dữ liệu: Remote (API), Local (Hive...)
│   └── repositories/     # Triển khai Repository: gọi API thật
│
├── domain/               # Logic nghiệp vụ thuần (không phụ thuộc Flutter)
│   ├── entities/         # Class định nghĩa bản chất dữ liệu (Product, User...)
│   ├── repositories/     # Interface trừu tượng (từ model nào, lấy gì)
│   └── usecases/         # Xử lý nghiệp vụ: GetCart, AddToWishlist...
│
├── presentation/         # UI - nơi người dùng tương tác
│   ├── pages/            # Mỗi màn hình chính (HomePage, ProductPage...)
│   ├── blocs/            # Bloc/Cubit và state/event cho mỗi màn
│   ├── widgets/          # Widget dùng lại nhiều lần (Card, Badge...)
│   └── routes/           # Cấu hình route (auto_route/go_router)
│
├── injection/            # Quản lý dependency (GetIt hoặc provider injection)
│
└── main.dart             # Entry point app (gọi App(), inject, runApp)