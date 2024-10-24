import 'internal/check_web.dart';

class XDeviceInfoUtil {
  /// Constructs an instance of [XDeviceInfoUtil].
  ///
  /// This constructor allows for the injection of a custom [checkWeb] instance,
  /// which is used to determine if the application is running in a web environment.
  /// If no instance is provided, it defaults to using [kCheckWeb].
  const XDeviceInfoUtil({this.checkWeb = kCheckWeb});

  final ICheckWeb checkWeb;

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
}
