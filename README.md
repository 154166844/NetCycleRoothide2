# NetCycle RootHide 1.1.0

NetCycle is a RootHide/Theos project for iOS 16.x.

Target:
- iPhone 14 Pro Max / iOS 16.6 / Relaxin RootHide
- iPhone X / iOS 16.7.1 / Dopamine RootHide
- THEOS_PACKAGE_SCHEME=roothide
- arm64 / arm64e

Planned behavior:
- Independent Wi-Fi and Bluetooth schedules
- ON / OFF / TOGGLE actions
- Interval: 1–365 days
- Specific date/time
- Persistent settings:
  /var/mobile/Library/Preferences/com.zengweihong.netcycle.plist
- Lightweight scheduler, checking at most every 5 minutes
- Next execution is calculated from the original schedule rather than from the actual execution time

Project layout:
- daemon/       scheduler implementation
- settings/     simple UIKit settings app
- LaunchDaemon/ launchd plist
- debian/       package metadata
- entitlements/ RootHide entitlements
- scripts/      build/install helpers

Important:
This is a source package. Building requires a working Theos/RootHide toolchain.
The Wi-Fi/Bluetooth control layer is isolated in DeviceControl.m so it can be
adapted to the exact private API symbols available on the target iOS build.
