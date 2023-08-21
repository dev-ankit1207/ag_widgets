
import 'ag_widgets_platform_interface.dart';

class AgWidgets {
  Future<String?> getPlatformVersion() {
    return AgWidgetsPlatform.instance.getPlatformVersion();
  }
}
