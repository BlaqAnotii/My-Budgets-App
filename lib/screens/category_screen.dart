import 'package:budgetsapp/helpers/color_helper.dart';
import 'package:budgetsapp/model/catergory_model.dart';
import 'package:budgetsapp/widget/radial_painter.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses() {
    List<Widget> expenseList = [];
    for (var expense in widget.category.expenses) {
      expenseList.add(
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          height: 80.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expense.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '-\$${expense.cost.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    for (var expenses in widget.category.expenses) {
      totalAmountSpent += expenses.cost;
    }

    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 30.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                    width: 15.0,
                    lineColor: getColor(context, percent),
                    percent: percent,
                    bgColor: const Color.fromARGB(255, 221, 219, 219)),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount}',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}
