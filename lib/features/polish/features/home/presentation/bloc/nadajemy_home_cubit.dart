import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myzukrainy/helpers/models/stations.dart';
import 'package:myzukrainy/helpers/preferences/preferences_provider.dart';

part 'nadajemy_home_state.dart';

class NadajemyHomeCubit extends Cubit<NadajemyHomeState> {
  NadajemyHomeCubit(this._preferencesProvider) : super(NadajemyHomeInitial());

  final PreferencesProvider _preferencesProvider;

  Future init() async {
    _preferencesProvider.selectedStation.value = Station.nadajemy.toString();
  }
}
