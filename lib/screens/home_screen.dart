import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/pdf_viewer.dart';
import '../widgets/customization_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customizable Resume Generator')),
      body: Column(
        children: [
          Expanded(child: PDFViewer()), // PDF Preview Area
          CustomizationPanel(),        // Customization Panel
        ],
      ),
    );
  }
}
