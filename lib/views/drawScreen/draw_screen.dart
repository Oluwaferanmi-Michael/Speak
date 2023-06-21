import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';
import 'package:speak/core/draw/providers/draw_provider.dart';
import 'package:speak/views/dialog/models/color_picker/poviders/color_change_provider.dart';
import 'package:speak/views/dialog/models/dialog_model.dart';

import '../../core/util/utils.dart';
import '../dialog/models/color_picker/color_picker.dart';
import 'components/floating_button_widgets.dart';

class Draw extends ConsumerWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(drawProvider.notifier);
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              child: Scribble(
              notifier: notifier,
              ),
            ),
            Align(
                alignment: const Alignment(.84, 0),
               child: FloatingButtonWidget(
                  icon: const Icon(Icons.clear_all_rounded),
                  onPressed: () => notifier.setEraser()),
                ),
              
      
            Align(
                alignment: const Alignment(.84, .6),
              child: FloatingButtonWidget(
                // backgroundColor: ,
                onPressed: () => ColorPickerDialog(
                  pickerColor: primaryPink,
                  onChanged: (color) {
                    ref.watch(colorChangeProvider(color));
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