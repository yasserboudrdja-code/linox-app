import 'package:flutter/material.dart';
import '../widgets/patch_card.dart';

class SkinModScreen extends StatelessWidget {
  const SkinModScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const patches = [
      'SKIN ALOK 1', 'SKIN ALOK 2', 'SKIN ALOK 3', 'SKIN ALOK 4',
      'SKIN ALOK 5', 'SKIN ALOK 6', 'SKIN ALOK 7', 'SKIN ALOK 8',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12)),
          child: const Row(children: [
            Icon(Icons.auto_awesome, color: Color(0xFFE31A1A), size: 22),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('SKIN MOD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('ONLINE SKIN PATCHES', style: TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
            ]),
          ]),
        ),
        const GameToggle(),
        const SectionHeader(title: 'FF NORMAL', icon: Icons.auto_awesome),
        Expanded(
          child: ListView.builder(
            itemCount: patches.length,
            itemBuilder: (_, i) => PatchCard(name: patches[i], game: 'FREE FIRE', type: 'NORMAL'),
          ),
        ),
      ],
    );
  }
}
