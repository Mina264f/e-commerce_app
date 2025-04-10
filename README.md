# Ecommerce App Project Setup Guide

## Prerequisites
Before running this Flutter project, ensure you have the following installed:






### 1. Install Flutter
- Download Flutter SDK: [Flutter Official Website](https://flutter.dev/docs/get-started/install)
- Extract and set up the Flutter path:
  ```sh
  export PATH="$PATH:`pwd`/flutter/bin"
  ```
- Agree to Android licenses:
  ```sh
   flutter doctor --android-licenses
  ```




- Verify the installation:
  ```sh
  flutter doctor
  ```

### 2. Install Dependencies
- **Dart SDK** (comes with Flutter)
- **Android Studio or Xcode (for iOS development)**
- **Device Emulator or Physical Device**
- **VS Code or Android Studio**

## Project Setup

### 1. Clone the Repository
```sh
git clone <repository_url>
cd <project_folder>
```




### 2. Install Flutter Dependencies
```sh
flutter pub get
```



### 4. Run the Project
#### Run on Android:
```sh
flutter run 
```

#### Run on iOS:
```sh
cd ios && pod install && cd ..
flutter run 
```



## Packages Used in This Project
This project uses several Flutter packages to enhance functionality:

### UI & Animation
- `cupertino_icons`: Provides Cupertino-styled icons.

- `shimmer`: Adds shimmer loading effects.
- `carousel_slider`: Enables image sliders and carousels.

### State Management & Dependency Injection
- `bloc`: Implements BLoC state management.
- `flutter_bloc`: Integrates Flutter with BLoC.
- `bloc_test`: Provides test utilities for BLoC.
- `get_it`: Manages dependency injection.

### Localization & Internationalization
- `flutter_localizations`: Enables localization.
- `intl`: Provides internationalization utilities.

### Networking & Storage
- `dio`: Handles API requests efficiently.
- `shared_preferences`: Manages shared preferences.
- `cached_network_image`: Caches and displays network images.
- 






### Utilities & Logging
- `device_preview`: Provides device preview for responsive design.



## Additional Commands
- **Format Code:**
  ```sh
  flutter format .
  ```
- **Run Tests:**
  ```sh
  flutter test
  ```
- **Build APK:**
  ```sh
  flutter build apk --release
  ```
- **Build iOS App:**
  ```sh
  flutter build ios --release
  ```

## Troubleshooting
- **Check for missing dependencies:**
  ```sh
  flutter pub get
  ```
- **Fix CocoaPods issues (iOS):**
  ```sh
  cd ios && pod install && cd ..
  ```
- **Clean the project:**
  ```sh
  flutter clean && flutter pub get
  ```
![WhatsApp Image 2025-04-10 at 9 24 32 AM (1)](https://github.com/user-attachments/assets/a1a470ba-fca3-4db1-9b45-5300734b0e30)
![WhatsApp Imag![WhatsApp Image 2025-04-10 at 9 24 32 AM](https://github.com/user-attachments/assets/82505165-49ad-43c8-be5f-cc993362922c)
![WhatsApp Image 2025-04-10 at 9 24 32 AM (2)](https://github.com/user-attachments/assets/80075103-f132-42bc-b97b-627de4c5141d)
![WhatsApp Image 2025-04-10 at 9 24 32 AM (1)](https://github.com/user-attachments/assets/865a71ec-4dba-420a-892b-8fbf064436ec)
![WhatsApp Image 2025-04-10 at 9 24 32 AM (2)](https://github.com/user-attachments/assets/cbac79bd-06d4-4a61-9d23-8642c1531da5)
e 2025-04-10 at 9 24 32 AM](https://github.com/user-attachments/assets/60bc3e1a-2704-4533-ae33-b1c99eabb6d4)
![WhatsApp Image 2025-04-10 at 9 24 32 AM (1)](https://github.com/user-attachments/assets/1f0749b1-9207-4d89-872f-8e3d6a020024)
![WhatsApp Image 2025-04-10 at 9 24 32 AM](https://github.com/user-attachments/assets/e1fc12ec-3e6c-4745-ad2d-d0acdf71acbe)
![WhatsApp Image 2025-04-10 at 9 24 32 AM (2)](https://github.com/user-attachments/assets/fbbd81cf-30a4-4aea-bef2-761e616a7b77)


