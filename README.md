# Developer Guide

## Getting Started with Flutter

### Prerequisites
Before setting up Flutter, make sure you have the following installed:
- **Git**: Required for version control. You can download it from [here](https://git-scm.com/).
- **Android Studio** (or Visual Studio Code): Used for Flutter development. Download [here](https://developer.android.com/studio).
- **Android SDK**: Comes with Android Studio.

### Installing Flutter

1. Open **Android Studio** or **Visual Studio Code**.
2. Install the **Flutter** extension:
   - In **Android Studio**:
     - Go to `File > Settings > Plugins`.
     - Search for **Flutter** and install it (this will also install the **Dart** plugin).
     - Restart **Android Studio** after the installation.
   - In **Visual Studio Code (VS Code)**:
     - Open the **Extensions** view by clicking on the Extensions icon or pressing `Ctrl+Shift+X`.
     - Search for **Flutter** and install the extension (this will also install the **Dart** extension).
     - Restart **VS Code** after the installation.

3. Once the extension is installed, the Flutter SDK will be automatically downloaded and configured by the IDE.

4. Verify the installation by running the following command in the terminal:
   ```bash
   flutter doctor
  
### Setting up the Development Environment

1. **Ensure Android SDK is Configured**

   If you're using **Android Studio**, follow these steps to ensure that the Android SDK is configured:

   1. Open **Android Studio**.
   2. Go to `File > Settings > Appearance & Behavior > System Settings > Android SDK`.
   3. In the **SDK Platforms** tab, make sure the **Android API** levels you need are installed (at least the latest one).
   4. In the **SDK Tools** tab, ensure that **Android SDK Build-Tools**, **Android Emulator**, **Android SDK Platform-Tools**, and **Google Play Services** are installed.
   5. Click **Apply** to save any changes you make.

2. **Set Up a Physical or Virtual Device (Emulator)**

   You can run Flutter apps on either a physical Android device or an Android emulator:

   - **Physical Device**:
     1. Connect your Android device to your computer via USB.
     2. Enable **Developer Options** and **USB Debugging** on your Android device:
        - Open your device's `Settings` app.
        - Scroll down to `About phone` and tap it.
        - Find **Build number** and tap it 7 times to enable **Developer Options**.
        - Go back to the main settings screen, scroll down and tap **Developer Options**.
        - Enable **USB Debugging**.
     3. Your physical device should now be visible in the IDE for running Flutter projects.

   - **Emulator**:
     1. In **Android Studio**, go to `Tools > AVD Manager`.
     2. Click **Create Virtual Device** and choose a device model (e.g., Pixel 4).
     3. Select a system image for the Android version (preferably the latest stable one).
     4. Follow the instructions to create the emulator.
     5. Once the virtual device is created, click the **Play** button to start the emulator.

3. **Verify Flutter Setup with `flutter doctor`**

   After setting up the IDE, plugins, and Android SDK, run the following command to check the complete setup:

    ```bash
   flutter doctor
    ```
   This command will show if any part of the setup is incomplete or missing (e.g., Android licenses, device issues, etc.). Follow the instructions given by **flutter doctor** to resolve any issues.

4. **Accept Android Licenses (if necessary)**
       
    If you encounter a message about unaccepted Android licenses, run the following command to accept them:
    
    ```bash
    flutter doctor --android-licenses
    ```
    Follow the prompts to review and accept all necessary licenses.
## Running the App

  Once everything is set up, you can run the Flutter app using the following command:
  
  ```bash
  flutter run
  ```
  You can check your emulators using following command:
  
  ```bash
  flutter emulators
  ```
## Forking the Repository

1. Navigate to the GitHub repository you want to contribute to.
2. In the top-right corner, click the **Fork** button. This creates a copy of the repository under your GitHub account.

## Cloning the Repository

1. Go to your forked repository (which will be under your account).
2. Click the **Code** button and copy the repository URL.
3. In your terminal, navigate to the directory where you want to clone the repository.
4. Run the following command:

    ```bash
    git clone https://github.com/Edukasas/DeelayV2.git
    ```
5. Navigate to the project directory:
   
     ```bash
     cd DeelayV2
    ```
## Setting Up a Branch

1. Before making changes, create a new branch for your work:
     ```bash
     git checkout -b feature/your-branch-name
    ```
## Submitting a Pull Request

After pushing to your local repository,
go to forked repository in Github and click the **Compare & pull** request button.