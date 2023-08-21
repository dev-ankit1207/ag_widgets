import 'package:flutter_test/flutter_test.dart';
import 'package:ag_widgets/ag_widgets.dart';
import 'package:ag_widgets/ag_widgets_platform_interface.dart';
import 'package:ag_widgets/ag_widgets_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAgWidgetsPlatform
    with MockPlatformInterfaceMixin
    implements AgWidgetsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AgWidgetsPlatform initialPlatform = AgWidgetsPlatform.instance;

  test('$MethodChannelAgWidgets is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAgWidgets>());
  });

  test('getPlatformVersion', () async {
    AgWidgets agWidgetsPlugin = AgWidgets();
    MockAgWidgetsPlatform fakePlatform = MockAgWidgetsPlatform();
    AgWidgetsPlatform.instance = fakePlatform;

    expect(await agWidgetsPlugin.getPlatformVersion(), '42');
  });
}
