import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'features/home/presentation/bloc/count_provider.dart';
import 'features/home/presentation/bloc/get_data_tab_provider.dart';
import 'features/home/presentation/bloc/get_data_tree_provider.dart';
import 'features/home/presentation/bloc/handle_audio.dart';
import 'features/home/presentation/bloc/handle_curren_index.dart';
import 'features/home/presentation/bloc/handle_switcher.dart';
import 'features/root.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<GetDataTreeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<GetDataTabProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => HandleSwitcher(),
        ),
        ChangeNotifierProvider(
          create: (_) => HandleAudio(),
        ),
        ChangeNotifierProvider(
          create: (_) => HandleCurrentIndex(),
        ),
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootPages(),
      ),
    );
  }
}
