import 'helpers/fetch_helpers.dart';

abstract class UseCaseWithArguments<Type, Params> {
  Future<Type> execute(Params params);

  Future<SafeResponse<Type>> callSafety(Params params) => fetchSafety(() => execute(params));
}

abstract class UseCase<Type> {
  Future<Type> execute();

  Future<SafeResponse<Type>> executeSafety() => fetchSafety(() => execute());
}
