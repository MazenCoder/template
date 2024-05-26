import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/boxes.dart';
import 'package:hive/hive.dart';

part 'local_storage.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
LocalStorage localStorage(LocalStorageRef ref) {
  return LocalStorage(
    box: Boxes.settings(),
  );
}


abstract class ILocalStorage {
  Future<void> putData({
    required String key,
    required Object value,
  });

  Future<int> clearAll();
  Future<void> deleteKey({required String key});
  FutureOr<dynamic>? getData({
    required String key,
    Object? defaultValue,
  });
}




class LocalStorage implements ILocalStorage {

  LocalStorage({required this.box});

  final Box<dynamic> box;

  @override
  Future<int> clearAll() => box.clear();

  @override
  Future<void> deleteKey({required String key}) => box.delete(key);

  @override
  FutureOr<dynamic>? getData({required String key, Object? defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> putData({required String key, required Object value}) {
    return box.put(key, value);
  }

}