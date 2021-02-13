import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'home_page.dart';

class HomePageProvider extends BlocProvider<HomePageBloc> {
  HomePageProvider({
    Key key,
  }) : super(
    key: key,
    create: (context) => HomePageBloc(context),
    child: HomePageView(),

  );
}


