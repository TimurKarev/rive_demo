import 'package:rive/rive.dart';
import 'package:rive_demo/internal/button_type.dart';

abstract class SpriteUseCase {
  Artboard? get artBoard;

  Future<bool> init();

  void buttonPressed(ButtonType type);
}
