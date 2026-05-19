import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/face_scan_screen.dart';
import 'screens/analyzing_screen.dart';
import 'screens/result_screen.dart';
import 'screens/problem_details_screen.dart';
import 'screens/daily_routine_screen.dart';
import 'screens/home_remedies_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SkinCareApp());
}

class SkinCareApp extends StatelessWidget {
  const SkinCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkinScan',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4FBF9),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),

        '/scan': (context) => const FaceScanScreen(),

        // 🔥 FIXED: PASS ARGUMENTS SAFELY
        '/analyzing': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return AnalyzingScreen(arguments: args);
        },

        // ✅ SAFE RESULT ROUTE
        '/result': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;

          if (args is Map<String, int>) {
            return ResultScreen(results: args);
          }

          return const Scaffold(
            body: Center(
              child: Text(
                'Invalid result data',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },

        // ✅ SAFE DETAILS ROUTE
        '/details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;

          if (args is Map<String, int>) {
            return ProblemDetailsScreen(results: args);
          }

          return const Scaffold(
            body: Center(child: Text('No details available')),
          );
        },

        // ✅ SAFE ROUTINE ROUTE
        '/routine': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;

          if (args is Map<String, int>) {
            return DailyRoutineScreen(results: args);
          }

          return const Scaffold(
            body: Center(child: Text('No routine data available')),
          );
        },

        '/remedies': (context) => const HomeRemediesScreen(),

        '/products': (context) {
          final category = ModalRoute.of(context)!.settings.arguments as String;
          return ProductListScreen(category: category);
        },
      },
    );
  }
}
