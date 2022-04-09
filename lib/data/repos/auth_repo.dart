part of 'imports.dart';

Future<Either<AuthResponse, Failure>> login(String email, String pass) async {
  final apiService = getIt<APIService>();
  final res = await apiService.post(
    path: 'login',
    body: {'email': email, 'password': pass},
  );

  if (res.isLeft()) {
    final Response resp = (res as Left).value;
    BaseSingleResponse<AuthResponse> authData =
        BaseSingleResponse.fromJson(resp.data, AuthResponse());
    if (authData.data!.message == null) {
      await hive_services.writeToken(authData.data!.token!);
      apiService.setHeaderToken();
    }

    return Left(authData.data!);
  } else {
    return Right(Failure((res as Right).value));
  }
}

Future<Either<AuthResponse, Failure>> logout() async {
  final apiService = getIt<APIService>();
  final res = await apiService.post(
    path: 'logout',
  );

  if (res.isLeft()) {
    final Response resp = (res as Left).value;
    BaseSingleResponse<AuthResponse> authData =
        BaseSingleResponse.fromJson(resp.data, AuthResponse());
    if (authData.data!.message != null) {
      await hive_services.clearMemory();
      apiService.resetHeaderToken();
    }

    return Left(authData.data!);
  } else {
    return Right(Failure((res as Right).value));
  }
}

Future<Either<User, Failure>> getUserData() async {
  final apiService = getIt<APIService>();
  final res = await apiService.get(
    path: 'user',
  );

  if (res.isLeft()) {
    final Response resp = (res as Left).value;
    BaseSingleResponse<User> userData =
        BaseSingleResponse.fromJson(resp.data, User());
    await hive_services.writeInCache(userKey, json.encode(userData.data!.toJson()));

    return Left(userData.data!);
  } else {
    return Right(Failure((res as Right).value));
  }
}
