import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';
import 'package:speak/core/draw/providers/draw_provider.dart';
import 'package:speak/views/dialog/models/dialog_model.dart';

import '../../core/util/utils.dart';
import '../dialog/models/color_picker/color_picker.dart';
import 'components/floating_button_widgets.dart';



class Draw extends HookConsumerWidget {
  const Draw({
    super.key,
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final notifier = ref.watch(drawProvider.notifier);
    final colorState = useState(primaryPink);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              child: Scribble(
              notifier: notifier,
              ),
            ),
            Align(
                alignment: const Alignment(.85, 0),
               child: FloatingButtonWidget(
                  icon: const Icon(Icons.clear_all_rounded),
                  onPressed: () => notifier.setEraser()),
                ),
              
      
            Align(
                alignment: const Alignment(.845, .6),
              child: FloatingButtonWidget(
                backgroundColor: colorState.value,
                onPressed: () => ColorPickerDialog(
                  pickerColor: primaryPink,
                  onChanged: (color) {
                    colorState.value = color;
                    notifier.setColor(color);
                }
                ).present(context,),
              ),
            ),
            
            ]
            
          ),
      ),
    );
  }
}