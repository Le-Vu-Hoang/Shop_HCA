import 'package:e_commercial/injection/injection_dependency.dart';
import 'package:e_commercial/injection/injection_repository.dart';
import 'package:e_commercial/injection/injection_services.dart';
import 'package:e_commercial/injection/injection_state.dart';
import 'package:get_it/get_it.dart';

import 'injection_controller.dart';
import 'injection_datasource.dart';
import 'injection_usecase.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await setupDatasource(sl);
  await setupDependency(sl);
  await setupState(sl);
  await setupServices(sl);
  await setupRepository(sl);
  await setupController(sl);
  await setupUseCases(sl);
}