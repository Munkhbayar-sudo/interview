import 'package:bloc/bloc.dart';
import 'phone_auth_event.dart';
import 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  PhoneAuthBloc() : super(PhoneAuthInitial()) {
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<OTPSubmitted>(_onOTPSubmitted);
  }

  void _onPhoneNumberSubmitted(
      PhoneNumberSubmitted event, Emitter<PhoneAuthState> emit) async {
    emit(PhoneAuthLoading());
    // Simulate a network call
    await Future.delayed(Duration(seconds: 1));
    emit(PhoneAuthSuccess());
  }

  void _onOTPSubmitted(OTPSubmitted event, Emitter<PhoneAuthState> emit) async {
    emit(PhoneAuthLoading());
    // Simulate OTP verification
    await Future.delayed(Duration(seconds: 1));
    emit(PhoneAuthSuccess());
  }
}
