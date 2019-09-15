import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ConceitoBloc extends InheritedWidget {
  ConceitoBloc({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  static ConceitoBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ConceitoBloc) as ConceitoBloc);
  }

  final BehaviorSubject<int> _streamController = BehaviorSubject.seeded(0);
  Sink<int> get changeInput => _streamController.sink;
  Stream<int> get changeOutput => _streamController.stream;

  @override
  bool updateShouldNotify(ConceitoBloc oldWidget) {
    return oldWidget != this;
  }
}
