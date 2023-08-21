import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ag_widgets_method_channel.dart';

abstract class AgWidgetsPlatform extends PlatformInterface {
  /// Constructs a AgWidgetsPlatform.
  AgWidgetsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AgWidgetsPlatform _instance = MethodChannelAgWidgets();

  /// The default instance of [AgWidgetsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAgWidgets].
  static AgWidgetsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AgWidgetsPlatform] when
  /// they register themselves.
  static set instance(AgWidgetsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
