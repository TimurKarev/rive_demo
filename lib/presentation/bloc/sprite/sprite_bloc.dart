import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/domain/controllers/sprite_controller.dart';
import 'package:rive_demo/internal/button_type.dart';

part 'sprite_event.dart';
part 'sprite_state.dart';

// Bloc for Sprite state management, argument is controller for control exact type of Sprite
class SpriteBloc extends Bloc<SpriteEvent, SpriteState> {
  SpriteBloc({
    required SpriteController spriteController,
  })  : _spriteController = spriteController,
        super(const SpriteInitialState()) {
    on<StartedSpriteEvent>(_onStarted);
    on<ButtonPressedSpriteEvent>(_onButtonPressed);

    add(const StartedSpriteEvent());
  }

  final SpriteController _spriteController;

  Future<void> _onStarted(
    StartedSpriteEvent event,
    Emitter<SpriteState> emitter,
  ) async {
    emitter(const SpriteLoadingState());

    final response = await _spriteController.init();
    response.fold(
      () => emitter(
        const SpriteErrorState(message: 'Animation not initialized'),
      ),
      (artBoard) => emitter(
        SpriteReadyState(artBoard: artBoard),
      ),
    );
  }

  // TODO: Move tracking buttons to separate Bloc
  Future<void> _onButtonPressed(
    ButtonPressedSpriteEvent event,
    Emitter<SpriteState> emitter,
  ) async =>
      _spriteController.buttonPressed(event.buttonType);
}
