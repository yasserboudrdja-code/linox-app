import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111122),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE31A1A).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/icon.jpg', width: 56, height: 56, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LINOX EXTERNAL',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text('LINOX EXTERNAL • OFFICIAL INFO',
                    style: TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse('https://t.me/linoxXxcheat')),
            child: Container(
              width: 40, height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFE31A1A),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
