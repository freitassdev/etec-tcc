import 'package:etec_tcc/components/matter_card.dart';
import 'package:etec_tcc/components/section_title.dart';
import 'package:flutter/material.dart';

class MattersPage extends StatefulWidget {
  const MattersPage({super.key});

  @override
  State<MattersPage> createState() => _MattersPageState();
}

class _MattersPageState extends State<MattersPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MattersSection()],
      ),
    );
  }
}

class MattersSection extends StatefulWidget {
  const MattersSection({super.key});

  @override
  State<MattersSection> createState() => _MattersSectionState();
}

class _MattersSectionState extends State<MattersSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'Matérias',
        ),
        SizedBox(
          height: 190,
          child: ListView(
            clipBehavior:
                Clip.none, // isso aqui faz com que ele pegue a tela toda
            scrollDirection: Axis.horizontal,
            children:  <Widget>[
              MatterCard(),
              const SizedBox(width: 16),
              MatterCard(),
              const SizedBox(width: 16),
              MatterCard(),
              const SizedBox(width: 16),
              MatterCard(),
              const SizedBox(width: 16),
              MatterCard(),
            ],
          ),
        ),
      ],
    );
  }
}
