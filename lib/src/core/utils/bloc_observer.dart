import 'package:bloc/bloc.dart';

import 'logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('onError -- ${bloc.runtimeType}, $error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.w('onClose -- ${bloc.runtimeType}');
  }
}
