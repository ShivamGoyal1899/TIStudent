import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  myAppBar(
      {@required this.title})
      : preferredSize = Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 2.5),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 0,
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 7.5,
                      height: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/ti_logo.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: 'notification',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 0,
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 7.5,
                      height: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
