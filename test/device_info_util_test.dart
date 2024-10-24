import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:x_device_info_util/device_info_util.dart';
import 'package:x_device_info_util/internal/check_web.dart';

// Generate a MockCheckWeb class
@GenerateMocks([ICheckWeb])
import 'device_info_util_test.mocks.dart';

void main() {
  group('DeviceInfoUtil', () {
    test('should return true when CheckWeb returns true', () {
      // Arrange
      final mockCheckWeb = MockICheckWeb();
      when(mockCheckWeb.isWeb()).thenReturn(true);

      final deviceInfoUtil = XDeviceInfoUtil(checkWeb: mockCheckWeb);

      // Act
      final result = deviceInfoUtil.isWeb();

      // Assert
      expect(result, isTrue);
    });

    test('should return false when CheckWeb returns false', () {
      // Arrange
      final mockCheckWeb = MockICheckWeb();
      when(mockCheckWeb.isWeb()).thenReturn(false);

      final deviceInfoUtil = XDeviceInfoUtil(checkWeb: mockCheckWeb);

      // Act
      final result = deviceInfoUtil.isWeb();

      // Assert
      expect(result, isFalse);
    });
  });
}
