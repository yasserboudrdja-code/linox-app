import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _item(context, Icons.person, 'PROFILE', () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()))),
        _item(context, Icons.code, 'DEVELOPER', () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const DeveloperScreen()))),
      ],
    );
  }

  Widget _item(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFE31A1A)),
      title: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white38),
      onTap: onTap,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _key = '';
  bool _showKey = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() { _key = prefs.getString('access_key') ?? ''; });
  }

  Future<void> _signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_key');
    if (mounted) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LinoxApp(initialKey: null)),
          (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      appBar: AppBar(backgroundColor: const Color(0xFF0A0A14), title: const Text('PROFILE'),
          leading: const BackButton(color: Color(0xFFE31A1A))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE31A1A).withOpacity(0.3))),
            child: Row(children: [
              ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/icon.jpg', width: 50, height: 50, fit: BoxFit.cover)),
              const SizedBox(width: 12),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('LINOX EXTERNAL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('LINOX EXTERNAL • OFFICIAL INFO', style: TextStyle(color: Color(0xFFE31A1A), fontSize: 11)),
              ])),
            ]),
          ),
          _card(children: [
            const Row(children: [
              Icon(Icons.person, color: Color(0xFFE31A1A), size: 18),
              SizedBox(width: 8),
              Text('PROFILE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ]),
            const Text('MY ACCOUNT', style: TextStyle(color: Colors.white38, fontSize: 11)),
          ]),
          const SizedBox(height: 8),
          _card(children: [
            const Row(children: [
              Icon(Icons.access_time, color: Color(0xFFE31A1A), size: 16),
              SizedBox(width: 6),
              Text('LICENSE TIME LEFT', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 12)),
            ]),
            const SizedBox(height: 6),
            const Text('Active', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          ]),
          const SizedBox(height: 8),
          _card(children: [
            const Row(children: [
              Icon(Icons.key, color: Color(0xFFE31A1A), size: 16),
              SizedBox(width: 6),
              Text('ACCESS KEY', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 12)),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: Text(_showKey ? _key : '•' * _key.length,
                  style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 14))),
              IconButton(icon: Icon(_showKey ? Icons.visibility_off : Icons.visibility, color: Colors.white38),
                  onPressed: () => setState(() => _showKey = !_showKey)),
            ]),
            const Text('Stored securely on this device', style: TextStyle(color: Colors.white38, fontSize: 11)),
          ]),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse('https://t.me/linoxXxcheat')),
            child: _card(children: [
              Row(children: [
                Container(width: 40, height: 40, decoration: BoxDecoration(color: const Color(0xFFE31A1A), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.help, color: Colors.white, size: 20)),
                const SizedBox(width: 12),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('OWNER SUPPORT', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 13)),
                  Text('Contact the owner if you have a problem', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ])),
                const Icon(Icons.open_in_new, color: Color(0xFFE31A1A), size: 16),
              ]),
            ]),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _signOut,
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A0000),
                  side: const BorderSide(color: Color(0xFFE31A1A)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              icon: const Icon(Icons.logout, color: Color(0xFFE31A1A)),
              label: const Text('SIGN OUT', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, letterSpacing: 2)),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _card({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1A1A3A))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }
}

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      appBar: AppBar(backgroundColor: const Color(0xFF0A0A14), title: const Text('DEVELOPER'),
          leading: const BackButton(color: Color(0xFFE31A1A))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE31A1A).withOpacity(0.3))),
            child: Column(children: [
              ClipRRect(borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/icon.jpg', width: double.infinity, height: 180, fit: BoxFit.cover)),
              const SizedBox(height: 12),
              const Text('LINOX EXTERNAL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              const Text('Developer information and official social links', style: TextStyle(color: Colors.white54, fontSize: 12)),
              const SizedBox(height: 4),
              const Text('developed by Linox', style: TextStyle(color: Color(0xFFE31A1A), fontSize: 13)),
            ]),
          ),
          const SizedBox(height: 12),
          _socialCard(Icons.play_arrow, 'OFFICIAL TIKTOK', '@r..ees', 'https://www.tiktok.com/@r..ees'),
          const SizedBox(height: 8),
          _socialCard(Icons.send, 'OFFICIAL TELEGRAM GROUP', 'LINOX EXTERNAL • COMMUNITY', 'https://t.me/linoxXxcheat'),
          const SizedBox(height: 8),
          _socialCard(Icons.person, 'OWNER CONTACT', 'OWNER • TELEGRAM', 'https://t.me/linoxxcheat777'),
        ]),
      ),
    );
  }

  Widget _socialCard(IconData icon, String title, String subtitle, String url) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: const Color(0xFF111122), borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1A1A3A))),
        child: Row(children: [
          Container(width: 44, height: 44, decoration: BoxDecoration(color: const Color(0xFFE31A1A), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: Colors.white, size: 22)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
            Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          ])),
          const Icon(Icons.open_in_new, color: Color(0xFFE31A1A), size: 16),
        ]),
      ),
    );
  }
}
