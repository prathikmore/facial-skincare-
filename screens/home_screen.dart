import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _ctaController;

  @override
  void initState() {
    super.initState();

    // 🔹 Background gradient animation
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    // 🔹 CTA pulse animation
    _ctaController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.95,
      upperBound: 1.05,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _ctaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _gradientController,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(
                    const Color(0xFFE8F5F2),
                    const Color(0xFFDFF7F0),
                    _gradientController.value,
                  )!,
                  Color.lerp(
                    const Color(0xFFF4FBF9),
                    const Color(0xFFEAFBF6),
                    _gradientController.value,
                  )!,
                ],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // 🔹 App Title
                    const Center(
                      child: Text(
                        'SkinCare AI',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🔹 Welcome Section
                    const Text(
                      'Welcome 👋',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Your AI-powered skin analysis & care assistant',
                      style: TextStyle(color: Colors.black54),
                    ),

                    const SizedBox(height: 30),

                    // 🔹 AI FACE SCAN CARD (with glow + animation)
                    AnimatedBuilder(
                      animation: _ctaController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _ctaController.value,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.15),
                                  blurRadius: 25,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.teal.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.face_retouching_natural,
                                        size: 48,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    const Text(
                                      'AI Face Scan',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Scan your face to detect skin concerns and get personalized routines.',
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/scan');
                                        },
                                        child: const Text('Start Face Scan'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // 🔹 QUICK ACTIONS
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _quickCard(
                            icon: Icons.spa,
                            label: 'Home Remedies',
                            onTap: () {
                              Navigator.pushNamed(context, '/remedies');
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // 🔹 SKIN TIPS (informative section)
                    const Text(
                      'Skin Tips for You',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    _tipCard(
                      title: 'Hydration Reminder 💧',
                      text:
                          'Drink 2–3 liters of water daily to maintain skin elasticity.',
                    ),
                    _tipCard(
                      title: 'Sun Protection ☀️',
                      text:
                          'Always use sunscreen to prevent pigmentation and aging.',
                    ),
                    _tipCard(
                      title: 'Daily Cleansing 🧼',
                      text:
                          'Wash your face twice a day to remove dirt, oil, and pollution.',
                    ),

                    _tipCard(
                      title: 'Use Sunscreen ☀️',
                      text:
                          'Apply SPF 30+ sunscreen daily to protect skin from harmful UV rays.',
                    ),

                    _tipCard(
                      title: 'Stay Hydrated 💧',
                      text:
                          'Drink 2–3 liters of water daily to maintain skin elasticity.',
                    ),

                    _tipCard(
                      title: 'Healthy Diet 🥗',
                      text:
                          'Eat fruits and vegetables rich in vitamins for glowing skin.',
                    ),

                    _tipCard(
                      title: 'Proper Sleep 😴',
                      text:
                          'Get 7–8 hours of sleep to allow your skin to repair and glow.',
                    ),

                    _tipCard(
                      title: 'Avoid Touching Face 🚫',
                      text:
                          'Keep your hands away from your face to prevent acne and irritation.',
                    ),

                    _tipCard(
                      title: 'Moisturize Daily 🧴',
                      text:
                          'Use a good moisturizer to keep your skin soft and hydrated.',
                    ),

                    _tipCard(
                      title: 'Exfoliate Weekly ✨',
                      text:
                          'Remove dead skin cells 1–2 times a week for smoother skin.',
                    ),

                    _tipCard(
                      title: 'Exercise Regularly 🏃',
                      text:
                          'Physical activity improves blood flow and gives natural glow.',
                    ),

                    _tipCard(
                      title: 'Reduce Stress 🧘',
                      text: 'Manage stress to avoid breakouts and dull skin.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // 🔹 Quick Action Card
  Widget _quickCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.teal),
              const SizedBox(height: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Tip Card
  Widget _tipCard({required String title, required String text}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(text, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
