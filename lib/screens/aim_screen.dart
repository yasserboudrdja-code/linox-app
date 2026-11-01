import 'package:flutter/material.dart';
import '../widgets/patch_card.dart';

class AimScreen extends StatelessWidget {
  const AimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const patches = [
      'AIM HEAD', 'AIM DRAG', 'AIM NECK HS', 'AIM BODY',
      'AIM BODY - ANTENA', 'AIM DRAG - ANTENA', 'MAGIC BULLET', 'MAGIC BULLET - ANTENA',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12)),
          child: const Row(children: [
            Icon(Icons.gps_fixed, color: Color(0xFFE31A1A), size: 22),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('AIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('ONLINE AIM PATCHES', style: TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
            ]),
          ]),
        ),
        const GameToggle(),
        const SectionHeader(title: 'FF NORMAL', icon: Icons.bolt),
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
