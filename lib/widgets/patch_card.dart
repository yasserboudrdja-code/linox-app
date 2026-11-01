import 'package:flutter/material.dart';

class PatchCard extends StatelessWidget {
  final String name;
  final String game;
  final String type;

  const PatchCard({super.key, required this.name, required this.game, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF111122),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1A1A3A)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text('$game • $type', style: const TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
                const Text('FULL SAFE', style: TextStyle(color: Colors.white54, fontSize: 11)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => AlertDialog(
                backgroundColor: const Color(0xFF111122),
                title: const Text('INJECT', style: TextStyle(color: Colors.white)),
                content: Text('$name\nقريباً — Coming Soon', style: const TextStyle(color: Colors.white70)),
                actions: [TextButton(onPressed: () => Navigator.pop(context),
                    child: const Text('OK', style: TextStyle(color: Color(0xFFE31A1A))))],
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Color(0xFFE31A1A)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            ),
            child: const Text('INJECT', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const SectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFE31A1A), size: 16),
          const SizedBox(width: 6),
          Text(title, style: const TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
          const Spacer(),
          const Text('SELECT PATCH', style: TextStyle(color: Colors.white38, fontSize: 11)),
        ],
      ),
    );
  }
}

class GameToggle extends StatefulWidget {
  const GameToggle({super.key});
  @override
  State<GameToggle> createState() => _GameToggleState();
}

class _GameToggleState extends State<GameToggle> {
  int _sel = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF111122),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1A1A3A)),
      ),
      child: Row(children: [_tab('FREE FIRE\nNORMAL', 0), _tab('FREE FIRE MAX\nMAX', 1)]),
    );
  }

  Widget _tab(String label, int idx) {
    final sel = _sel == idx;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _sel = idx),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: sel ? const Color(0xFF1A0A0A) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: sel ? Border.all(color: const Color(0xFFE31A1A)) : null,
          ),
          child: Text(label, textAlign: TextAlign.center,
              style: TextStyle(color: sel ? Colors.white : Colors.white38,
                  fontWeight: sel ? FontWeight.bold : FontWeight.normal, fontSize: 12)),
        ),
      ),
    );
  }
}
