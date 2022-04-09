import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:flutter/material.dart';

void showAppSnack(String msg) {
  ScaffoldMessenger.of(AppRouter.appKey.currentState!.context)
      .hideCurrentSnackBar();
  ScaffoldMessenger.of(AppRouter.appKey.currentState!.context)
      .showSnackBar(SnackBar(content: Text(msg)));
}
