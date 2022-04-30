import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:myzukrainy/helpers/models/stations.dart';
import 'package:myzukrainy/helpers/preferences/preferences_provider.dart';

part 'splash_screen_cubit.freezed.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(
    this._preferencesProvider,
  ) : super(SplashScreenState.initial());

  final PreferencesProvider _preferencesProvider;

  Future init(Locale locale) async {
    await initAppServices();
    await Future.delayed(Duration(milliseconds: 1500));

    String selectedStationValue = _preferencesProvider.selectedStation.value;

    if (selectedStationValue.isEmpty) {
      if (locale.languageCode.toLowerCase().contains('pl')) {
        selectedStationValue = Station.pl.toString();
      } else {
        selectedStationValue = Station.myZUkrainy.toString();
      }
    }

    final selectedStation = StationExtension.fromString(selectedStationValue);

    _preferencesProvider.selectedStation.value = selectedStationValue;
    emit(
      SplashScreenState.ready(
        selectedStation: selectedStation,
      ),
    );
  }

  Future<void> initAppServices() async {
    await _preferencesProvider.initialize();
  }
}
