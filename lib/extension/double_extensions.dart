import 'package:nb_utils/nb_utils.dart';

extension numExtension on num {
  double asPercentageInDecimal() {
    return this.validate() / 100.0;
  }

  double calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) / 100.0;
  }
}

extension doubleExtension on double {
  double asPercentageInDecimal() {
    return this.validate() / 100.0;
  }

  double calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) / 100.0;
  }
}

extension intExtension on int {
  int asPercentageInDecimal() {
    return this.validate() ~/ 100.0;
  }

  int calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) ~/ 100;
  }
}
