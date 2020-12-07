import 'package:flutter/material.dart';

import '../mobx/enuns/enum_load_state.dart';

class LoadingComponent extends StatelessWidget {
  final Widget child;
  final EnumLoadState state;

  const LoadingComponent({
    @required this.child,
    @required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state == EnumLoadState.loading) {
      return Stack(
        children: [
          Container(
            color: Colors.black12,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      );
    }
    return child;
  }
}
