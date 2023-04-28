import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/domain/use_cases/sprite_use_case.dart';
import 'package:rive_demo/internal/button_type.dart';

part 'sprite_event.dart';
part 'sprite_state.dart';

class SpriteBloc extends Bloc<SpriteEvent, SpriteState> {
  SpriteBloc({
    required SpriteUseCase spriteUseCase,
  })  : _useCase = spriteUseCase,
        super(const SpriteInitialState()) {
    on<StartedSpriteEvent>(_onStarted);
    on<ButtonPressedSpriteEvent>(_onButtonPressed);

    add(const StartedSpriteEvent());
  }

  final SpriteUseCase _useCase;

  Future<void> _onStarted(
    StartedSpriteEvent event,
    Emitter<SpriteState> emitter,
  ) async {
    emitter(const SpriteLoadingState());
    final init = await _useCase.init();
    final artBoard = _useCase.artBoard;
    if (init && artBoard != null) {
      emitter(
        SpriteReadyState(artBoard: artBoard),
      );
    } else {
      emitter(
        const SpriteErrorState(message: 'Animation not initialized'),
      );
    }
  }

  Future<void> _onButtonPressed(
    ButtonPressedSpriteEvent event,
    Emitter<SpriteState> emitter,
  ) async =>
      _useCase.buttonPressed(event.buttonType);
}
