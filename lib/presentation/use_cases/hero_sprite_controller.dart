import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/domain/controllers/sprite_controller.dart';
import 'package:rive_demo/internal/button_type.dart';

class HeroSpriteController implements SpriteController {
  HeroSpriteController({
    required this.asset,
  });

  final String asset;

  SMIInput<bool>? _jumpInput;
  SMIInput<double>? _speedInput;

  static const _stateMachineName = 'State Machine';

  static const _jumpInputString = 'Jump';
  static const _speedInputString = 'Speed';

  @override
  Future<Option<Artboard>> init() async {
    final data = await rootBundle.load(asset);
    final file = RiveFile.import(data);

    try {
      Artboard artBoard = file.mainArtboard;

      final controller = StateMachineController.fromArtboard(
        artBoard,
        _stateMachineName,
      );

      if (controller != null) {
        controller.isActive = true;
        artBoard.addController(controller);
        _jumpInput = controller.findInput<bool>(_jumpInputString);
        _speedInput = controller.findInput<double>(_speedInputString);
        _speedInput?.value = 0.0;
        return some(artBoard);
      }
    } on StateError catch (_) {
      return none();
    }

    return none();
  }

  @override
  void buttonPressed(ButtonType type) {
    switch (type) {
      case ButtonType.walk:
        _speedInput?.value = 1.0;
        break;
      case ButtonType.run:
        _speedInput?.value = 2.0;
        break;
      case ButtonType.jump:
        _jumpInput?.value = true;
        break;
      case ButtonType.stop:
        _speedInput?.value = 0.0;
        break;
    }
  }
}
