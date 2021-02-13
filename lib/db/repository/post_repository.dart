import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:training_app/db/model/post.dart';
import 'package:training_app/util/db_util.dart';

class PostRepository extends FirebaseRepository<Post> {
  @override
  Post fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    final data = snapshot.data();
    if (data == null) return null;
    try {

      return Post(
        ref: snapshot.reference,
        user: data[Post.USER],
        title: data[Post.TITLE],
        description: data[Post.DESCRIPTION],
        created: data[Post.CREATED],

      );
    } catch (e) {
      print("data fetching error>>>>>>>>>${e}");
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(Post item) {
    return {
      Post.USER: item.user,
      Post.TITLE: item. title,
      Post.DESCRIPTION: item.description,
      Post.CREATED: item.created,

    };
  }

  @override
  Future<DocumentReference> update({
    @required Post item,
    String type,
    DocumentReference parent,
    MapperCallback<Post> mapper,
  }) {
    return super.update(
      item: item,
      type: DBUtil.POST,
      mapper: mapper,
    );
  }

  @override
  Stream<List<Post>> query({
    @required SpecificationI specification,
    String type,
    DocumentReference parent,
  }) {
    return super.query(
      specification: specification,
      type: DBUtil.POST,
    );
  }

  @override
  Future<DocumentReference> add(
      {@required Post item,String type, DocumentReference parent}) {
    return super.add(item:item, type:DBUtil.POST);

  }
}
