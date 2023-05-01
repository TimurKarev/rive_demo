part of 'sprite_bloc.dart';

abstract class SpriteEvent extends Equatable {
  const SpriteEvent();

  @override
  List<Object?> get props => [];
}

// Start bloc event
class StartedSpriteEvent extends SpriteEvent {
  const StartedSpriteEvent();
}

// TODO: Move to GameController Bloc (not exist)
// Button pressed event
class ButtonPressedSpriteEvent extends SpriteEvent {
  const ButtonPressedSpriteEvent({
    required this.buttonType,
  });

  final ButtonType buttonType;

  @override
  List<Object?> get props => [
        buttonType,
      ];
}
