import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ag_widgets_platform_interface.dart';

/// An implementation of [AgWidgetsPlatform] that uses method channels.
class MethodChannelAgWidgets extends AgWidgetsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ag_widgets');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
