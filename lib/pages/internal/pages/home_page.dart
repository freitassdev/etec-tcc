import 'package:etec_tcc/components/notice_card.dart';
import 'package:etec_tcc/components/section_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NoticesSection()
        ],
      ),
    );
  }
}

class NoticesSection extends StatefulWidget {
  const NoticesSection({super.key});

  @override
  State<NoticesSection> createState() => _NoticesSectionState();
}

class _NoticesSectionState extends State<NoticesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Notícias Gerais',
          ),
          SizedBox(
            height: 190,
            child: ListView(
              clipBehavior: Clip.none, // isso aqui faz com que ele pegue a tela toda
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                NoticeCard(),
                SizedBox(width: 16),
                NoticeCard(),
                SizedBox(width: 16),
                NoticeCard(),
                SizedBox(width: 16),
                NoticeCard(),
                SizedBox(width: 16),
                NoticeCard(),
              ],
            ),
          ),
        ],
      );
  }
}