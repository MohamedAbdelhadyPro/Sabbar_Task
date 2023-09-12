import 'package:get_it/get_it.dart';

import 'blocs_di.dart';
import 'repositories_di.dart';

GetIt di = GetIt.instance;

Future diInit() async {
  await initializeRepositories();
  await initializeBlocs();
}
