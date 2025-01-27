import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/resume_provider.dart';

class CustomizationPanel extends ConsumerWidget {
  const CustomizationPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumeState = ref.watch(resumeProvider);
    final notifier = ref.read(resumeProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customize Your Resume",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
          ),
          const SizedBox(height: 16),

          // Customization Options Group
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Font Size Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Font Size",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            "${resumeState.fontSize.toInt()}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Slider(
                    value: resumeState.fontSize,
                    min: 10,
                    max: 30,
                    divisions: 20,
                    label: resumeState.fontSize.toInt().toString(),
                    onChanged: (newFontSize) {
                      notifier.updateFontSize(newFontSize);
                    },
                  ),

                  const Divider(),

                  // Font Color Picker
                  _colorPickerRow(
                    context,
                    title: "Font Color",
                    currentColor: resumeState.fontColor,
                    onColorSelected: notifier.updateFontColor,
                  ),

                  const Divider(),

                  // Background Color Picker
                  _colorPickerRow(
                    context,
                    title: "Background Color",
                    currentColor: resumeState.backgroundColor,
                    onColorSelected: notifier.updateBackgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorPickerRow(
    BuildContext context, {
    required String title,
    required Color currentColor,
    required Function(Color) onColorSelected,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        GestureDetector(
          onTap: () => _showColorPicker(context, currentColor, onColorSelected),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: currentColor,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  void _showColorPicker(
    BuildContext context,
    Color initialColor,
    Function(Color) onColorSelected,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        Color selectedColor = initialColor;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.blueGrey, width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pick a Color",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: initialColor,
                    onColorChanged: (color) => selectedColor = color,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    ElevatedButton(
                      child: Text("Select"),
                      onPressed: () {
                        onColorSelected(selectedColor);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
