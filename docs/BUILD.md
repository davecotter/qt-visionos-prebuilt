# Building Qt for visionOS

Official reference: [Getting Started With Apple Vision Pro (Qt 6.11)](https://doc.qt.io/qt-6.11/qt3dxr-quick-start-guide-applevisionpro.html)

## Inputs

| Variable | Purpose |
|----------|---------|
| `QT_HOST` | macOS Qt 6.11.1 host (`qt-cmake`, `moc`, shader tools) |
| `QT_SRC` | Qt source tree with `configure` |
| `INSTALL_PREFIX` | Where built visionOS Qt is installed |

## Outputs

- `libQt6Quick3D*.dylib`, `libQt6Quick3DXr*.dylib`, QML imports under `qml/`
- `bin/qt-cmake` for generating Xcode projects

## Release publishing (maintainers)

1. Run both device and simulator scripts on a clean Mac with Xcode visionOS SDK.
2. Record git SHA of Qt tag, Xcode version, and `shasum -a 256` of tarball in `manifest.json` → `releases[]`.
3. Upload tarball to GitHub Releases; consumers set `CMAKE_PREFIX_PATH` to extracted prefix.

## Known limits

- Deploy **apps** via Xcode, not Qt Creator.
- Rebuild when Xcode visionOS SDK or Qt patch version changes.
