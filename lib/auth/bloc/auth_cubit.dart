import 'package:antigai/auth/bloc/auth_cubit_state.dart';
import 'package:antigai/dio/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState(status: Status.init));
  final ApiClient _dio = ApiClient();

  Future<void> authorization() async {
    // ignore: avoid_print
    print("${state.password}, ${state.email}");
    emit(state.copyWith(status: Status.loading));
    try {
      await _dio.createUser(email: state.email, passwrod: state.password);
      emit(state.copyWith(status: Status.success));
    } on DioError catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
