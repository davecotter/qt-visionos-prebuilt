#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QT_HOST="${QT_HOST:-/Users/davec/Developer/Qt/6.11.1/macos}"
QT_SRC="${QT_SRC:-/Users/davec/Developer/Qt/6.11.0/Src}"

if [[ ! -x "${QT_HOST}/bin/qt-cmake" && ! -d "${QT_HOST}/lib/cmake/Qt6" ]]; then
  echo "error: QT_HOST does not look like a Qt macOS host: ${QT_HOST}" >&2
  exit 1
fi

if [[ ! -f "${QT_SRC}/configure" ]]; then
  echo "error: QT_SRC missing configure: ${QT_SRC}" >&2
  echo "Install Qt Sources via MaintenanceTool or clone git://code.qt.io/qt/qt5.git tag v6.11.1" >&2
  exit 1
fi

build_qt_for_visionos() {
  local sdk="$1"
  local build_dir="$2"
  local install_prefix="$3"

  mkdir -p "${build_dir}"
  cd "${build_dir}"

  "${QT_SRC}/configure" \
    -qt-host-path "${QT_HOST}" \
    -platform macx-visionos-clang \
    -sdk "${sdk}" \
    -submodules qtquick3d \
    -prefix "${install_prefix}" \
    -release \
    -nomake examples \
    -nomake tests

  cmake --build . --parallel "$(sysctl -n hw.ncpu)"
  cmake --install .
}
