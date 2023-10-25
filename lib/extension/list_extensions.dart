import 'package:nb_utils/nb_utils.dart';

// This Dart file defines an extension called StringExtension on List objects.
extension StringExtension on List {
  // This method groups the elements in the List by a specified key function.
  Map<T, List<S>> groupBy<S, T>(T Function(S) key) {
    // Create an empty map to store the grouped elements.
    Map<T, List<S>> map = <T, List<S>>{};

    // Iterate through the elements in the list.
    for (var element in this) {
      // Use the 'key' function to determine the grouping key for the element.
      T elementKey = key(element);

      // If the key does not exist in the map, initialize it with an empty list.
      // Then, add the element to the list associated with that key.
      (map[elementKey] ??= []).add(element);
    }

    // Return the map of grouped elements.
    return map;
  }

  // This getter checks if the List contains exactly one element.
  bool get isSingle => this.validate().length == 1;
}
