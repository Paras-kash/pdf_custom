// ignore_for_file: deprecated_member_use

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

          pw.Padding(
            padding: pw.EdgeInsets.all(24),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header Section
                pw.Text(
                  'Paras',
                  style: pw.TextStyle(
                    fontSize: state.fontSize + 4,
                    fontWeight: pw.FontWeight.bold,
                    
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  'FLUTTER DEVELOPER (INTERNSHIP SEEKER)',
                  style: pw.TextStyle(
                    fontSize: state.fontSize + 4,
                    fontWeight: pw.FontWeight.bold,

                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),

                pw.Text(
                  '+91 70877-73281 · paraskashyap2006@gmail.com · Chandigarh, India',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,

                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                  'A motivated and eager-to-learncolor: PdfColor.fromInt(state.fontColor.value), Flutter developer seeking an internship opportunity to gain practical experience and enhance skills in mobile app development. Strong foundational knowledge of Flutter and Dart, with a keen interest in building cross-platform mobile applications. Adept at problem-solving, communication, and working collaboratively in a team environment. Eager to contribute to real-world projects while continuing to grow and refine technical expertise.',
                  style: pw.TextStyle(

                    color: PdfColor.fromInt(state.fontColor.value),
                    fontSize: state.fontSize,
                  ),
                ),
                pw.SizedBox(height: 16),

                // Key Competencies Section
                pw.Text(
                  'KEY COMPETENCIES',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Flutter & Dart Development',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Mobile App Development',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Problem Solving & Debugging',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Strong Communication Skills',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Team Collaboration & Adaptability',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Divider(color: PdfColor.fromInt(state.fontColor.value)),
                pw.SizedBox(height: 16),

                // Education Section
                pw.Text(
                  'EDUCATION',
                  style: pw.TextStyle(
                    color: PdfColor.fromInt(state.fontColor.value),
                    fontSize: state.fontSize + 4,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  'Bachelor of Computer Application',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Chandigarh University, Chandigarh, India',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Passing Year: 2027',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  'Senior Secondary School',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Government Senior Secondary School, Guru Har Sahai, Punjab',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Passing Year: 2024 | Scored: 86%',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  'Higher Secondary School',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Government Senior Secondary School, Guru Har Sahai, Punjab',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Text(
                  'Passing Year: 2023 | Scored: 84%',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Divider(color: PdfColor.fromInt(state.fontColor.value)),
                pw.SizedBox(height: 16),

                // Personal Details Section
                pw.Text(
                  'PERSONAL DETAILS',
                  style: pw.TextStyle(
                    color: PdfColor.fromInt(state.fontColor.value),
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 3),
                pw.Text(
                  'Date of Birth: 04.10.2006',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 4),

                pw.Text(
                  'Eligible to Work in: India',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'Total Years of Experience: 0',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Divider(color: PdfColor.fromInt(state.fontColor.value)),
                pw.SizedBox(height: 16),
                pw.Text(
                  'Skills / IT Skills',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Problem Solving',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Strong Communication Skills',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Dart',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Critical Thinking',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Team Collaboration & Adaptability',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Flutter Development',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Microsoft Office',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.Bullet(
                  text: 'Creativity',
                  style: pw.TextStyle(
                    fontSize: state.fontSize,
                    color: PdfColor.fromInt(state.fontColor.value),
                  ),
                ),
                pw.SizedBox(height: 8)
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return Uint8List.fromList(await pdf.save());
}
