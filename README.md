# qt-visionos-prebuilt

Community **prebuilt Qt 6.11.x for visionOS** (device + simulator), including **Qt Quick 3D / Qt Quick 3D Xr**.

Qt’s official installer does **not** ship visionOS binaries. This repo is the **source of truth** for:

- reproducible **source build scripts**
- versioned **manifests** (Qt version, SDK, checksums)
- published **release artifacts** (GitHub Releases) once CI or maintainers build them

## Status

| Artifact | State |
|----------|--------|
| Build scripts | Initial scaffold |
| Qt 6.11.1 device (`xros`) | Not published yet — run `scripts/build-visionos-device.sh` |
| Qt 6.11.1 simulator (`xrsimulator`) | Not published yet — run `scripts/build-visionos-simulator.sh` |

## Quick start (build locally)

Prerequisites:

- macOS, Apple Silicon
- Xcode with **visionOS SDK**
- Qt **host** at `/Users/davec/Developer/Qt/6.11.1/macos` (or set `QT_HOST`)
- Qt **sources** (MaintenanceTool **Sources** or clone tag `v6.11.1`)

```bash
export QT_HOST="$HOME/Developer/Qt/6.11.1/macos"
export QT_SRC="$HOME/Developer/Qt/6.11.0/Src"   # or your 6.11.1 tree

./scripts/build-visionos-device.sh
./scripts/build-visionos-simulator.sh
```

Install prefix defaults to `$REPO_ROOT/install/6.11.1/visionos-arm64` and `.../visionos-simulator-arm64`.

## Consuming from SOS / other apps

Point CMake at the built prefix:

```bash
export CMAKE_PREFIX_PATH="/path/to/qt-visionos-prebuilt/install/6.11.1/visionos-arm64"
/path/to/install/.../bin/qt-cmake -B build -S my_xr_app
open build/*.xcodeproj   # deploy with Xcode
```

See [docs/CONSUME.md](docs/CONSUME.md).

## Contributing

Improvements land here first (scripts, manifest bumps, release binaries). OpenWorld SOS links this repo from its implementation plan; it does **not** fork Qt — only documents and hosts builds.

## License

Scripts and docs: MIT. **Qt itself** remains under [Qt licensing](https://www.qt.io/licensing/).
