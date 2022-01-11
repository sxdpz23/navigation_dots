part of 'main.dart';

class NavigationDotsExample extends StatelessWidget {
  const NavigationDotsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDots(
      children: <Widget>[
        Container(color: Colors.blueAccent),
        Container(color: Colors.greenAccent),
        Container(color: Colors.pinkAccent),
      ],
    );
  }
}
