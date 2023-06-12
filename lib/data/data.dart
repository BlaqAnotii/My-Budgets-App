import 'dart:math';

import 'package:budgetsapp/model/catergory_model.dart';
import 'package:budgetsapp/model/expenses_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<Expenses> expenses = [
    Expenses(name: 'Item 0', cost: rand.nextDouble() * 90),
    Expenses(name: 'Item 1', cost: rand.nextDouble() * 90),
    Expenses(name: 'Item 2', cost: rand.nextDouble() * 90),
    Expenses(name: 'Item 3', cost: rand.nextDouble() * 90),
    Expenses(name: 'Item 4', cost: rand.nextDouble() * 90),
    Expenses(name: 'Item 5', cost: rand.nextDouble() * 90)
  ];
  return expenses;
}

List<Category> categories = [
  Category(name: 'Food', maxAmount: 450, expenses: _generateExpenses()),
  Category(name: 'Clothing', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Utilities', maxAmount: 600, expenses: _generateExpenses()),
  Category(
      name: 'Entertainment', maxAmount: 330, expenses: _generateExpenses()),
  Category(
      name: 'Transportation', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Housing', maxAmount: 1000, expenses: _generateExpenses()),
];
