import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:subspace_project/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_project/services/bloc/blogs_data_bloc.dart';
import 'package:toast/toast.dart';

void main() async {
  await initialisation();
  runApp(const MyApp());
}

Future<void> initialisation() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext toastContext = ToastContext();
    toastContext.init(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => BlogsDataBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff303030),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              displayLarge: TextStyle(color: Colors.white),
              displayMedium: TextStyle(color: Colors.white),
            ),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
