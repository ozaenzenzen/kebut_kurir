#!/bin/bash

# build.sh

if [ -z "$2" ] || [ -z "$3" ]; then
  echo -e "Missing arguments: [release|debug|profile] [development|staging|prod]"
  # invalid arguments
  exit 128
fi

FILE=lib/main_$3.dart
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    FILE=lib/main.dart
    echo "$FILE does not exist. using lib/main.dart"
fi

DART_DEFINES=$(scripts/generate_dart_defines.sh $3)

if [ $? -ne 0 ]; then
  echo -e "Failed to generate dart defines"
  exit 1
fi

case "$1" in
"run") runtype="run"
;;
"apk") runtype="build apk --obfuscate --split-debug-info=./$3/debug"
;;
"appbundle") runtype="build appbundle --obfuscate --split-debug-info=./$3/debug"
;;
"ios") runtype="build ios --obfuscate --split-debug-info=./$3/debug"
;;
"ipa") runtype="build ipa --obfuscate --split-debug-info=./$3/debug"
;;
*)
  echo "Missing arguments [run|apk|appbundle|ios|ipa]"
  exit 1
;;
esac

echo -e "artifact: $1, type: $2, flavor: $3\n"
echo -e "DART_DEFINES: $DART_DEFINES\n"

echo -e "flutter $runtype $DART_DEFINES--$2 --flavor $3 --no-sound-null-safety --target $FILE"
flutter $runtype $DART_DEFINES--$2 --flavor $3 --no-sound-null-safety --target $FILE 
# adb install build/app/outputs/flutter-apk/app-$3-$2.apk
# eval "flutter $runtype --$2 --flavor $3 --target $FILE --no-sound-null-safety $DART_DEFINES" & 