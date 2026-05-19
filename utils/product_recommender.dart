class ProductRecommender {
  static Map<String, List<String>> getRecommendations(
    Map<String, int> results,
  ) {
    List<String> cleansers = [];
    List<String> serums = [];
    List<String> moisturizers = [];
    List<String> creams = [];

    // 🔴 Acne logic
    if (results['Acne']! < 80) {
      cleansers.add("Salicylic Acid Cleanser");
      serums.add("Niacinamide Serum");
    }

    // 💧 Dry skin
    if (results['Moisture']! < 90) {
      moisturizers.add("Hyaluronic Acid Moisturizer");
    }

    // 🌞 Pigmentation
    if (results['Pigmentation']! < 80) {
      serums.add("Vitamin C Serum");
    }

    // 🛢 Oiliness
    if (results['Oiliness']! > 60) {
      cleansers.add("Foaming Gel Cleanser");
    }

    // 👁 Dark circles
    if (results['Dark Circles']! < 80) {
      serums.add("Caffeine Eye Serum");
    }

    if (results['Radiance']! > 50) {
      creams.add("sunscreens");
    }
    return {
      "Cleansers": cleansers,
      "Serums": serums,
      "Moisturizers": moisturizers,
      "creams": creams,
    };
  }
}
