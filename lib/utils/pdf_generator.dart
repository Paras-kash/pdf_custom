import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../providers/resume_provider.dart';

Future<Uint8List> generatePDF(ResumeState state) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets
          .zero, // Remove default margins to ensure full-page background
      build: (context) => pw.Stack(
        children: [
          // Background Color
          pw.Container(
            width: double.infinity,
            height: double.infinity,
            color: PdfColor.fromInt(state.backgroundColor.value),
          ),

          // Content of the Resume
          pw.Padding(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header Section
                pw.Text(
                  'John Doe',
                  style: pw.TextStyle(
                    fontSize: state.fontSize + 4,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  'Email: john.doe@example.com | Phone: +1 234 567 8900',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'LinkedIn: linkedin.com/in/johndoe | GitHub: github.com/johndoe',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),

                pw.SizedBox(height: 16),

                // Skills Section
                pw.Text(
                  'Skills',
                  style: pw.TextStyle(
                    fontSize: state.fontSize + 2,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Cloud Computing (AWS, Azure, GCP)',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'DevOps (Docker, Kubernetes, CI/CD Pipelines)',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Programming Languages (Python, Java, Go)',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),

                pw.SizedBox(height: 16),

                // Education Section
                pw.Text(
                  'Education',
                  style: pw.TextStyle(
                    fontSize: state.fontSize + 2,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Master of Computer Science',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'University of Technology, 2020 - 2022',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'Relevant Courses: Cloud Infrastructure, Distributed Systems, Data Security',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),

                pw.SizedBox(height: 16),

                // Work Experience Section
                pw.Text(
                  'Work Experience',
                  style: pw.TextStyle(
                    fontSize: state.fontSize + 2,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Cloud Engineer - Tech Solutions Inc.',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  '2022 - Present',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text:
                      'Designed and deployed scalable AWS architectures for enterprise clients.',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Implemented CI/CD pipelines using Jenkins and GitLab.',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text:
                      'Migrated legacy systems to cloud-based infrastructure.',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return Uint8List.fromList(await pdf.save());
}
