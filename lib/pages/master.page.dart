import 'package:flutter/material.dart';
import 'package:flutter_drawer/bloc/conceito.bloc.dart';
import 'package:flutter_drawer/pages/conta.page.dart';
import 'package:flutter_drawer/pages/favorito.page.dart';
import 'package:flutter_drawer/widget/drawer-custom.dart';

import 'home.page.dart';

class Masterpage extends StatefulWidget {
  Masterpage({Key key}) : super(key: key);

  _MasterpageState createState() => _MasterpageState();
}

class _MasterpageState extends State<Masterpage> {
  var pages = <Widget>[HomePage(), FavoritoPage(), ContaPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        drawer: DrawerCustom(),
        appBar: AppBar(
          title: Text('Conceito do bloc com stream'),
        ),
        body: StreamBuilder<int>(
            stream: ConceitoBloc.of(context).changeOutput,
            builder: (context, snapshot) {
              return pages[snapshot.data];
            }),
      ),
    );
  }
}
