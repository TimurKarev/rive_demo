import 'package:dartz/dartz.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/internal/button_type.dart';

abstract class SpriteController {
  Future<Option<Artboard>> init();

  void buttonPressed(ButtonType type);
}
