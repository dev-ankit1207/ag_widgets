extension DurationExtensions on Duration {
  /// If we pass the date time then it will append to that particular date.
  /// If we not pass the datetime then it will only return the time with the dummy date i.e(2023.0.0)
  DateTime toDatetimeFromDuration({DateTime? dateTime}) {
    if (dateTime != null) {
      return DateTime(dateTime.year, dateTime.month, dateTime.day).add(this);
    }
    return DateTime(DateTime.now().year).add(this);
  }
}
