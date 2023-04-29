import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/domain/use_cases/sprite_use_case.dart';
import 'package:rive_demo/internal/button_type.dart';

class FootballerSpriteUseCase implements SpriteUseCase {
  FootballerSpriteUseCase({
    required this.asset,
  });

  final String asset;

  SMIInput<bool>? _jumpInput;
  SMIInput<double>? _speedInput;
  Artboard? _artBoard;

  @override
  Artboard? get artBoard => _artBoard;

  static const _stateMachine = 'State Machine';

  static const _jumpInputString = 'Jump';
  static const _speedInputString = 'Speed';

  @override
  Future<bool> init() async {
    final data = await rootBundle.load(asset);
    final file = RiveFile.import(data);
    _artBoard = file.mainArtboard;

    if (_artBoard != null) {
      final controller = StateMachineController.fromArtboard(
        _artBoard!,
        _stateMachine,
      );

      if (controller != null) {
        controller.isActive = true;
        _artBoard?.addController(controller);
        _jumpInput = controller.findInput<bool>(_jumpInputString);
        _speedInput = controller.findInput<double>(_speedInputString);
        _speedInput?.value = 0.0;
        return true;
      }
    }

    return false;
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
