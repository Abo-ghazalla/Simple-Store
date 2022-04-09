import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:quantum_proj/config/app_router/routes_name.dart';
import 'package:quantum_proj/utils/helpers/snacks_and_dialogs.dart';
import 'package:quantum_proj/view/screens/auth/cubit/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (_, state) {
        if (state is LogoutDone) {
          AppRouter.push(loginScreen, clean: true);
          showAppSnack(state.msg);
        } else if (state is LogoutError) {
          showAppSnack(state.msg);
        }
      },
      builder: (context, state) {
        return ListTile(
          onTap: state is LogoutLoading
              ? null
              : () {
                  context.read<AuthCubit>().logout();
                },
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
        );
      },
    );
  }
}
