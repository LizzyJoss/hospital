import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class OCRScreen extends StatelessWidget {
  final String imagePath;

  OCRScreen({required this.imagePath});

  Future<void> performOCR(BuildContext context) async {
    final text = await FlutterTesseractOcr.extractText(imagePath, language: 'eng');
    if (text.contains('PL1')) {
      Navigator.pushNamed(context, '/medico/form'); // Redirige a la pantalla de "Proyectos"
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Texto no reconocido: $text")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OCR en progreso")),
      body: FutureBuilder<void>(
        future: performOCR(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Center(child: Text("Procesando..."));
          }
        },
      ),
    );
  }
}
