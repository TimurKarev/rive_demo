import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive_demo/internal/button_type.dart';
import 'package:rive_demo/presentation/bloc/sprite/sprite_bloc.dart';
import 'package:rive_demo/presentation/common_widgets/sprite_widget.dart';
import 'package:rive_demo/presentation/use_cases/footballer_sprite_use_case.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => SpriteBloc(
          spriteUseCase: FootballerSpriteUseCase(
              asset: 'assets/sprites/footballer-sprite.riv'),
        ),
        child: const MaterialApp(
          home: MyRiveAnimation(),
        ),
      ),
    );

class MyRiveAnimation extends StatelessWidget {
  const MyRiveAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: SizedBox(
          height: 400,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: SpriteWidget(),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Column(
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
        ),
      ),
    );
  }
}
