#!/usr/bin/env bash
set -euo pipefail

# This repository is primarily used for web preview (Vite/Expo web). Some CI/mobile analysis
# steps may try to run `./gradlew` from the repo root. If an Android project has been generated
# (via `expo prebuild --platform android`), delegate to `android/gradlew`. Otherwise, no-op.

if [[ -x "android/gradlew" ]]; then
  exec "android/gradlew" "$@"
fi

echo "gradlew wrapper: android/gradlew not found; skipping Gradle invocation."
exit 0
