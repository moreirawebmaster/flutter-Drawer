import 'package:flutter/material.dart';
import 'package:flutter_drawer/pages/master.page.dart';

import 'bloc/conceito.bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConceitoBloc(child: Masterpage());
  }
}
