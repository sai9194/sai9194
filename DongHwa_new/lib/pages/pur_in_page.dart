import 'package:flutter/material.dart';
import '../models/pur_in.dart';
import '../services/api.dart';

class PurInPage extends StatefulWidget {
  const PurInPage({super.key});
  @override
  State<PurInPage> createState() => _PurInPageState();
}

class _PurInPageState extends State<PurInPage> {
  final _host = TextEditingController(text: '127.0.0.1');
  final _port = TextEditingController(text: '8080');
  final _s = TextEditingController(text: '2025-12-01');
  final _e = TextEditingController(text: '2025-12-12');
  Future<List<PurIn>>? _future;

  @override
  void dispose() {
    _host.dispose();
    _port.dispose();
    _s.dispose();
    _e.dispose();
    super.dispose();
  }

  void _load() {
    setState(() {
      _future = fetchPurIn(
        host: _host.text.trim(),
        port: int.tryParse(_port.text.trim()) ?? 8080,
        s: _s.text.trim(),
        e: _e.text.trim(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('입고 조회')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _box('HOST', _host, w: 180),
                _box('PORT', _port, w: 90),
                _box('S', _s, w: 140),
                _box('E', _e, w: 140),
                FilledButton(onPressed: _load, child: const Text('조회')),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _future == null
                  ? const Center(child: Text('조회 눌러서 가져오세요'))
                  : FutureBuilder<List<PurIn>>(
                      future: _future,
                      builder: (_, snap) {
                        if (snap.connectionState != ConnectionState.done) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snap.hasError) {
                          return SingleChildScrollView(child: Text('에러:\n${snap.error}'));
                        }
                        final items = snap.data ?? const <PurIn>[];
                        if (items.isEmpty) return const Center(child: Text('데이터 없음'));
                        return ListView.separated(
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (_, i) {
                            final x = items[i];
                            return ListTile(
                              title: Text(x.purcodeSys),
                              subtitle: Text(x.indate),
                              trailing: Text(x.inqty.toStringAsFixed(0)),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(String label, TextEditingController c, {double w = 140}) => SizedBox(
        width: w,
        child: TextField(
          controller: c,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
          ).copyWith(labelText: label),
        ),
      );
}
