import 'package:nb_utils/nb_utils.dart';

extension NumExtension on num {
  double asPercentageInDecimal() {
    return this.validate() / 100.0;
  }

  double calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) / 100.0;
  }
}

extension DoubleExtension on double {
  double asPercentageInDecimal() {
    return this.validate() / 100.0;
  }

  double calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) / 100.0;
  }
}

extension IntExtension on int {
  int asPercentageInDecimal() {
    return this.validate() ~/ 100.0;
  }

  int calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) ~/ 100;
  }
}
