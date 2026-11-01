import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:convert';
import 'home_screen.dart';

class KeyScreen extends StatefulWidget {
  const KeyScreen({super.key});
  @override
  State<KeyScreen> createState() => _KeyScreenState();
}

class _KeyScreenState extends State<KeyScreen> {
  final _controller = TextEditingController();
  bool _loading = false;
  String _error = '';

  Future<String> _getHwid() async {
    final info = DeviceInfoPlugin();
    final ios = await info.iosInfo;
    return ios.identifierForVendor ?? 'unknown';
  }

  Future<void> _verify() async {
    final key = _controller.text.trim();
    if (key.isEmpty) return;
    setState(() { _loading = true; _error = ''; });
    try {
      final hwid = await _getHwid();
      final res = await http.get(Uri.parse(
        'https://linox-cheat.onrender.com/verify?key=$key&hwid=$hwid'
      ));
      final data = jsonDecode(res.body);
      if (data['valid'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_key', key);
        await prefs.setString('hwid', hwid);
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      } else {
        setState(() { _error = data['error'] ?? 'Invalid key'; });
      }
    } catch (e) {
      setState(() { _error = 'Connection error'; });
    }
    setState(() { _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset('assets/icon.jpg', width: 120, height: 120, fit: BoxFit.cover),
                ),
                const SizedBox(height: 20),
                const Text('LINOX X CHEAT',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 2)),
                const SizedBox(height: 4),
                const Text('developed by Linox',
                    style: TextStyle(color: Color(0xFFE31A1A), fontSize: 13)),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111122),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE31A1A).withOpacity(0.4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(children: [
                        Icon(Icons.key, color: Color(0xFFE31A1A), size: 18),
                        SizedBox(width: 8),
                        Text('ACCESS KEY', style: TextStyle(color: Color(0xFFE31A1A), fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
                      ]),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
                        decoration: InputDecoration(
                          hintText: 'LINOX-XXXX-XXXX',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                          filled: true,
                          fillColor: const Color(0xFF0D0D1A),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFFE31A1A))),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: const Color(0xFFE31A1A).withOpacity(0.4))),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFFE31A1A), width: 2)),
                        ),
                      ),
                      if (_error.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(_error, style: const TextStyle(color: Colors.red, fontSize: 13)),
                      ],
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _loading ? null : _verify,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE31A1A),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: _loading
                              ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                              : const Text('VERIFY KEY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: Color(0xFFE31A1A), size: 16),
                  label: const Text('@linoxxcheat777', style: TextStyle(color: Color(0xFFE31A1A))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
