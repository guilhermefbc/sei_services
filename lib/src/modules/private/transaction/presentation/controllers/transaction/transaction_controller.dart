import 'package:mobx/mobx.dart';
import 'package:sei_services/src/modules/private/transaction/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';

part 'transaction_controller.g.dart';

class TransactionController = _TransactionController
    with _$TransactionController;

abstract class _TransactionController with Store {
  List<TransactionEntity> transactions = ObservableList<TransactionEntity>();
  List<TransactionEntity> filteredTransactions =
      ObservableList<TransactionEntity>();

  @observable
  int tabIndex = 0;

  @action
  void addTransactions(List<TransactionEntity> values) {
    transactions.clear();
    transactions.addAll(values);
  }

  @action
  void addFilteredTransactions(List<TransactionEntity> values) {
    filteredTransactions.clear();
    filteredTransactions.addAll(values);
  }

  @computed
  double get filteredTransactionsTotal {
    if (filteredTransactions.toList().isEmpty) {
      return 0;
    }
    List<double> amounts = filteredTransactions
        .toList()
        .map((transaction) => transaction.transactionAmount)
        .toList();
    return amounts.reduce((value, element) => value + element);
  }

  @computed
  double get filteredTransactionsTaxesTotal {
    if (filteredTransactions.isEmpty) {
      return 0;
    }
    List<double> amounts = filteredTransactions
        .toList()
        .map((transaction) => transaction.totalTaxes)
        .toList();
    return amounts.reduce((value, element) => value + element);
  }

  @computed
  List<DateTime> get transactionsDates {
    if (transactions.isEmpty) {
      return DateUtil.getDefaultMonths();
    }
    List<DateTime> dates = transactions
        .map((transaction) => transaction.sellDate)
        .toList();
    return DateUtil.getValidMonths(dates);
  }
}
