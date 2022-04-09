import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/view/screens/auth/cubit/auth_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('User'),
              Text("Name: ${user.name!}"),
              Text("Email: ${user.email!}"),
              Text("Id: ${user.id!}"),
            ],
          ),
        ),
      ),
    );
  }
}
