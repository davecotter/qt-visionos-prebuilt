#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_common.sh"

INSTALL_PREFIX="${INSTALL_PREFIX:-${REPO_ROOT}/install/6.11.1/visionos-simulator-arm64}"
BUILD_DIR="${BUILD_DIR:-${REPO_ROOT}/build/visionos-arm64-xrsimulator}"

echo "Building Qt ${QT_SRC} for visionOS simulator (xrsimulator)"
echo "  host: ${QT_HOST}"
echo "  prefix: ${INSTALL_PREFIX}"

build_qt_for_visionos xrsimulator "${BUILD_DIR}" "${INSTALL_PREFIX}"

echo "Done. Add to CMAKE_PREFIX_PATH:"
echo "  export CMAKE_PREFIX_PATH=\"${INSTALL_PREFIX}\""
