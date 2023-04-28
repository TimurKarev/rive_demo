import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/domain/use_cases/sprite_use_case.dart';
import 'package:rive_demo/internal/button_type.dart';

class FootballerSpriteUseCase implements SpriteUseCase {
  FootballerSpriteUseCase({
    required this.asset,
  });

  final String asset;

  SMIInput<bool>? _input;
  Artboard? _artBoard;

  @override
  Artboard? get artBoard => _artBoard;

  static const _stateMachine = 'FootballerStateMachine';

  static const _jumpInput = 'Jump';

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
        _input = controller.findInput(_jumpInput);
        return true;
      }
    }

    return false;
  }

  @override
  void buttonPressed(ButtonType type) {
    switch (type) {
      case ButtonType.walk:
        break;
      case ButtonType.run:
        break;
      case ButtonType.jump:
        _input?.value = true;
        break;
    }
  }
}
