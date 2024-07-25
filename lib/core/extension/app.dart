import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AppX on MaterialApp {
  Widget wrapWithMultiBlocProvider() {
    return MultiBlocProvider(
      providers: [],
      child: this,
    );
  }
}
