import 'package:flutter/material.dart';

class DailyRoutineScreen extends StatelessWidget {
  final Map<String, int> results;

  const DailyRoutineScreen({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Routine'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _routineCard(
            title: '🌞 Morning Routine',
            steps: [
              '🧼 Cleanser – Start your day with a gentle face wash to remove oil and refresh your skin.',
              '💧 Toner – Helps tighten pores and prepares your skin for better absorption.',
              '✨ Serum – Apply Vitamin C serum for bright, glowing skin and protection.',
              '🧴 Moisturizer – Keeps your skin hydrated and soft throughout the day.',
              '☀️ Sunscreen – Use SPF 30+ to protect your skin from harmful UV rays.',
            ],
          ),
          const SizedBox(height: 16),
          _routineCard(
            title: '🌙 Night Routine',
            steps: [
              '🧼 Gentle Cleanser – Remove dirt, oil, and pollution from your skin.',
              '🧴 Double Cleanse (Optional) – Use micellar water or oil cleanser if you wore sunscreen/makeup.',
              '💧 Toner – Restores skin balance and preps for treatment products.',
              '✨ Serum – Use niacinamide or hyaluronic acid for repair and hydration.',
              '🌙 Treatment (Optional) – Apply acne or spot treatment if needed.',
              '🧴 Moisturizer – Locks in hydration and supports overnight repair.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _routineCard({required String title, required List<String> steps}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...steps.map(
              (step) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text('• $step'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
