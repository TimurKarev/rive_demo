part of 'sprite_bloc.dart';

abstract class SpriteState extends Equatable {
  const SpriteState();

  //TODO: make abstract
  bool get isLoading => false;
  bool get isError => false;

  @override
  List<Object> get props => [];
}

class SpriteInitialState extends SpriteState {
  const SpriteInitialState();

  @override
  bool get isLoading => true;
}

class SpriteLoadingState extends SpriteState {
  const SpriteLoadingState();

  @override
  bool get isLoading => true;
}

class SpriteErrorState extends SpriteState {
  const SpriteErrorState({
    required this.message,
  });

  final String message;

  @override
  bool get isError => true;

  @override
  List<Object> get props => [message];
}

class SpriteReadyState extends SpriteState {
  const SpriteReadyState({
    required this.artBoard,
  });

  final Artboard artBoard;

  @override
  List<Object> get props => [artBoard];
}
