import 'package:budgetsapp/model/expenses_model.dart';

class Category {
  final String name;
  final double maxAmount;
  final List<Expenses> expenses;

  Category(
      {required this.name, required this.maxAmount, required this.expenses});
}
