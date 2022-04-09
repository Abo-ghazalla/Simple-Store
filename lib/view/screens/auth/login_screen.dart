import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:quantum_proj/config/app_router/routes_name.dart';
import 'package:quantum_proj/utils/helpers/snacks_and_dialogs.dart';
import 'package:quantum_proj/utils/helpers/validators.dart' as validators;
import 'package:quantum_proj/view/general_widgets/app_primarty_btn.dart';
import 'package:quantum_proj/view/general_widgets/app_text_filed.dart';
import 'package:quantum_proj/view/screens/auth/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter Email',
                labelText: 'Email',
                controller: _emailController,
                validator: validators.email,
              ),
              const SizedBox(height: 16),
              AppTextField(
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Enter Password',
                labelText: 'Password',
                controller: _passwordController,
                validator: validators.password,
              ),
              const SizedBox(height: 26),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (_, state) {
                  if (state is LoginDone) {
                    AppRouter.push(homeScreen, clean: true);
                  } else if (state is LoginError) {
                    showAppSnack(state.msg);
                  }
                },
                builder: (_, state) {
                  if (state is LoginLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return AppPrimaryButton(
                      text: "LOGIN",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                              _emailController.text, _passwordController.text);
                        }
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


//client@localhost