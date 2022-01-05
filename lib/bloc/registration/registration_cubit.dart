import 'package:flutter_bloc/flutter_bloc.dart';

import '../registration/registrarion_state.dart';

class RegistrationCubit extends Cubit<RegistrationPhoneState> {
  RegistrationCubit() : super(InputState());

  void showRegistrationAccept() => emit(AcceptState());
}
