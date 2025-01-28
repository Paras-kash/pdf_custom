import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/resume_provider.dart';

class CustomizationPanel extends ConsumerStatefulWidget {
  const CustomizationPanel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomizationPanelState createState() => _CustomizationPanelState();
}

class _CustomizationPanelState extends ConsumerState<CustomizationPanel> {
  bool _isMinimized = false; // State to track panel visibility

  @override
  Widget build(BuildContext context) {
    final resumeState = ref.watch(resumeProvider);
    final notifier = ref.read(resumeProvider.notifier);

    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Customization Panel
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _isMinimized ? 50 : 300, // Adjust height based on state
            padding: EdgeInsets.all(16),
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
            child: _isMinimized
                ? Center(
                    child: Text(
                      "Expand to Customize",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customize Your Resume",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[900],
                                  ),
                        ),
                        const SizedBox(height: 16),

                        // Customization Options
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Font Size",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Slider(
                                      value: resumeState.fontSize,
                                      min: 5,
                                      max: 30,
                                      divisions: 20,
                                      label: "${resumeState.fontSize.toInt()}",
                                      onChanged: (newValue) {
                                        notifier.updateFontSize(newValue);
                                      },
                                    ),
                                    Text(
                                      "${resumeState.fontSize.toInt()} pt",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
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
                                  onColorSelected:
                                      notifier.updateBackgroundColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),

          // Toggle Button (Always Visible at Top-Right)
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.blueGrey[900],
              onPressed: () {
                setState(() {
                  _isMinimized = !_isMinimized; // Toggle panel state
                });
              },
              child: Icon(
                _isMinimized
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white,
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
