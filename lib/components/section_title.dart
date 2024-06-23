import 'package:flutter/material.dart';
import 'package:etec_tcc/constants/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: ConstantsColors.primaryColor,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          width: double.infinity,
          height: 2,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
