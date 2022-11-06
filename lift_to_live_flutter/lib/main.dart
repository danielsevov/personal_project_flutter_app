import 'package:flutter/material.dart';
import 'domain/app_state/app_state.dart';
import 'presentation/ui/token_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AppState>(
        create: (_) => AppState(),
        child: MaterialApp(
            title: 'LiftToLiveApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const TokenUI()));
  }
}
