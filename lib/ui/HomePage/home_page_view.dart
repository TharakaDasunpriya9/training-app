import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_app/db/model/post.dart';
import 'package:training_app/db/repository/post_repository.dart';
import 'package:training_app/widget/DiaryCard.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class HomePageView extends StatefulWidget {
  HomePageView();

  @override
  _HomePageView createState() => _HomePageView();
}

class _HomePageView extends State<HomePageView> {
  final _formKey = GlobalKey<FormState>();
  String id;
  String title;
  String description;

  String RandomUsers() {
    List<String> userNames = ["tharka", "dasun", "nimal", "kamal", "nuwan"];
    return "${userNames[Random().nextInt(5)]}";
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final homePageBloc = BlocProvider.of<HomePageBloc>(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
        buildWhen: (pre, current) => pre.posts != current.posts,
        builder: (context, state) {
          if (state.posts == null) {
            return CircularProgressIndicator();
          }

          List<Widget> all = [];
          for (int i = 0; i < state.posts.length; i++) {
            // all = state.posts[i] as List<DiaryCardWidget>;
            all.addAll([
              DiaryCardWidget(state.posts[i].user, state.posts[i].title,
                  state.posts[i].description)
            ]);
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.blue,
            appBar: AppBar(
              title: Text('Home'),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                SizedBox(width: 200.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Container(
                          width:400.0,
                          child: TextFormField(
                            maxLines: 2,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color:Colors.blueAccent),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              contentPadding:EdgeInsets.all(8.0),
                              hintText: 'submit new',
                              fillColor: Colors.lightBlue,
                              filled: true,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                title = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Divider(height:10.0,),
                      Container(
                        width:400.0,
                        child: TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color:Colors.blueAccent),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                              // contentPadding: ,
                              border: InputBorder.none,
                              contentPadding:EdgeInsets.all(20.0),

                              hintText: 'Description new',
                              fillColor: Colors.lightBlue,
                              filled: true,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                description = value;
                              });
                            }),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width:350,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          final post = Post(
                              title: title,
                              description: description,
                              user: RandomUsers(),
                              created: Timestamp.now());
                          homePageBloc.add(AddPostCard(post));
                          // HomePageBloc(context).add(AddPostCard(post));
                        },
                        child: Text('submit',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: all,
                  ),
                )
              ],
            ),
          );
        });
  }
}
