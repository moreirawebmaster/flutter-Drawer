import 'package:flutter/material.dart';
import 'package:flutter_drawer/bloc/conceito.bloc.dart';

class DrawerCustom extends StatefulWidget {
  DrawerCustom({Key key}) : super(key: key);

  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('moreirawebmaster@gmail.com'),
            accountName: Text('Thiago Moreira'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent-cdt1-1.cdninstagram.com/vp/fee224b6a097f26a6dea8340c04ed456/5DD59910/t51.2885-19/s150x150/35001570_1081817598633485_9111239254029107200_n.jpg?_nc_ht=scontent-cdt1-1.cdninstagram.com'),
            ),
          ),
          customListTitle('Home', context, 0),
          customListTitle('Favorito', context, 1),
          customListTitle('Conta', context, 2),
        ],
      ),
    );
  }

  Widget customListTitle(String title, BuildContext context, int index) {
    return StreamBuilder<int>(
        stream: ConceitoBloc.of(context).changeOutput,
        builder: (context, snapshot) {
          return ListTile(
            title: Text(title),
            onTap: () {
              ConceitoBloc.of(context).changeInput.add(index);
              Scaffold.of(context).openEndDrawer();
            },
            selected: snapshot.data == index,
          );
        });
  }
}
