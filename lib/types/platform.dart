enum XPlatform {
  android,
  ios,
  web,
  windows,
  macos,
  linux,
}

extension XPlatformExtension on XPlatform {
  String toShortString() {
    return toString().split('.').last;
  }

  static XPlatform? fromString(String value) {
    try {
      return XPlatform.values.firstWhere(
        (e) => e.toShortString().toLowerCase() == value.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
