wget https://raw.githubusercontent.com/mattgonewild/init/master/user-dirs -O ~/.config/user-dirs.dirs
wget https://raw.githubusercontent.com/mattgonewild/init/master/bashrc -O ~/.bashrc

source ~/.bashrc

rm -rf ~/Downloads ~/Desktop ~/Documents ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

mkdir -p ~/downloads ~/desktop ~/documents ~/music ~/pictures ~/public ~/templates ~/videos ~/android/cmdline-tools ~/go/src ~/tmp

cd ~/downloads

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.8-stable.tar.xz
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip

cd ~

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf check-update
dnf install -y vim go tldr code clang cmake ninja-build gtk3-devel gh downloads/*

tar xf ~/downloads/flutter_linux_3.16.8-stable.tar.xz
unzip ~/downloads/commandlinetools-linux-11076708_latest.zip -d ~/android/cmdline-tools
mv ~/android/cmdline-tools/cmdline-tools ~/android/cmdline-tools/latest

sdkmanager "platform-tools" "build-tools;34.0.0" "platforms;android-34"

echo "run sdkmanager --licenses, flutter precache, flutter upgrade, flutter config --android-sdk ~/android"
echo "dart --config --no-analytics; flutter --config --no-analytics (if you want)"
echo "gh auth login"
echo 'git config --global user.name "Matt W."'
echo 'git config --global user.email "human@mattgonewild.com"'
echo "https://github.com/protocolbuffers/protobuf/releases/latest"
echo "go install google.golang.org/protobuf/cmd/protoc-gen-go@latest"
echo "go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest"
echo "dart pub global activate protoc_plugin"
