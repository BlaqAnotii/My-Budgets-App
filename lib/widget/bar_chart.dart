import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key, this.expenses});

  final List<double>? expenses;
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses!) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 3, left: 3),
      child: Column(
        children: [
          const Text(
            'Weekly Spending',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
                iconSize: 30.0,
              ),
              const Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                iconSize: 30.0,
              )
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                  label: 'Su',
                  amountSpent: expenses![0],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Mo',
                  amountSpent: expenses![1],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Tu',
                  amountSpent: expenses![2],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'We',
                  amountSpent: expenses![3],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Th',
                  amountSpent: expenses![4],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Fr',
                  amountSpent: expenses![5],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Sa',
                  amountSpent: expenses![6],
                  mostExpensive: mostExpensive),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar(
      {super.key,
      required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6.0)),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
