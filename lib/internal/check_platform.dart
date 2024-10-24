// coverage:ignore-file
import 'dart:io';

abstract class ICheckPlatform {
  bool isAndroid();
  bool isIos();
  bool isWindows();
  bool isMacOS();
  bool isLinux();
}

class _CheckPlatform implements ICheckPlatform {
  const _CheckPlatform();

  @override
  bool isAndroid() {
    return Platform.isAndroid;
  }

  @override
  bool isIos() {
    return Platform.isIOS;
  }

  @override
  bool isWindows() {
    return Platform.isWindows;
  }

  @override
  bool isMacOS() {
    return Platform.isMacOS;
  }

  @override
  bool isLinux() {
    return Platform.isLinux;
  }
}

const kCheckPlatform = _CheckPlatform();
