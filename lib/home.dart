import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/annexe.dart';
import 'Pages/home4.dart';
import 'package:flutter/cupertino.dart';
import 'package:vocab/Pages/nombres.dart';
import 'package:vocab/Pages/jours.dart';
import 'package:vocab/Pages/expressionPage.dart';
import 'package:vocab/Pages/VerbPage.dart';
import 'package:vocab/Pages/VerbDetail.dart';
import 'Components/constant.dart';

FirebaseUser loggedInUser;
enum TabItem {
  homeTable,
  annexe,
  favourite,
}
List tab = [
  "homeTable",
  "annexe",
  "favourite",
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  int _selectedIndex = 0;

  Map<TabItem, GlobalKey<NavigatorState>> navkeys = {
    TabItem.homeTable: GlobalKey<NavigatorState>(),
    TabItem.annexe: GlobalKey<NavigatorState>(),
    TabItem.favourite: GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    super.initState();
    getUserRef();
  }

  getUserRef() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    setState(() {
      userId = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navkeys[TabItem.values[_selectedIndex]]
                .currentState
                .maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_selectedIndex != 0) {
            setState(() {
              _selectedIndex = 0;
            });
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        appBar: headerNav(context: context),
        body: IndexedStack(index: _selectedIndex, children: <Widget>[
          Offstage(
            offstage: _selectedIndex != 0,
            child: Navigator(
              key: navkeys[TabItem.homeTable],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomeTable(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Navigator(
                initialRoute: 'annexe',
                key: navkeys[TabItem.annexe],
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case 'annexe':
                      return MaterialPageRoute(
                          builder: (context) => Annexe(), settings: settings);
                      break;

                    case 'grammairePage':
                      return MaterialPageRoute(
                          builder: (context) => GrammairePage(),
                          settings: settings);
                      break;
                    case 'nombresPage':
                      return MaterialPageRoute(
                          builder: (context) => NombresPage(),
                          settings: settings);
                      break;
                    case 'joursPage':
                      return MaterialPageRoute(
                          builder: (context) => JoursPage(),
                          settings: settings);
                      break;
                    case 'expressionsPage':
                      return MaterialPageRoute(
                          builder: (context) => ExpressionsPage(),
                          settings: settings);
                      break;

                    default:
                      throw Exception("Invalid route");
                  }
                }),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Navigator(
                key: navkeys[TabItem.favourite],
                initialRoute: 'verbPage',
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case 'verbPage':
                      return MaterialPageRoute(
                          builder: (context) => VerbPage(), settings: settings);
                      break;

                    case 'VerbDetailPage':
                      return MaterialPageRoute(
                          builder: (context) => Verbdetail(),
                          settings: settings);
                      break;

                    default:
                      throw Exception("Invalid route");
                  }
                }),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('Annexe'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Verbes'),
              ),
            ],
            selectedItemColor: Colors.orange,
            backgroundColor: Colors.white,
            elevation: 16,
            onTap: (val) => _onTap(val, context),
            currentIndex: _selectedIndex),
      ),
    );
  }

  void _onTap(val, BuildContext context) {
    if (_selectedIndex == val) {
      switch (val) {
        case 0:
          setState(() {
            _selectedIndex = 0;
          });

          break;
        case 1:
          setState(() {
            _selectedIndex = 1;
          });

          break;
        case 2:
          setState(() {
            _selectedIndex = 2;
          });
          break;
        case 3:
          setState(() {
            _selectedIndex = 3;
          });
          break;

        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _selectedIndex = val;
        });
      }
    }
  }
}
