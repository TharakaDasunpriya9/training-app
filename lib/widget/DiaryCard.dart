import 'package:flutter/material.dart';

class DiaryCardWidget extends StatelessWidget {
  String user;
  String title;
  String description;

  DiaryCardWidget(this.user, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 170,
      padding:EdgeInsets.all(4.0),
      child: Card(
        color:Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "$user",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "$description",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      // onPressed: () => updateData(doc),
                      onPressed: (){},
                      child: Text('show more', style: TextStyle(color: Colors.black)),
                      color: Colors.lightBlueAccent,
                    ),
                    SizedBox(width: 8),
                    // IconButton(icon:Icon(Icons.delete,color:Colors.red,), onPressed:(){})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
