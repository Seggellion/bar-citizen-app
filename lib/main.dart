import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar Citizen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white60),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to Bar Citizen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _controller;
  bool _showWebView = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
  }

  void startDiscordLogin() {
    setState(() {
      _controller.loadRequest(Uri.parse('https://barcitizen.altama.energy/api/redirect_to_discord'));
      _showWebView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _showWebView
          ? WebViewWidget(controller: _controller) // Use WebViewWidget here
          : _buildMainContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action when the button is pressed
        },
        tooltip: 'Action',
        child: const Icon(Icons.navigation),
      ),
    );
  }

  Widget _buildMainContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Find and Create Local Bar Citizen Events!',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Join the community, share experiences, and explore the universe of Star Citizen together.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: startDiscordLogin,
            child: const Text('Login with Discord'),
          ),
        ],
      ),
    );
  }
}
