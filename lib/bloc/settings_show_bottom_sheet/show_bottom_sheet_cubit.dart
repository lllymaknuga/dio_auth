import 'package:flutter_bloc/flutter_bloc.dart';

import 'show_bottom_sheet_state.dart';

class ShowBottomSheetCubit extends Cubit<ShowBottomSheetState> {
  ShowBottomSheetCubit() : super(DefaultState());

  void showBottomSheetRegistration() => emit(RegistrationState());
  void showBottomSheetDisableAds() => emit(DisableAdsState());
  void showBottomSheetFeedback() => emit(FeedbackState());
  void showBottomSheetSoundAccompant() => emit(SoundAccompanimentState());
}
