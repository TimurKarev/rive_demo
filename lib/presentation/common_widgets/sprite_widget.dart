import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/presentation/bloc/sprite/sprite_bloc.dart';

// Shows Widget according to Sprite Bloc state
class SpriteWidget extends StatelessWidget {
  const SpriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpriteBloc, SpriteState>(
      builder: (_, state) {
        if (state is SpriteReadyState) {
          return _Rive(
            readyState: state,
          );
        } else if (state is SpriteLoadingState || state is SpriteInitialState) {
          return const SizedBox();
        } else if (state is SpriteErrorState) {
          return Text(state.message);
        }

        return const Text('Unknown Error');
      },
    );
  }
}

class _Rive extends StatelessWidget {
  const _Rive({
    required this.readyState,
  });

  final SpriteReadyState readyState;

  @override
  Widget build(BuildContext context) {
    return Rive(
      fit: BoxFit.cover,
      artboard: readyState.artBoard,
    );
  }
}
