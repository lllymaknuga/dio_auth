import 'package:flutter_bloc/flutter_bloc.dart';

import 'sound_accompanation_state.dart';

class SoundAccompanimentCubit extends Cubit<SoundsAccompanationState> {
  SoundAccompanimentCubit() : super(SoundState());

  void changeMute() => emit(MuteState());
  void changeSound() => emit(SoundState());
  void changeVibration() => emit(VibrationState());
}
