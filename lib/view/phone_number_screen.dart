import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_event.dart';
import 'package:interview_project/bloc/phone_auth/phone_auth_state.dart';
import 'otp_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Утасны дугаар')),
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(),
              ),
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
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Утасны дугаар'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PhoneAuthBloc>(context).add(
                    PhoneNumberSubmitted(_phoneController.text),
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
