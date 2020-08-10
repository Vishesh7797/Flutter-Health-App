import 'package:flutter/material.dart';
import 'package:login_app/login_page.dart';
import 'package:login_app/sign_in.dart';

class FirstScreen extends StatelessWidget {
  int _selectedItem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [

          Icons.book,

          Icons.home,

          Icons.person,
        ],
        onChange: (val) {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
      appBar: AppBar(
        title: Text("Health App"),
      ),
//      bottomNavigationBar: Row(
//        children: <Widget>[
//          Container(
//            height: 60,
//            width: MediaQuery.of(context).size.width/3,
//            decoration: BoxDecoration(
//              color: Colors.green[200]
//            ),
//            child: Icon(Icons.home),
//          ),
//          Container(
//            height: 60,
//            width: MediaQuery.of(context).size.width/3,
//            decoration: BoxDecoration(
//                color: Colors.green[200]
//            ),
//            child: Icon(Icons.book),
//          ),
//          Container(
//            height: 60,
//            width: MediaQuery.of(context).size.width/3,
//            decoration: BoxDecoration(
//                color: Colors.green[200]
//            ),
//            child: Icon(Icons.person),
//          ),
//        ],
//      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        @required this.iconList,
        @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 4, color: Colors.green),
            ),
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.3),
              Colors.green.withOpacity(0.015),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
          // color: index == _selectedItemIndex ? Colors.green : Colors.white,
        )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
