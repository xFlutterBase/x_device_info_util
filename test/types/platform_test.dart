import 'package:flutter_test/flutter_test.dart';
import 'package:x_device_info_util/types/platform.dart';

void main() {
  group('XPlatform', () {
    test('toShortString returns correct string', () {
      expect(XPlatform.android.toShortString(), 'android');
      expect(XPlatform.ios.toShortString(), 'ios');
      expect(XPlatform.web.toShortString(), 'web');
      expect(XPlatform.windows.toShortString(), 'windows');
      expect(XPlatform.macos.toShortString(), 'macos');
      expect(XPlatform.linux.toShortString(), 'linux');
    });

    test('fromString returns correct XPlatform', () {
      expect(XPlatformExtension.fromString('android'), XPlatform.android);
      expect(XPlatformExtension.fromString('ios'), XPlatform.ios);
      expect(XPlatformExtension.fromString('web'), XPlatform.web);
      expect(XPlatformExtension.fromString('windows'), XPlatform.windows);
      expect(XPlatformExtension.fromString('macos'), XPlatform.macos);
      expect(XPlatformExtension.fromString('linux'), XPlatform.linux);
    });

    test('fromString is case insensitive', () {
      expect(XPlatformExtension.fromString('AnDrOiD'), XPlatform.android);
      expect(XPlatformExtension.fromString('IOS'), XPlatform.ios);
    });

    test('fromString returns null for invalid string', () {
      expect(XPlatformExtension.fromString('invalid'), isNull);
    });
  });
}
