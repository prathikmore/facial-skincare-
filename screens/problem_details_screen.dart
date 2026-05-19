import 'package:flutter/material.dart';

class ProblemDetailsScreen extends StatelessWidget {
  final Map<String, int> results;

  const ProblemDetailsScreen({super.key, required this.results});

  Color _getColor(int value) {
    if (value >= 70) return Colors.green;
    if (value >= 40) return Colors.orange;
    return Colors.red;
  }

  String _getStatus(int value) {
    return value >= 70 ? "Healthy" : "Needs Care";
  }

  // 🔥 SMART TIPS BASED ON CONCERN
  List<String> _getTips(String concern) {
    switch (concern) {
      case "Acne":
        return [
          "Use Salicylic Acid Cleanser",
          "Apply Niacinamide Serum",
          "Avoid oily and comedogenic products",
          "Wash face twice daily",
          "Do not touch or pop pimples",
        ];

      case "Pigmentation":
        return [
          "Use Vitamin C Serum daily",
          "Apply sunscreen (SPF 30+)",
          "Use gentle exfoliation weekly",
          "Avoid sun exposure",
          "Use brightening ingredients like alpha arbutin",
        ];

      case "Dark Circles":
        return [
          "Use Caffeine Eye Serum",
          "Get 7–8 hours of sleep",
          "Stay hydrated",
          "Reduce screen time",
          "Apply cold compress regularly",
        ];

      case "Oiliness":
        return [
          "Use Foaming Gel Cleanser",
          "Apply oil-free moisturizer",
          "Use clay masks weekly",
          "Avoid heavy creams",
          "Blot excess oil during day",
        ];

      case "Moisture":
        return [
          "Use Hyaluronic Acid Moisturizer",
          "Drink enough water",
          "Avoid hot water face wash",
          "Use gentle cleansers",
          "Apply moisturizer twice daily",
        ];

      case "Radiance":
        return [
          "Use Vitamin C Serum",
          "Exfoliate once a week",
          "Maintain proper hydration",
          "Use sunscreen daily",
          "Follow a consistent skincare routine",
        ];

      default:
        return ["Maintain a healthy skincare routine"];
    }
  }

  // 🔥 PRODUCT SUGGESTIONS (SMART)
  List<String> _getProducts(String concern) {
    switch (concern) {
      case "Acne":
        return [
          "Salicylic Acid Cleanser",
          "Niacinamide Serum",
          "Oil-Free Moisturizer",
        ];

      case "Pigmentation":
        return ["Vitamin C Serum", "Sunscreen SPF 50", "Brightening Serum"];

      case "Dark Circles":
        return ["Caffeine Eye Serum", "Under Eye Cream", "Cooling Eye Gel"];

      case "Oiliness":
        return [
          "Foaming Gel Cleanser",
          "Oil Control Toner",
          "Lightweight Moisturizer",
        ];

      case "Moisture":
        return [
          "Hyaluronic Acid Moisturizer",
          "Hydrating Serum",
          "Gentle Cleanser",
        ];

      case "Radiance":
        return ["Vitamin C Serum", "Sunscreen SPF 50", "Glow Moisturizer"];

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Problem Details"), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: results.length,
        itemBuilder: (context, index) {
          final key = results.keys.elementAt(index);
          final value = results[key]!;

          final tips = _getTips(key);
          final products = _getProducts(key);

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 TITLE
                Text(
                  key,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // 🔹 STATUS
                Text(
                  "$value% • ${_getStatus(value)}",
                  style: TextStyle(
                    color: _getColor(value),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                // 🔥 PRODUCTS SECTION
                const Text(
                  "Recommended Products:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),

                ...products.map((p) => Text("• $p")),

                const SizedBox(height: 12),

                // 🔥 TIPS SECTION
                const Text(
                  "Tips:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),

                ...tips.map((tip) => Text("• $tip")),
              ],
            ),
          );
        },
      ),
    );
  }
}
