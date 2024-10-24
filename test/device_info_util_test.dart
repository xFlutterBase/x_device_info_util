import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:x_device_info_util/device_info_util.dart';
import 'package:x_device_info_util/internal/check_web.dart';
import 'package:x_device_info_util/internal/check_platform.dart';
import 'package:x_device_info_util/types/platform.dart';

// Generate a MockCheckWeb class
@GenerateMocks([ICheckWeb, ICheckPlatform])
import 'device_info_util_test.mocks.dart';

void main() {
  group('DeviceInfoUtil', () {
    late MockICheckWeb mockCheckWeb;
    late MockICheckPlatform mockCheckPlatform;
    late XDeviceInfoUtil deviceInfoUtil;

    setUp(() {
      mockCheckWeb = MockICheckWeb();
      mockCheckPlatform = MockICheckPlatform();
      deviceInfoUtil = XDeviceInfoUtil(
          checkWeb: mockCheckWeb, checkPlatform: mockCheckPlatform);
      reset(mockCheckWeb);
      reset(mockCheckPlatform);

      when(mockCheckWeb.isWeb()).thenReturn(false);
      when(mockCheckPlatform.isAndroid()).thenReturn(false);
      when(mockCheckPlatform.isIos()).thenReturn(false);
      when(mockCheckPlatform.isWindows()).thenReturn(false);
      when(mockCheckPlatform.isMacOS()).thenReturn(false);
      when(mockCheckPlatform.isLinux()).thenReturn(false);
    });

    test('should return true when CheckWeb returns true', () {
      when(mockCheckWeb.isWeb()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.isWeb();

      // Assert
      expect(result, isTrue);
    });

    test('should return false when CheckWeb returns false', () {
      // Arrange
      when(mockCheckWeb.isWeb()).thenReturn(false);

      // Act
      final result = deviceInfoUtil.isWeb();

      // Assert
      expect(result, isFalse);
    });

    test('should return XPlatform.web when isWeb is true', () {
      // Arrange
      when(mockCheckWeb.isWeb()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.getPlatform();

      // Assert
      expect(result, XPlatform.web);
    });

    test('should return XPlatform.android when Platform is Android', () {
      // Arrange
      when(mockCheckWeb.isWeb()).thenReturn(false);
      when(mockCheckPlatform.isAndroid()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.getPlatform();

      // Assert
      expect(result, XPlatform.android);
    });

    test('should return XPlatform.ios when Platform is iOS', () {
      // Arrange
      when(mockCheckPlatform.isIos()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.getPlatform();

      // Assert
      expect(result, XPlatform.ios);
    });

    test('should return XPlatform.windows when Platform is Windows', () {
      // Arrange
      when(mockCheckPlatform.isWindows()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.getPlatform();

      // Assert
      expect(result, XPlatform.windows);
    });

    test('should return XPlatform.macos when Platform is MacOS', () {
      // Arrange
      when(mockCheckPlatform.isMacOS()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.getPlatform();

      // Assert
      expect(result, XPlatform.macos);
    });

    test('should return XPlatform.linux when Platform is Linux', () {
      // Arrange
      when(mockCheckPlatform.isLinux()).thenReturn(true);

      // Act
      final result = deviceInfoUtil.getPlatform();

      // Assert
      expect(result, XPlatform.linux);
    });

    // Add similar tests for Windows, MacOS, and Linux
  });
}
