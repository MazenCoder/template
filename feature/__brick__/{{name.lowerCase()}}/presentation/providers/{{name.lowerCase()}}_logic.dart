import 'package:sawwlnjawwb/features/posts/presentation/providers/more_posts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/post_repository.dart';
import '../../domain/entities/post_entity.dart';
import 'filters/filter_post.dart';


part 'posts_event.g.dart';

@Riverpod(keepAlive: true)
class {{name.pascalCase()}}Logic extends _${{name.pascalCase()}}Logic {


  @override
  FutureOr<{{name.pascalCase()}}Entity> build() => getConcrete{{name.pascalCase()}}();


  Future<{{name.pascalCase()}}Entity> getConcrete{{name.pascalCase()}}() async {
    final repository = ref.read({{name.lowerCase()}}RepositoryProvider);
    final result = await repository.getConcrete{{name.pascalCase()}}(params);
    return result.fold((l) => throw l.message, (r) {
      //! TODO: Implement Provider
      return r;
    });
  }

  Future<void> reload{{name.pascalCase()}}() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => load{{name.pascalCase()}}());
  }

  Future<List<PostAuthorEntity>> load{{name.pascalCase()}}() async {
    final repository = ref.read(postRepositoryProvider);
    final result = await repository.getConcrete{{name.pascalCase()}}(filter);
    return result.fold((l) => throw l, (r) {
      //! TODO: Implement Provider
      return r;
    });
  }

  Future<{{name.pascalCase()}}Entity?> getConcrete{{name.pascalCase()}}ById(String id) async {
    final repository = ref.read({{name.lowerCase()}}RepositoryProvider);
    final result = await repository.getConcrete{{name.pascalCase()}}ById(id);
    return result.fold((l) => null, (r) => r);
  }

  /*
  void add{{name.pascalCase()}}({{name.pascalCase()}}Entity entity) {
    final items = state.valueOrNull ?? [];
    state = const AsyncValue.loading();
    items.add(entity);
    state = AsyncValue.data(items);
  }

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

  void add{{name.pascalCase()}}s(List<{{name.pascalCase()}}Entity> entities) {
    final items = state.valueOrNull ?? [];
    // state = const AsyncValue.loading();
    items.addAll(entities);
    state = AsyncValue.data(items);
    // ref.notifyListeners();
  }
  */

}