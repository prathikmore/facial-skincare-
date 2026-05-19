import 'dart:math';

Map<String, int> analyzeSkin() {
  final random = Random();

  return {
    'Acne': 30 + random.nextInt(60), // 30–89
    'Radiance': 40 + random.nextInt(50), // 40–89
    'Moisture': 35 + random.nextInt(55), // 35–89
    'Pigmentation': 30 + random.nextInt(60),
    'Dark Circles': 25 + random.nextInt(65),
    'Oiliness': 30 + random.nextInt(60),
  };
}
