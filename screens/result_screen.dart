import 'package:flutter/material.dart';
import '../utils/product_recommender.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, int> results;

  const ResultScreen({super.key, required this.results});

  IconData _iconForConcern(String key) {
    switch (key) {
      case 'Acne':
        return Icons.bug_report;
      case 'Moisture':
        return Icons.water_drop;
      case 'Radiance':
        return Icons.wb_sunny;
      case 'Pigmentation':
        return Icons.palette;
      case 'Dark Circles':
        return Icons.remove_red_eye;
      case 'Oiliness':
        return Icons.opacity;
      default:
        return Icons.health_and_safety;
    }
  }

  Color _colorForValue(int value) {
    if (value >= 75) return Colors.green;
    if (value >= 50) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final recommendations = ProductRecommender.getRecommendations(results);

    return Scaffold(
      appBar: AppBar(title: const Text('Skin Analysis'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Your skin analysis is complete. Below are your key skin concerns.',
                  style: TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Concern Highlights',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  final key = results.keys.elementAt(index);
                  final value = results[key]!;

                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _iconForConcern(key),
                          size: 28,
                          color: _colorForValue(value),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          key,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$value%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _colorForValue(value),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          value >= 70 ? 'Healthy' : 'Needs Care',
                          style: TextStyle(
                            fontSize: 12,
                            color: _colorForValue(value),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              const Text(
                'Recommended Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Column(
                children: recommendations.values.expand((list) => list).map((
                  product,
                ) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.shopping_bag, color: Colors.teal),
                        const SizedBox(width: 12),

                        // ✅ UPDATED PART (Clickable Product)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/products',
                                arguments: product,
                              );
                            },
                            child: Text(
                              product,
                              style: const TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: results,
                    );
                  },
                  child: const Text('View Problem Details'),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/routine',
                      arguments: results,
                    );
                  },
                  child: const Text('View Daily Routine'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
