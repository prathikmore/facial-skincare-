import 'package:flutter/material.dart';

class AnalyzingScreen extends StatefulWidget {
  final Object? arguments;

  const AnalyzingScreen({super.key, this.arguments});

  @override
  State<AnalyzingScreen> createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  late Map<String, int> results;

  @override
  void initState() {
    super.initState();

    // ✅ ONLY accept real data
    if (widget.arguments is Map<String, int>) {
      results = widget.arguments as Map<String, int>;
    } else {
      Navigator.pop(context);
      return;
    }

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/result', arguments: results);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Analyzing your skin..."),
          ],
        ),
      ),
    );
  }
}
