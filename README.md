# Profile Listing App

## Overview
This Flutter application allows users to manage profiles with the following features:
- **Profile Listing View**:
  - Sync data from an API.
  - Swipe to perform actions (edit/delete) in the UI.
  - Delete a profile.
  - Show a favorite listing.
  - Filter (search) through the profile list.
  - Open the email app when clicking the [Send Email] button.
- **Profile Detail View**:
  - Mark/unmark a profile as a favorite.
- **Manage Profile View**:
  - Edit or delete a profile.

All data is stored in **persistent storage** to ensure it persists across app sessions.

---

## Prerequisites
Before running the app, ensure the following are installed on your system:

### For Android:
1. **Flutter SDK**: Install Flutter by following the [official installation guide](https://flutter.dev/docs/get-started/install).
2. **Android Studio**:
   - Install Android Studio and set up the Android SDK.
   - Enable USB debugging on your Android device or use an emulator.
3. **ADB**: Ensure `adb` (Android Debug Bridge) is installed and added to your system's PATH.

### For iOS:
1. **Flutter SDK**: Install Flutter by following the [official installation guide](https://flutter.dev/docs/get-started/install).
2. **Xcode**:
   - Install Xcode from the Mac App Store.
   - Set up a simulator or connect a physical iOS device.
3. **CocoaPods**: Install CocoaPods using `sudo gem install cocoapods`.

---

## Installation

### Step 1: Clone the Repository
Clone the project repository to your local machine:
```bash
git clone https://github.com/your-repo/profile-listing.git
cd profile-listing

### Step 2: Install Dependencies
flutter pub get

---

## Running the App

### For Android:
1. Connect an Android device or start an emulator.
2. Run the app using the following command:
    flutter run
3. Alternatively, build the APK for release:
    flutter build apk --release
4. Install the APK on your device:
    adb install build/app/outputs/flutter-apk/app-release.apk

### For iOS:
1. Open the project in Xcode:
    open ios/Runner.xcworkspace
2. Select a simulator or connect a physical device in Xcode.
3. Run the app using Flutter:
    flutter run
4. Alternatively, build the app for release:
    flutter build ipa --release