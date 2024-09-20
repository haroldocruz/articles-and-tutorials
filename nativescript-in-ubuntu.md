## How to Setting up Linux for NativeScript

```sh
sudo apt update

# On Ubuntu 20.04, we used the following command to install latest node
$ curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
$ sudo apt install -y nodejs

# On Ubuntu 20.04, we used the following command to install OpenJDK 17
sudo apt install -y openjdk-21-jdk
```

## How to Install Android SDK and Command-Line Tools on Ubuntu Without Android Studio

```sh
echo 'Step 1: Update Your Package List'
sudo apt update

echo 'Step 2: Install Required Dependencies'
sudo apt install -y unzip wget

echo 'Step 3: Download the Latest Command-Line Tools'
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O commandlinetools.zip

echo 'Step 4: Create a Directory for the Android SDK'
mkdir -p ~/Android/Sdk/cmdline-tools

echo 'Step 5: Unzip the Downloaded Command-Line Tools'
unzip commandlinetools.zip -d ~/Android/Sdk/cmdline-tools

echo 'Step 6: Rename the Unzipped Folder'
mv ~/Android/Sdk/cmdline-tools/cmdline-tools ~/Android/Sdk/cmdline-tools/latest

echo 'Step 7: Add the Android SDK and Command-Line Tools to Your PATH'
echo '\n' >> ~/.zshrc
echo 'export ANDROID_SDK_ROOT=$HOME/Android/Sdk' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools' >> ~/.zshrc

echo 'Step 8: Apply the Changes'
source ~/.zshrc

echo 'Step 9: Verify the Installation'
sdkmanager --version

echo 'Step 10: Install Essential SDK Packages'
sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"
```

Install ADB
```sh
sudo apt update
sudo apt install -y android-tools-adb android-tools-fastboot
```