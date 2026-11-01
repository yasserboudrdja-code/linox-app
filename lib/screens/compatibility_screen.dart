import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class CompatibilityScreen extends StatefulWidget {
  const CompatibilityScreen({super.key});
  @override
  State<CompatibilityScreen> createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  String _ios = '...', _device = '...', _support = 'CHECKING';
  Color _supportColor = Colors.white38;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final info = await DeviceInfoPlugin().iosInfo;
    final ver = info.systemVersion;
    final major = int.tryParse(ver.split('.')[0]) ?? 0;
    final supported = major >= 17;
    setState(() {
      _ios = ver;
      _device = info.utsname.machine;
      _support = supported ? 'SUPPORTED' : 'UNSUPPORTED';
      _supportColor = supported ? const Color(0xFF00CC44) : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12)),
          child: const Row(children: [
            Icon(Icons.phone_iphone, color: Color(0xFFE31A1A), size: 22),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('COMPATIBILITY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('DEVICE REQUIREMENTS', style: TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
            ]),
          ]),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF1A1A3A))),
          child: Column(children: [
            Row(children: [
              const Icon(Icons.shield, color: Color(0xFFE31A1A), size: 16),
              const SizedBox(width: 6),
              const Text('CURRENT DEVICE STATUS', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
            ]),
            const SizedBox(height: 12),
            _row(Icons.apple, 'iOS', _ios),
            _row(Icons.phone_iphone, 'Device', _device),
            _row(Icons.verified, 'Support', _support, valueColor: _supportColor),
          ]),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF1A1A3A))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              Icon(Icons.verified, color: Color(0xFFE31A1A), size: 16),
              SizedBox(width: 6),
              Text('SUPPORTED iOS VERSIONS', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
            ]),
            const SizedBox(height: 10),
            const Text('iOS 17.0–17.7.x  •  iOS 18.0–18.7.1  •  iOS 26.0–26.6.1',
                style: TextStyle(color: Colors.white70, fontSize: 13)),
          ]),
        ),
      ]),
    );
  }

  Widget _row(IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Icon(icon, color: Colors.white54, size: 18),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const Spacer(),
        Text(value, style: TextStyle(color: valueColor ?? Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      ]),
    );
  }
}
