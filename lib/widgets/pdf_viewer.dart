import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/resume_provider.dart';
import 'package:printing/printing.dart';

class PDFViewer extends ConsumerWidget {
  const PDFViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfDocument = ref.watch(pdfProvider);

    return pdfDocument.when(
      data: (document) => PdfPreview(build: (format) => document),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error loading PDF')),
    );
  }
}
