import 'package:training_app/db/model/post.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomePageEvent {}

class GetAllPosts extends HomePageEvent {
  final List<Post> all;
  GetAllPosts(this.all);
}

class AddPostCard extends HomePageEvent {
  final Post post;
  AddPostCard(this.post);
}
