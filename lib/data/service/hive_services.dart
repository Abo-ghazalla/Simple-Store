import 'package:quantum_proj/utils/constants/app_const.dart' as constant;
import 'package:hive/hive.dart';

dynamic readFromCache(String key) {
  return Hive.box(constant.appCacheMemoryBoxName).get(key);
}

Future<void> writeInCache(String key, dynamic value) async {
  await Hive.box(constant.appCacheMemoryBoxName).put(key, value);
}

Future<void> clearMemory() async {
  await Hive.box(constant.appCacheMemoryBoxName).clear();
}

String? get readToken => readFromCache(constant.tokenKey);




Future<void> writeToken(String userToken) async {
  await writeInCache(constant.tokenKey, userToken);
}
