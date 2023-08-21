#ifndef FLUTTER_PLUGIN_AG_WIDGETS_PLUGIN_H_
#define FLUTTER_PLUGIN_AG_WIDGETS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace ag_widgets {

class AgWidgetsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AgWidgetsPlugin();

  virtual ~AgWidgetsPlugin();

  // Disallow copy and assign.
  AgWidgetsPlugin(const AgWidgetsPlugin&) = delete;
  AgWidgetsPlugin& operator=(const AgWidgetsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace ag_widgets

#endif  // FLUTTER_PLUGIN_AG_WIDGETS_PLUGIN_H_
