part of 'sprite_bloc.dart';

abstract class SpriteState extends Equatable {
  const SpriteState();

  @override
  List<Object> get props => [];
}

// Initial state needs for constructor only
class SpriteInitialState extends SpriteState {
  const SpriteInitialState();
}

class SpriteLoadingState extends SpriteState {
  const SpriteLoadingState();
}

class SpriteErrorState extends SpriteState {
  const SpriteErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

// If Sprite controller successfully initialized argument is artBoard for UI Rive widget
class SpriteReadyState extends SpriteState {
  const SpriteReadyState({
    required this.artBoard,
  });

  final Artboard artBoard;

  @override
  List<Object> get props => [artBoard];
}
