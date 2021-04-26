
import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottomNavigationBar_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
// ignore: unused_import
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart' as Nav;
import 'demo/form/index.dart';
import 'demo/material/index.dart';
import 'demo/state/index.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/animation/animation_demo.dart';
void main () => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Nav.NavigatorDemo(),
      initialRoute: '/',
      routes: {
        '/': (context) => Nav.NavigatorDemo(),
        '/home': (context) => Home(),
        '/about': (context) => Nav.Page(title: 'About'),
        '/form': (context)=> FormComponents(),
        '/mdc': (context) => MaterialComponents(),
        '/state': (context) => StateComponents(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxdartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo()
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, .5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0)
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child:  Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () => debugPrint('onPressed'),
          // ),
          title: Text('flutter demo'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          elevation: 4.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            // indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.0,
            tabs: [
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            // ViewDemo(),
            SliverDemo()
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      )
    );
  }
}
