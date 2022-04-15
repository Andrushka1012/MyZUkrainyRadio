import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzukrainy/core/domain/domain_models/word_press_post.dart';
import 'package:myzukrainy/core/domain/use_cases/wordpress_use_case.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(this._wordPressUseCase) : super(MainPageProcessing());

  final WordPressUseCase _wordPressUseCase;

  Future init() async {
    emit(MainPageProcessing());
    final postsResponse = await _wordPressUseCase.getNews();

    if (postsResponse.isSuccessful) {
      emit(MainPageDefault(postsResponse.requiredData));
    } else {
      emit(MainPageError(postsResponse.requiredError));
      emit(MainPageDefault(const []));
    }
  }
}
