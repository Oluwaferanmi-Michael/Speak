import 'package:flutter/material.dart';

import '../dialog_model.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends AlertModel{
  final void Function(Color color) onChanged;
  final Color pickerColor;
  ColorPickerDialog({
    required this.onChanged,
    required this.pickerColor
  }) : super(
    buttons: {
      'Done' : true
    },

    title: '',

    message: ColorPicker(
      pickerColor: pickerColor,
      onColorChanged: onChanged,
      labelTypes: const [],
      )
  );
}
