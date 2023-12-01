import 'package:cubit_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cubit_task/Features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const CubitTaskApp());
}

class CubitTaskApp extends StatelessWidget {
  const CubitTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
