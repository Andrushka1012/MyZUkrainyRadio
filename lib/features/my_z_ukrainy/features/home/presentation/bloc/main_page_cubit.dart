import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/models/word_press_post.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/use_cases/wordpress_use_case.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(this._wordPressUseCase) : super(MainPageProcessing());

  final FetchMyZUkrainyNews _wordPressUseCase;

  Future init() async {
    emit(MainPageProcessing());
    final postsResponse = await _wordPressUseCase.executeSafety();

    postsResponse.fold(
      onSuccess: (news) => emit(MainPageDefault(news)),
      onError: (error) {
        emit(MainPageError(postsResponse.requiredError));
        emit(MainPageDefault(const []));
      },
    );
  }
}
