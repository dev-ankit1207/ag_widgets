import 'package:nb_utils/nb_utils.dart';

// This Dart file defines an extension called StringExtension on List objects.
extension ListExtension<T> on List<T> {
  // This method groups the elements in the List by a specified key function.
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    return fold(
      <K, List<T>>{},
      (Map<K, List<T>> map, T element) {
        return map..putIfAbsent(keyFunction(element), () => <T>[]).add(element);
      },
    );
  }

  // This getter checks if the List contains exactly one element.
  bool get isSingle => this.validate().length == 1;
}
