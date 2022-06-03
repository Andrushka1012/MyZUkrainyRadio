import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:myzukrainy/core/presentation/widgets/back_button.dart';
import 'package:myzukrainy/core/presentation/widgets/mini_player/cover_disc.dart';
import 'package:myzukrainy/core/presentation/widgets/play_pause_button.dart';
import 'package:myzukrainy/core/presentation/widgets/share_button.dart';
import 'package:myzukrainy/helpers/models/stations.dart';
import 'package:myzukrainy/helpers/size_helpers.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:volume_controller/volume_controller.dart';

class PlayerPage extends StatelessWidget {
  static const routeName = 'PlayerPage';

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.headerColor,
        body: PlayerForm(
          station: Station.myZUkrainy,
        ),
      );
}

class PlayerForm extends StatelessWidget {
  const PlayerForm({required this.station});

  final Station station;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.spanBig),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      if (station == Station.myZUkrainy) CircleBackButton(),
                      Spacer(),
                      CircleShareButton(station: station,),
                    ],
                  ),
                  Center(
                    child: _VolumeControllerWithCover(
                      size: MediaQuery.of(context).size.width * 0.8,
                      station: station,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: Dimens.spanSmall,
                        left: Dimens.spanBig,
                        right: Dimens.spanBig,
                      ),
                      child: Text(
                        station.translation.tr(),
                        style: AppTextStyles.headline,
                      ),
                    ),
                  ),
                  if (station == Station.myZUkrainy) Text('🇵🇱 ❤️ 🇺🇦'),
                  if (!MediaQuery.of(context).isSmallScreen) _StreamAnimation(),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Center(
                  child: PlayPauseButton(
                size: Dimens.spanGiant,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class _StreamAnimation extends StatefulWidget {
  const _StreamAnimation({Key? key}) : super(key: key);

  @override
  _StreamAnimationState createState() => _StreamAnimationState();
}

class _StreamAnimationState extends State<_StreamAnimation> with SingleTickerProviderStateMixin {
  late final PlayerController _playerController = get();
  late final AnimationController _animationController;
  late final StreamSubscription playbackSubscription;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Lottie.asset(
        'assets/images/23807-waveform.json',
        controller: _animationController,
        onLoaded: (composition) {
          _animationController.duration = composition.duration;
          playbackSubscription = _playerController.isPlayingStream.listen((isPlaying) {
            if (isPlaying) {
              _animationController.repeat();
            } else {
              _animationController.stop();
            }
          });
        },
        reverse: true,
      );

  @override
  void dispose() {
    playbackSubscription.cancel();
    _animationController.dispose();
    super.dispose();
  }
}

class _VolumeControllerWithCover extends StatefulWidget {
  static const _coverSizeRatio = 0.85;

  const _VolumeControllerWithCover({
    required this.size,
    required this.station,
    Key? key,
  }) : super(key: key);

  final double size;
  final Station station;

  @override
  State<_VolumeControllerWithCover> createState() => _VolumeControllerWithCoverState();
}

class _VolumeControllerWithCoverState extends State<_VolumeControllerWithCover> {
  late final StreamSubscription volumeLevelSubscription;

  final VolumeController _volumeController = VolumeController();

  double _volumeLevel = 0.0;
  bool _listenForVolumeChanges = true;
  Timer? _listenForVolumeChangesTimer;

  @override
  void initState() {
    volumeLevelSubscription = _volumeController.listener((value) {
      if (_listenForVolumeChanges) {
        setState(() {
          _volumeLevel = value;
        });
      }
    });
    _volumeController.getVolume().then((value) {
      setState(() {
        _volumeLevel = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: widget.size * _VolumeControllerWithCover._coverSizeRatio,
                height: widget.size * _VolumeControllerWithCover._coverSizeRatio,
                child: CoverDisc(
                  size: widget.size * _VolumeControllerWithCover._coverSizeRatio,
                  station: widget.station,
                  withHero: widget.station == Station.myZUkrainy,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: 180 * 3.14 / 180,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    startAngle: 0,
                    angleRange: 180,
                    size: widget.size,
                    animationEnabled: false,
                    counterClockwise: true,
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      handlerSize: 12,
                      trackWidth: 6,
                    ),
                    customColors: CustomSliderColors(
                      dotColor: AppColors.white,
                      dynamicGradient: false,
                      trackColor: AppColors.grayTrack,
                      progressBarColors: widget.station.colors,
                    ),
                  ),
                  max: 1,
                  initialValue: _volumeLevel,
                  innerWidget: (_) => Container(),
                  min: 0,
                  onChange: (newValue) {
                    _listenForVolumeChanges = false;
                    _volumeController.setVolume(newValue, showSystemUI: false);
                    _listenForVolumeChangesTimer?.cancel();
                    _listenForVolumeChangesTimer = Timer(Duration(milliseconds: 200), () {
                      _listenForVolumeChanges = true;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1.04, -0.2),
              child: Icon(
                Icons.volume_off_rounded,
                color: AppColors.gray,
              ),
            ),
            Align(
              alignment: Alignment(1.04, -0.2),
              child: Icon(
                Icons.volume_up_rounded,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    volumeLevelSubscription.cancel();
    _volumeController.removeListener();
    super.dispose();
  }
}
