part of 'main.dart';

class NavigationDotsExample extends StatelessWidget {
  const NavigationDotsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDots(
      keepScrollable: true,
      showNavigatorBar: false,
      children: <Widget>[
        Container(color: Colors.blueAccent),
        Container(color: Colors.white),
        Container(color: Colors.pinkAccent),
        Container(color: Colors.blueAccent),
        Container(color: Colors.white),
        Container(color: Colors.pinkAccent),
        Container(color: Colors.blueAccent),
        Container(color: Colors.white),
        Container(color: Colors.pinkAccent),
      ],
    );
  }
}
