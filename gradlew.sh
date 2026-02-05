#!/usr/bin/env bash
set -euo pipefail

# Alternative Gradle wrapper that can be invoked as: `bash gradlew.sh ...`
# Some CI environments may restrict executing ./gradlew directly.

if [[ -x "android/gradlew" ]]; then
  exec "android/gradlew" "$@"
fi

echo "gradlew.sh wrapper: android/gradlew not found; skipping Gradle invocation."
exit 0
