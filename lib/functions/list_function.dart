@deprecated
List<T> getRemovedItems<T>(List<T> list1, List<T> list2) {
  Set<T> set1 = Set<T>.from(list1);
  Set<T> set2 = Set<T>.from(list2);

  Set<T> removedItems = set1.difference(set2);
  return removedItems.toList();
}

@deprecated
List<T> getNewItems<T>(List<T> list1, List<T> list2) {
  Set<T> set1 = Set<T>.from(list1);
  Set<T> set2 = Set<T>.from(list2);

  Set<T> newItemsInList1 = set1.difference(set2);
  Set<T> newItemsInList2 = set2.difference(set1);

  Set<T> newItems = {...newItemsInList1, ...newItemsInList2};
  return newItems.toList();
}
