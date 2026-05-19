import 'package:flutter/material.dart';

class ProgressTrackingScreen extends StatelessWidget {
  const ProgressTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy weekly data (final year safe)
    final List<int> weeklyScores = [62, 65, 68, 72];

    return Scaffold(
      appBar: AppBar(title: const Text('Skin Progress')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Skin Health',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 🔹 SIMPLE PROGRESS BARS (NO CHART LIBRARY – SAFE)
            ...weeklyScores.asMap().entries.map((entry) {
              final week = entry.key + 1;
              final score = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Week $week  •  Score: $score'),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: score / 100,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.teal,
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 24),

            // 🔹 BEFORE / AFTER PLACEHOLDER
            const Text(
              'Before / After Comparison',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                _imagePlaceholder('Before'),
                const SizedBox(width: 12),
                _imagePlaceholder('After'),
              ],
            ),

            const SizedBox(height: 24),

            // 🔹 INFO TEXT (VIVA FRIENDLY)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Skin score improves gradually based on consistency in routine and care. '
                  'This tracking helps users understand long-term skin health trends.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder(String label) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(label, style: const TextStyle(color: Colors.black54)),
        ),
      ),
    );
  }
}
