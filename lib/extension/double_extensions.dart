import 'package:nb_utils/nb_utils.dart';

extension doubleExtension on num {
  double asPercentageInDecimal() {
    return this.validate() / 100.0;
  }

  double calculatePercentageOf(double percentage) {
    return (this.validate() * percentage) / 100.0;
  }
}
