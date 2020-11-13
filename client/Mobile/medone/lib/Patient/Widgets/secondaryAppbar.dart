import 'package:flutter/material.dart';

class SecondaryAppBar extends StatelessWidget {

  String title;
  String secondaryTitle;

  SecondaryAppBar(this.title, this.secondaryTitle) ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).accentColor,),
                  onPressed: () => Navigator.pop(context)),
              Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                secondaryTitle,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
