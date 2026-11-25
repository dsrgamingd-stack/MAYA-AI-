#!/data/data/com.termux/files/usr/bin/bash
# MAYA AI - Termux debug APK build helper
set -Eeuo pipefail
cd "$(dirname "$0")"

echo "== MAYA AI build =="
DOWNLOAD="/storage/emulated/0/Download"
if [ ! -d "$DOWNLOAD" ]; then
  echo "पहले चलाएँ: termux-setup-storage और Storage permission Allow करें।"
  exit 1
fi

if ! command -v java >/dev/null 2>&1; then
  pkg install -y openjdk-17
fi
JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2; exit}')
case "$JAVA_VERSION" in
  17*|21*) ;;
  *) echo "JDK 17 चाहिए; मिला: ${JAVA_VERSION:-unknown}. Termux में openjdk-17 चुनें."; exit 1 ;;
esac

SDK="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$PREFIX/opt/Android/sdk}}"
if [ ! -d "$SDK/platforms/android-35" ]; then
  echo "Android SDK Platform 35 नहीं मिला: $SDK/platforms/android-35"
  echo "Android SDK environment पहले सेट करें (android_env_bash.sh के निर्देश देखें)।"
  exit 1
fi
if [ ! -x "$PREFIX/bin/aapt2" ]; then
  pkg install -y aapt2
fi
if ! command -v gradle >/dev/null 2>&1; then
  echo "Gradle नहीं मिला। चलाएँ: pkg install gradle"
  exit 1
fi
GRADLE_VERSION=$(gradle --version 2>/dev/null | awk '/^Gradle / {print $2; exit}')
case "$GRADLE_VERSION" in
  8.*) ;;
  *) echo "इस प्रोजेक्ट के AGP 8.7.3 के लिए Gradle 8.x चाहिए; मिला: ${GRADLE_VERSION:-unknown}."; exit 1 ;;
esac

if [ -d "$SDK/build-tools" ]; then
  if ! find "$SDK/build-tools" -mindepth 1 -maxdepth 1 -type d | grep -q .; then
    echo "Android Build Tools नहीं मिले। SDK में build-tools install करें."
    exit 1
  fi
fi

echo "sdk.dir=$SDK" > local.properties
if ! grep -q '^android.aapt2FromMavenOverride=' gradle.properties; then
  printf '\nandroid.aapt2FromMavenOverride=%s\n' "$PREFIX/bin/aapt2" >> gradle.properties
fi

echo "Gradle: $GRADLE_VERSION | Java: $JAVA_VERSION | SDK: $SDK"
gradle --no-daemon clean assembleDebug
APK="app/build/outputs/apk/debug/app-debug.apk"
if [ ! -s "$APK" ]; then
  echo "Build command सफल दिखी, लेकिन APK नहीं मिली: $APK"
  exit 1
fi
mkdir -p "$DOWNLOAD"
cp "$APK" "$DOWNLOAD/MayaAI-debug.apk"
echo "APK तैयार: Download/MayaAI-debug.apk"
if command -v termux-open >/dev/null 2>&1; then
  termux-open "$DOWNLOAD/MayaAI-debug.apk" || true
fi
