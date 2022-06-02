import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzukrainy/core/domain/player/audio_handler.dart';
import 'package:myzukrainy/helpers/models/stations.dart';
import 'package:myzukrainy/helpers/preferences/preferences_provider.dart';

part 'nadajemy_home_state.dart';

class NadajemyHomeCubit extends Cubit<NadajemyHomeState> {
  NadajemyHomeCubit(
    this._preferencesProvider,
    this._audioPlayerHandler,
  ) : super(NadajemyHomeInitial());

  final PreferencesProvider _preferencesProvider;
  final AudioPlayerHandler _audioPlayerHandler;

  Future init() async {
    _preferencesProvider.selectedStation.value = Station.nadajemy.toString();
    await _audioPlayerHandler.init(Station.nadajemy);
  }
}
