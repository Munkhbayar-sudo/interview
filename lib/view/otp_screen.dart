import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_event.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_state.dart';
import 'home_screen.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP')),
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is PhoneAuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: _otpController,
                decoration: InputDecoration(labelText: 'OTP'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PhoneAuthBloc>(context).add(
                    OTPSubmitted(_otpController.text),
                  );
                },
                child: Text('Үргэлжлүүлэх'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
