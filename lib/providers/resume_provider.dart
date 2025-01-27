import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/pdf_generator.dart';

final resumeProvider = StateNotifierProvider<ResumeNotifier, ResumeState>(
  (ref) => ResumeNotifier(),
);

final pdfProvider = FutureProvider.autoDispose((ref) async {
  final state = ref.watch(resumeProvider);
  return generatePDF(state);
});

class ResumeState {
  final double fontSize;
  final Color fontColor;
  final Color backgroundColor;

  ResumeState({
    required this.fontSize,
    required this.fontColor,
    required this.backgroundColor,
  });

  ResumeState copyWith({
    double? fontSize,
    Color? fontColor,
    Color? backgroundColor,
  }) {
    return ResumeState(
      fontSize: fontSize ?? this.fontSize,
      fontColor: fontColor ?? this.fontColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

class ResumeNotifier extends StateNotifier<ResumeState> {
  ResumeNotifier()
      : super(ResumeState(
          fontSize: 14,
          fontColor: Colors.black,
          backgroundColor: Colors.white,
        ));

  void updateFontSize(double size) => state = state.copyWith(fontSize: size);

  void updateFontColor(Color color) => state = state.copyWith(fontColor: color);

  void updateBackgroundColor(Color color) =>
      state = state.copyWith(backgroundColor: color);
}
