import 'package:mobx/mobx.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

part 'purchase_register_controller.g.dart';

class PurchaseRegisterController = _PurchaseRegisterController with _$PurchaseRegisterController;

abstract class _PurchaseRegisterController with Store {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  @observable
  int activeStep = 0; // Initial step set to 0.

  @observable
  int upperBound = 1; // upperBound MUST BE total number of icons minus 1.

  @observable
  String? storeName = '';

  @observable
  num? amount = 0.0;

  @observable
  DateTime? date = DateTime.now();

  @observable
  bool isLoading = false;

  @action
  void setStoreName(String? value) {
    storeName = value;
  }

  @action
  void setAmount(String? value) {
    num numValue = num.tryParse(value!) ?? 0;
    amount = numValue;
  }

  getFormattedAmount() {
    return MonetaryFormatterUtil.format(amount);
  }

  @action
  void setDate(DateTime? value) {
    date = value;
  }
}