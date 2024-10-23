import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class DeviceInfoUtil {
  Future<String> getDeviceInfo(BuildContext context) async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (kIsWeb) {
        var webInfo = await deviceInfoPlugin.webBrowserInfo;
        return 'Web: ${webInfo.browserName}';
      } else if (Theme.of(context).platform == TargetPlatform.android) {
        var androidInfo = await deviceInfoPlugin.androidInfo;
        return 'Android: ${androidInfo.model}';
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        var iosInfo = await deviceInfoPlugin.iosInfo;
        return 'iOS: ${iosInfo.utsname.machine}';
      } else if (Theme.of(context).platform == TargetPlatform.macOS) {
        var macInfo = await deviceInfoPlugin.macOsInfo;
        return 'macOS: ${macInfo.model}';
      } else if (Theme.of(context).platform == TargetPlatform.windows) {
        var windowsInfo = await deviceInfoPlugin.windowsInfo;
        return 'Windows: ${windowsInfo.computerName}';
      } else if (Theme.of(context).platform == TargetPlatform.linux) {
        var linuxInfo = await deviceInfoPlugin.linuxInfo;
        return 'Linux: ${linuxInfo.name}';
      } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
        return 'Fuchsia: Not supported yet';
      } else {
        return 'Unknown platform';
      }
    } catch (e) {
      return 'Failed to get device info: $e';
    }
  }
}
