# Consuming prebuilt visionOS Qt

## OpenWorld SOS

Vision Pro **high-immersion** path may use:

1. **Native Swift + RealityKit** for room scan/view/splats (primary UX), **or**
2. **Qt Quick 3D Xr** built from this repo when shared QML with Quest is worth the tradeoff.

Either way, **`sos-core`** stays shared via C API.

## CMake

```bash
export CMAKE_PREFIX_PATH="/path/to/qt-visionos-prebuilt/install/6.11.1/visionos-arm64"
qt-cmake -B build-vision -S platforms/qt-xr/SOSVision
open build-vision/*.xcodeproj
```

## Version lock

Match `manifest.json` `qt_version` to the OpenWorld spec Part 12 pin.
