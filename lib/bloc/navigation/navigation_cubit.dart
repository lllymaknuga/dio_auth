import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(GoogleState());

  void showAdversingScreen() => emit(AdversingState());
  void showChatScreen() => emit(ChatState());
  void showGoogleMapScreen() => emit(GoogleState());
  void showSettingsgScreen() => emit(SettingsState());
}
 