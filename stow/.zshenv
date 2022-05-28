export JAVA_HOME='/usr/lib/jvm/java-8-openjdk/'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export WALLPAPER_DIR="$HOME/.wallpapers"

SECRET_FILE="$HOME/.secrets.sh"
if [[ -f $SECRET_FILE ]]; then
    source $SECRET_FILE
fi
