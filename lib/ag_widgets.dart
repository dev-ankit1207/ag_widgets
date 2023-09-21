import 'ag_widgets_platform_interface.dart';

export 'package:ag_widgets/extension/string_extensions.dart';
export 'package:ag_widgets/utils.dart';

class AgWidgets {
  Future<String?> getPlatformVersion() {
    return AgWidgetsPlatform.instance.getPlatformVersion();
  }
}
