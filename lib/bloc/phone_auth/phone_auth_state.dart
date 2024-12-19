import 'package:equatable/equatable.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object> get props => [];
}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthSuccess extends PhoneAuthState {}

class PhoneAuthFailure extends PhoneAuthState {
  final String error;

  const PhoneAuthFailure(this.error);

  @override
  List<Object> get props => [error];
}
