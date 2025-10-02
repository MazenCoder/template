import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/repositories/{{name.lowerCase()}}_repository.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/models/{{name.lowerCase()}}_params.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';

part '{{name.lowerCase()}}_logic.g.dart';

@riverpod
class {{name.pascalCase()}}Logic extends _${{name.pascalCase()}}Logic {


  @override
  FutureOr<{{name.pascalCase()}}Entity> build() => getConcrete{{name.pascalCase()}}();


  Future<{{name.pascalCase()}}Entity> getConcrete{{name.pascalCase()}}() async {
    final repository = ref.read({{name.lowerCase()}}RepositoryProvider);
    //! TODO: Change this params as you need
    const params = {{name.pascalCase()}}Params(id: '', username: '');
    final result = await repository.getConcrete{{name.pascalCase()}}(params);
    return result.fold((l) => throw l.message, (r) {
      //! TODO: Implement Provider
      return r;
    });
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => getConcrete{{name.pascalCase()}}());
  }

  Future<{{name.pascalCase()}}Entity> load{{name.pascalCase()}}() async {
    final repository = ref.read({{name.lowerCase()}}RepositoryProvider);

    //! TODO: Change this params as you need
    const params = {{name.pascalCase()}}Params(id: '', username: '');
    final result = await repository.getConcrete{{name.pascalCase()}}(params);
    return result.fold((l) => throw l, (r) {
      //! TODO: Implement Provider
      return r;
    });
  }

  /* Eg: If you need to get item by id
  Future<{{name.pascalCase()}}Entity?> getConcrete{{name.pascalCase()}}ById(String id) async {
    final repository = ref.read({{name.lowerCase()}}RepositoryProvider);
    final result = await repository.getConcrete{{name.pascalCase()}}ById(id);
    return result.fold((l) => null, (r) => r);
  }


  Eg: If you need to manage list of items
  void add{{name.pascalCase()}}({{name.pascalCase()}}Entity entity) {
    final items = state.valueOrNull ?? [];
    state = const AsyncValue.loading();
    items.add(entity);
    state = AsyncValue.data(items);
  }

  Eg: If you need to manage list of items
  void update{{name.pascalCase()}}({{name.pascalCase()}}Entity entity) {
    final items = state.valueOrNull ?? [];
    if (items.isNotEmpty) {
      // state = const AsyncValue.loading();
      final i = items.indexWhere((element) => element.id == entity.id);
      if (i != -1) {
        items..removeAt(i)
          ..insert(i, entity);
      }
      state = AsyncValue.data(items);
    }
  }

  Eg: If you need to manage list of items
  void remove{{name.pascalCase()}}({{name.pascalCase()}}Entity entity) {
    final items = state.valueOrNull ?? [];
    if (items.isNotEmpty) {
      final i = items.indexWhere((element) => element.id == entity.id);
      if (i != -1) {
        items.removeAt(i);
      }
      state = AsyncValue.data(items);
    }
  }

  Eg: If you need to manage list of items
  void add{{name.pascalCase()}}s(List<{{name.pascalCase()}}Entity> entities) {
    final items = state.valueOrNull ?? [];
    // state = const AsyncValue.loading();
    items.addAll(entities);
    state = AsyncValue.data(items);
    // ref.notifyListeners();
  }
  */

}