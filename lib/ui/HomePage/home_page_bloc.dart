import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_app/db/model/post.dart';
import 'package:training_app/db/repository/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

import 'home_page.dart';

class HomePageBloc extends Bloc<HomePageEvent,HomePageState> {
  StreamSubscription _postSubscription;

  final _postRepository = PostRepository();

  HomePageBloc(BuildContext context) : super(HomePageState.init()) {
    getAllPosts();
  }

  //getAllPosts from here
  getAllPosts() {
    _postSubscription?.cancel();
    _postSubscription =
        _postRepository.query(specification: ComplexSpecification([])).listen((
            event) {
          add(GetAllPosts(event));
        });
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    switch (event.runtimeType) {
      case GetAllPosts:
        final posts = (event as GetAllPosts).all;
        yield state.clone(posts: posts);
        break;

      case AddPostCard:
        final data = event as AddPostCard;
        _postRepository.add(
          item: new Post(
            user: data.post.user,
            title: data.post.title,
            description: data.post.description,
            created: data.post.created,
          ),
        );
        break;
    }
  }

  @override
  Future<void> close() async {
    await _postSubscription.cancel();
    await super.close();
  }
}
