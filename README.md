# x_device_info_util

`x_device_info_util` là một gói Flutter giúp bạn dễ dàng lấy thông tin thiết bị trên nhiều nền tảng khác nhau, bao gồm Android, iOS, web, macOS, Windows, Linux, và Fuchsia.

## Features

- Lấy thông tin trình duyệt trên web.
- Lấy thông tin thiết bị trên Android, iOS, macOS, Windows, và Linux.

## Getting started

Để bắt đầu sử dụng gói này, bạn cần đảm bảo rằng dự án của bạn đang sử dụng Flutter phiên bản 3.24.0 hoặc cao hơn.

## Usage
| Loại Class       | Functions                          |
|------------------|------------------------------------|
| XPlatform        | - android                          |
|                  | - ios                              |
|                  | - web                              |
|                  | - windows                          |
|                  | - macos                            |
|                  | - linux                            |
| XDeviceInfoUtil  | - isWeb(): bool                    |
|                  | - getPlatform(): XPlatform         |
