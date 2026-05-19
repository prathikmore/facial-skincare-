import 'package:flutter/material.dart';

class HomeRemediesScreen extends StatelessWidget {
  const HomeRemediesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Remedies'), centerTitle: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            _RemedyCard(
              title: 'Acne Control 🧴',
              description:
                  'Apply fresh aloe vera gel on clean skin. Leave for 15–20 minutes.',
              caution: 'Patch test recommended.',
            ),
            _RemedyCard(
              title: 'Dry Skin 💧',
              description:
                  'Mix honey with a few drops of milk. Apply for 10 minutes.',
              caution: 'Avoid if allergic to dairy.',
            ),
            _RemedyCard(
              title: 'Dark Circles 👀',
              description:
                  'Use chilled cucumber slices under eyes for 10 minutes.',
              caution: 'Do not rub eye area.',
            ),
            _RemedyCard(
              title: 'Dull Skin🌟',
              description:
                  'Apply curd + turmeric (very small amount) mask for glow.',
              caution: 'Overuse turmeric can stain.',
            ),
            _RemedyCard(
              title: 'Glowing Skin ✨',
              description:
                  'Apply a mix of turmeric and yogurt for 10–15 minutes.',
              caution: 'Do not use too much turmeric to avoid yellow staining.',
            ),

            _RemedyCard(
              title: 'Oily Skin Balance 💧',
              description:
                  'Use multani mitti (Fuller’s earth) with rose water as a face pack.',
              caution: 'Do not overuse; it can dry out your skin.',
            ),

            _RemedyCard(
              title: 'Tan Removal ☀️',
              description: 'Apply lemon juice mixed with honey for 10 minutes.',
              caution: 'Avoid if you have sensitive skin or open wounds.',
            ),

            _RemedyCard(
              title: 'Dark Circles 👀',
              description:
                  'Place chilled cucumber slices on eyes for 10–15 minutes.',
              caution: 'Ensure cucumber is clean to prevent infection.',
            ),

            _RemedyCard(
              title: 'Soft Skin 🧴',
              description:
                  'Apply coconut oil before bed for deep moisturization.',
              caution: 'Avoid if you have acne-prone skin.',
            ),

            _RemedyCard(
              title: 'Skin Brightening 🌸',
              description:
                  'Use gram flour (besan) with milk and a pinch of turmeric.',
              caution: 'Do not scrub harshly while removing.',
            ),

            _RemedyCard(
              title: 'Blackhead Removal ⚫',
              description:
                  'Steam your face and gently scrub with sugar and honey.',
              caution: 'Do not squeeze aggressively to avoid scars.',
            ),

            _RemedyCard(
              title: 'Sunburn Relief 🔥',
              description: 'Apply chilled aloe vera gel to soothe the skin.',
              caution: 'Avoid sun exposure immediately after application.',
            ),

            _RemedyCard(
              title: 'Even Skin Tone 🎯',
              description: 'Apply potato juice on skin for 10–15 minutes.',
              caution: 'Wash off properly to avoid dryness.',
            ),
          ],
        ),
      ),
    );
  }
}

class _RemedyCard extends StatelessWidget {
  final String title;
  final String description;
  final String caution;

  const _RemedyCard({
    required this.title,
    required this.description,
    required this.caution,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Text(
              caution,
              style: const TextStyle(color: Colors.orange, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
