// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import 'package:lil_loop/utils/lil_loop_color_types_enum.dart';
import 'package:lil_loop/utils/lil_loop_typedefs.dart';

class ColorPickerDialog extends StatelessWidget {
  final OnColorSelected onColorSelected;
  final LilLoopColorTypes colorType;
  final Color currentColor;
  const ColorPickerDialog({
    Key? key,
    required this.onColorSelected,
    required this.colorType,
    required this.currentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ColorPicker(
        // Use the screenPickerColor as start color.
        color: currentColor,
        // Update the screenPickerColor using the callback.
        onColorChanged: (Color color) {
          onColorSelected(colorType, color);
          Navigator.pop(context);
        },

        width: 44,
        height: 44,
        borderRadius: 22,
        heading: const Text(
          'Select color',
        ),
        subheading: Text(
          'Select color shade',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
