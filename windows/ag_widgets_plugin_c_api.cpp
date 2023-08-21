#include "include/ag_widgets/ag_widgets_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "ag_widgets_plugin.h"

void AgWidgetsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  ag_widgets::AgWidgetsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
