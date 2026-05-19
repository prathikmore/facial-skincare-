import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../utils/ml_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
    );

    _controller = CameraController(front, ResolutionPreset.medium);
    await _controller!.initialize();

    setState(() {
      _isCameraReady = true;
    });
  }

  Future<void> _captureAndAnalyze() async {
    if (!_controller!.value.isInitialized) return;

    final file = await _controller!.takePicture();

    final ml = MLService();
    final results = await ml.analyzeSkin(file.path);

    print("RESULTS: $results");

    // 🚨 NO FACE DETECTED
    if (results == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No face detected!")));
      return;
    }

    // ✅ PASS REAL RESULTS
    Navigator.pushNamed(context, '/analyzing', arguments: results);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Face")),
      body: _isCameraReady
          ? Column(
              children: [
                Expanded(child: CameraPreview(_controller!)),
                ElevatedButton(
                  onPressed: _captureAndAnalyze,
                  child: const Text("Capture"),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
