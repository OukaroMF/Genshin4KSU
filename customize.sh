#!/bin/sh

OUTFD=$2  # For displaying messages

ui_print() {
  echo -n -e "ui_print $1\n" > /proc/self/fd/$OUTFD
  echo -n -e "ui_print\n" > /proc/self/fd/$OUTFD
}

APK_URL="https://github.com/OukaroMF/Genshin4KSU/releases/latest/download/ys.apk"
TMP_PATH="/data/local/tmp/ys.apk"

ui_print "[*] Downloading cloud Genshin APK..."

# Download APK
if ! curl -fL "$APK_URL" -o "$TMP_PATH" 2>/dev/null; then
  ui_print "[!] Download failed! Please check your network or the release URL."
  exit 1
fi

ui_print "[*] Download complete, starting installation..."

# Install APK
pm install -r "$TMP_PATH" >/dev/null 2>&1

if [ $? -eq 0 ]; then
  ui_print "[✓] Cloud Genshin installed successfully!"
  # Optionally remove the APK after installation
  rm -f "$TMP_PATH"
else
  ui_print "[!] Installation failed, maybe due to insufficient permissions or incompatible APK."
fi
