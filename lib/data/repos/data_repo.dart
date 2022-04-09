part of 'imports.dart';

Future<Either<List<Product>, Failure>> getProduct({int? id}) async {
  final apiService = getIt<APIService>();
  final res = await apiService.get(
    path: 'products/${id ?? ''}',
  );

  if (res.isLeft()) {
    final Response resp = (res as Left).value;
    BaseListedResponse<Product> authData =
        BaseListedResponse.fromJson(resp.data, Product());

    return Left(authData.data);
  } else {
    return Right(Failure((res as Right).value));
  }
}

Future<Either<List<CategoryModel>, Failure>> getCategories({int? id}) async {
  final apiService = getIt<APIService>();
  final res = await apiService.get(
    path: 'categories/${id ?? ''}',
  );

  if (res.isLeft()) {
    final Response resp = (res as Left).value;
    BaseListedResponse<CategoryModel> authData =
        BaseListedResponse.fromJson(resp.data, CategoryModel());

    return Left(authData.data);
  } else {
    return Right(Failure((res as Right).value));
  }
}
