import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class NoticeCard extends StatefulWidget {
  const NoticeCard({super.key});

  @override
  State<NoticeCard> createState() => _NoticeCardState();
}

class _NoticeCardState extends State<NoticeCard> {
  @override
  Widget build(BuildContext context) {
    final filter =
        ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken);
    return InnerShadow(
      color: Colors.black.withOpacity(0.8),
      child: Container(
        width: 310,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          image: DecorationImage(
            image: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe5dWt8u5RNaME7xztyCs4Mr491Wb-WvjEuN7CGZ46iw&s'),
            colorFilter: filter,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Acidente causa 4km de engarrafamento',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
