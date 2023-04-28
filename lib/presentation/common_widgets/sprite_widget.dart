import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo/presentation/bloc/sprite/sprite_bloc.dart';

class SpriteWidget extends StatelessWidget {
  const SpriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpriteBloc, SpriteState>(
      builder: (_, state) {
        return state.isLoading
            ? const SizedBox()
            : state.isError
                ? const Text('Error')
                : _Rive(
                    readyState: state as SpriteReadyState,
                  );
      },
    );
  }
}

class _Rive extends StatelessWidget {
  const _Rive({
    super.key,
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
