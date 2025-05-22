#!/bin/sh

OUTFD=$2  # 显示信息用

ui_print() {
  echo -n -e "ui_print $1\n" > /proc/self/fd/$OUTFD
  echo -n -e "ui_print\n" > /proc/self/fd/$OUTFD
}

APK_PATH="$MODPATH/ys.apk"

ui_print "[*] installing cloud Genshin..."

if [ ! -f "$APK_PATH" ]; then
  ui_print "[!] app not found, please check the file path."
  exit 1
fi

pm install -r "$APK_PATH" 2>/dev/null

if [ $? -eq 0 ]; then
  ui_print "[+] Enjoy your cloud Genshin!"
else
  ui_print "[!] Failed to install the app."
fi
