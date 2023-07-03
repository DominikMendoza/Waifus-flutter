import 'package:flutter/material.dart';
import '../../data/remote/waifu_service.dart';

class WaifusScreen extends StatefulWidget {
  const WaifusScreen({super.key});

  @override
  State<WaifusScreen> createState() => _WaifusScreenState();
}

class _WaifusScreenState extends State<WaifusScreen> {
  final _waifuService = WaifuService();
  List _waifus = List.empty();
  dynamic waifu = (id: '0000', url: 'https://cdn.waifu.im/7924.jpg', description: 'A female anime character.');

  loadWaifus() async {
    final result = await _waifuService.getWaifu();
    setState(() {
      _waifus = result!;
      waifu = _waifus[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waifus'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Image.network(
                waifu.url,
                fit: BoxFit.contain,
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                title: Text(waifu.id),
                subtitle: Text(waifu.description),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadWaifus,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
