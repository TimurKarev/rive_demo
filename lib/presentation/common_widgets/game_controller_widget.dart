import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive_demo/internal/button_type.dart';
import 'package:rive_demo/presentation/bloc/sprite/sprite_bloc.dart';

// TODO: need deep refactor
// Widget with game controller
class GameControllerWidget extends StatelessWidget {
  const GameControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.arrow_upward),
          onPressed: () => context.read<SpriteBloc>().add(
                const ButtonPressedSpriteEvent(
                  buttonType: ButtonType.jump,
                ),
              ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              child: const Text('S'),
              onPressed: () => context.read<SpriteBloc>().add(
                    const ButtonPressedSpriteEvent(
                      buttonType: ButtonType.stop,
                    ),
                  ),
            ),
            FloatingActionButton(
              child: const Icon(Icons.arrow_forward),
              onPressed: () => context.read<SpriteBloc>().add(
                    const ButtonPressedSpriteEvent(
                      buttonType: ButtonType.walk,
                    ),
                  ),
            ),
            FloatingActionButton(
              child: const Icon(Icons.arrow_forward_ios),
              onPressed: () => context.read<SpriteBloc>().add(
                    const ButtonPressedSpriteEvent(
                      buttonType: ButtonType.run,
                    ),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
