import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:interview_project/view/phone_number_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneAuthBloc(),
      child: MaterialApp(
        home: PhoneNumberScreen(),
      ),
    );
  }
}
