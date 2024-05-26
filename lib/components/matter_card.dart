import 'package:flutter/material.dart';

class IDay {
  final String day;
  final Color color;

  IDay({required this.day, required this.color});
}

class MatterCard extends StatelessWidget {
  final String day;
  final String matter;
  MatterCard({super.key, this.day = 'Segunda-feira', required this.matter});

  final List<IDay> days = [
    IDay(day: 'Segunda-feira', color: Colors.red),
    IDay(day: 'Terça-feira', color: Colors.blue),
    IDay(day: 'Quarta-feira', color: Colors.green),
    IDay(day: 'Quinta-feira', color: Colors.orange),
    IDay(day: 'Sexta-feira', color: Colors.purple),
    IDay(day: 'Sábado', color: Colors.teal),
    IDay(day: 'Domingo', color: Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    IDay currentDay = IDay(day: 'Segunda-feira', color: Colors.red);

    for (final day in days) {
      if (day.day == this.day) {
        currentDay = day;
        break;
      }
    }
    return Container(
      width: 310,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: currentDay.color,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                currentDay.day,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            matter,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
