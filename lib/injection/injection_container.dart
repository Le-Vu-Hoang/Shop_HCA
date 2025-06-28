import 'package:e_commercial/injection/injection_dependency.dart';
import 'package:e_commercial/injection/injection_state.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  setupState(sl);
  setupDependency(sl);
}