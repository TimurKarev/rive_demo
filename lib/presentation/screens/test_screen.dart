import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive_demo/presentation/bloc/sprite/sprite_bloc.dart';
import 'package:rive_demo/presentation/common_widgets/game_controller_widget.dart';
import 'package:rive_demo/presentation/common_widgets/sprite_widget.dart';
import 'package:rive_demo/presentation/controllers/hero_sprite_controller.dart';

// Screen with sprite and controller, loads on start
class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpriteBloc(
        spriteController:
            HeroSpriteController(asset: 'assets/sprites/footballer-sprite.riv'),
      ),
      child: const _TestScreenContent(),
    );
  }
}

class _TestScreenContent extends StatelessWidget {
  const _TestScreenContent();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
        child: GameControllerWidget(),
      ),
    );
  }
}
