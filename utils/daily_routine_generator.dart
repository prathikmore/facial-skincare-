List<String> generateDailyRoutine(Map<String, int> results) {
  List<String> routine = [];

  // 🌅 MORNING ROUTINE
  routine.add('🌅 Morning Routine');
  routine.add('Gentle cleanser');

  if (results['Oiliness'] != null && results['Oiliness']! < 70) {
    routine.add('Oil-control face wash');
  }

  if (results['Acne'] != null && results['Acne']! < 70) {
    routine.add('Salicylic acid or acne treatment');
  }

  routine.add('Lightweight moisturizer');
  routine.add('Sunscreen (SPF 30+)');

  // 🌙 NIGHT ROUTINE
  routine.add('');
  routine.add('🌙 Night Routine');
  routine.add('Cleanser');

  if (results['Pigmentation'] != null && results['Pigmentation']! < 70) {
    routine.add('Vitamin C or Niacinamide serum');
  }

  if (results['Dark Circles'] != null && results['Dark Circles']! < 70) {
    routine.add('Under-eye cream');
  }

  if (results['Moisture'] != null && results['Moisture']! < 70) {
    routine.add('Hydrating night cream');
  }

  routine.add('Sleep 7–8 hours');

  return routine;
}
