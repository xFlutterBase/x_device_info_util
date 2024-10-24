// coverage:ignore-file
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class ICheckWeb {
  bool isWeb();
}

class _CheckWeb implements ICheckWeb {
  const _CheckWeb();

  @override
  bool isWeb() {
    return kIsWeb;
  }
}

const kCheckWeb = _CheckWeb();
