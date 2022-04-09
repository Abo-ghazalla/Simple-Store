import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quantum_proj/data/models/user_model.dart';
import 'package:quantum_proj/data/repos/imports.dart' as auth_repo;
import 'package:quantum_proj/data/service/hive_services.dart';
import 'package:quantum_proj/utils/constants/resources.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  User? _user;
  User get user => _user!;
  AuthCubit() : super(LoginInitial());

  Future<void> login(String email, String pass) async {
    emit(LoginLoading());

    final resp = await auth_repo.login(email, pass);
    resp.fold(
      (authResp) async {
        if (authResp.message != null) {
          emit(LoginError(authResp.message!));
        } else {
          final userResp = await auth_repo.getUserData();
          userResp.fold(
            (user) {
              setUser(user);
              emit(LoginDone());
            },
            (fail) => emit(LoginError(fail.msg)),
          );
        }
      },
      (failure) => emit(LoginError(failure.msg)),
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    final res = await auth_repo.logout();
    res.fold(
      (authResp) {
        if (authResp.message == null) {
          emit(const LogoutError(normalErrorMsg));
        } else {
          emit(LogoutDone(authResp.message!));
        }
      },
      (failure) => emit(LogoutError(failure.msg)),
    );
  }

  void setUser(User userData) {
    _user = userData;
  }

  void initUser() {
    String? userData = readFromCache(userKey);
    debugPrint('userData: $userData');
    if (userData != null) {
      _user = User.fromJson(json.decode(userData));
    }
  }
}
