import '../constants/strings.dart';

class Validators {
  static String? validateApplicationId(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return Strings.errFieldEmpty;
    }
    if (value.contains(RegExp(r'[^0-9]'))) {
      return Strings.errInvalidApplicationID;
    }
    if (value.length > 18) {
      return Strings.errApplicationIdTooLong;
    }
    if (value == Strings.egApplicationID.split(' ').last) {
      return Strings.errUseOfFakeId;
    }
    return null;
  }
}
