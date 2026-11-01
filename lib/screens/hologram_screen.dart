import 'package:flutter/material.dart';
import '../widgets/patch_card.dart';

class HologramScreen extends StatelessWidget {
  const HologramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12)),
          child: const Row(children: [
            Icon(Icons.view_in_ar, color: Color(0xFFE31A1A), size: 22),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('BODY / WEAPONS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('ONLINE BODY & WEAPONS PATCHES', style: TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
            ]),
          ]),
        ),
        const GameToggle(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF1A1A3A))),
          child: Row(children: [
            Expanded(child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(color: const Color(0xFF1A0A0A), borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE31A1A))),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.person, color: Color(0xFFE31A1A), size: 16),
                SizedBox(width: 4),
                Text('BODY\nSELECTED', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ]),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.gps_fixed, color: Colors.white38, size: 16),
                const SizedBox(width: 4),
                const Text('WEAPONS\nPATCH TYPE', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white38, fontSize: 12)),
              ]),
            )),
          ]),
        ),
        const SectionHeader(title: 'FF NORMAL', icon: Icons.person),
        const Expanded(
          child: Center(
            child: Text('NO BODY PATCHES — ADD FILES FROM LINOX EXTERNAL',
                style: TextStyle(color: Colors.white38, fontSize: 13), textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
