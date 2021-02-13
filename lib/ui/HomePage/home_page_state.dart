import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_app/db/model/post.dart';
import 'package:flutter/material.dart';

@immutable
class HomePageState {
  final List<Post> posts;

  HomePageState({@required this.posts});

  HomePageState.init() : this(posts: null);

  HomePageState clone({List<Post> posts}) {
    return HomePageState(posts: posts ?? this.posts);
  }
}
