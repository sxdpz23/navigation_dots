part of 'main.dart';

class NavigationDotsExample extends StatelessWidget {
  const NavigationDotsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Dots Example',
          softWrap: true,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.black,
      ),
      body: NavigationDots(
        children: <Widget>[
          Container(color: Colors.white),
          Container(color: Colors.lightBlueAccent),
          Container(color: Colors.blueGrey),
        ],
      ),
    );
  }
}
