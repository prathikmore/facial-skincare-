import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../utils/ml_service.dart';

class FaceScanScreen extends StatefulWidget {
  const FaceScanScreen({super.key});

  @override
  State<FaceScanScreen> createState() => _FaceScanScreenState();
}

class _FaceScanScreenState extends State<FaceScanScreen> {
  CameraController? _controller;
  bool _isCameraReady = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      _controller = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _controller!.initialize();

      if (!mounted) return;

      setState(() {
        _isCameraReady = true;
      });
    } catch (e) {
      print("Camera Error: $e");
    }
  }

  Future<void> _captureAndAnalyze() async {
    if (!_isCameraReady || _controller == null) {
      print("Camera not ready");
      return;
    }

    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      print("📸 Taking picture...");

      final XFile image = await _controller!.takePicture();
      final File file = File(image.path);

      print("📁 Image captured: ${file.path}");

      // 🔍 ML ANALYSIS
      final results = await MLService().analyzeSkin(file.path);

      print("🧠 ML result: $results");

      if (!mounted) return;

      // 🚨 NO FACE
      if (results == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("No face detected!")));

        setState(() {
          _isProcessing = false;
        });

        return;
      }

      // ✅ NAVIGATE
      Navigator.pushNamed(context, '/analyzing', arguments: results);
    } catch (e) {
      print("❌ Error: $e");
    }

    setState(() {
      _isProcessing = false;
    });
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
          ? Stack(
              children: [
                CameraPreview(_controller!),

                // Capture Button
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: _captureAndAnalyze,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _isProcessing ? Colors.grey : Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
