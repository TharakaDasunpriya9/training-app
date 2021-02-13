import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
// import 'package:workforce/db/model/user.dart';
// import 'package:workforce/db/model/user_group.dart';

class Post extends DBModel {
  static const USER = 'user';
  static const TITLE = 'title';
  static const DESCRIPTION = 'description';
  static const CREATED = 'created';

  String user;
  String title;
  String description;
  Timestamp created;

  Post({
    DocumentReference ref,
    this.user,
    this.title,
    this.description,
    this.created,
  }) : super(ref: ref);

  @override
  Post clone({
    DocumentReference ref,
    String user,
    String title,
    String description,
    Timestamp created,

  })

  {
    return Post(
      ref: ref ?? this.ref,
      user: user ?? this.user,
      title: title ?? this.title,
      description: description ?? this.description,
      created: created ?? this.created,
    );
  }
}
