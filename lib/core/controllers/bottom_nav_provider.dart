
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavNotifier extends StateNotifier<int>{
  BottomNavNotifier() : super(0);

  void changeScreenValue(int currentValue){
    state = currentValue;
  }
}

StateNotifierProvider<BottomNavNotifier, int> bottomNavProvider = StateNotifierProvider(
  (ref) => BottomNavNotifier()
);
