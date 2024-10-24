import 'package:x_device_info_util/internal/check_platform.dart';
import 'package:x_device_info_util/types/platform.dart';

import 'internal/check_web.dart';

class XDeviceInfoUtil {
  /// Constructs an instance of [XDeviceInfoUtil].
  ///
  /// This constructor allows for the injection of custom instances of [ICheckWeb]
  /// and [ICheckPlatform], which are used to determine the environment the application
  /// is running on. If no instances are provided, it defaults to using [kCheckWeb]
  /// and [kCheckPlatform].
  const XDeviceInfoUtil(
      {this.checkWeb = kCheckWeb, this.checkPlatform = kCheckPlatform});

  final ICheckWeb checkWeb;
  final ICheckPlatform checkPlatform;

  /// Determines if the current platform is a web environment.
  ///
  /// This method uses the provided [checkWeb] instance to check if the
  /// application is running on a web platform. By default, it uses [kCheckWeb]
  /// if no other instance is provided.
  ///
  /// Returns `true` if the platform is web, otherwise `false`.
  bool isWeb() {
    return checkWeb.isWeb();
  }

  /// Determines the current platform the application is running on.
  ///
  /// This method checks the environment to identify the platform. It first
  /// checks if the application is running in a web environment using the
  /// [isWeb] method. If not, it checks the native platforms in the following
  /// order: Android, iOS, Windows, macOS, and Linux. If none of these platforms
  /// match, it throws an exception indicating an unsupported platform.
  ///
  /// Returns an [XPlatform] enum value representing the current platform.
  /// Throws an [Exception] if the platform is unsupported.
  XPlatform getPlatform() {
    if (isWeb()) {
      return XPlatform.web;
    } else if (checkPlatform.isAndroid()) {
      return XPlatform.android;
    } else if (checkPlatform.isIos()) {
      return XPlatform.ios;
    } else if (checkPlatform.isWindows()) {
      return XPlatform.windows;
    } else if (checkPlatform.isMacOS()) {
      return XPlatform.macos;
    } else if (checkPlatform.isLinux()) {
      return XPlatform.linux;
    } else {
      throw Exception('Unsupported platform');
    }
  }
}
