import 'package:nb_utils/nb_utils.dart';

extension StringExtension on List {
  Map<T, List<S>> groupBy<S, T>(T Function(S) key) {
    Map<T, List<S>> map = <T, List<S>>{};
    for (var element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }

  bool get isSingle => this.validate().length == 1;
}
