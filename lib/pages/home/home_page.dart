import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libertaspeople/pages/home/home_page_content/unfinished.dart';
import 'package:libertaspeople/view_models/home_cubit.dart';
import 'home_page_content/welcome.dart';
import 'home_page_content/no_survey.dart';
import 'home_page_content/welcome_back.dart';
import '../../constants/colors.dart';

class HomePageScaffold extends StatefulWidget {
  final num;
  HomePageScaffold({this.num});
  @override
  _HomePageScaffoldState createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {
  @override
  initState() {
    super.initState();

    context.bloc<HomeScreenCubit>().loadHomeScreen();
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // List<Widget> tabPages = [
    //   HomePageContent(
    //     num: widget.num,
    //   ),
    //   Container(),
    // ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConstants.darkBlue,
        backgroundColor: ColorConstants.greyAboutPage,
        onTap: (ind) {
          setState(() {
            pageIndex = ind;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About Survey",
          ),
        ],
      ),
      // body: tabPages[pageIndex],
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/woman-falling-in-line-holding-each-other-1206059 1.jpg"),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 50,
                  color: ColorConstants.darkBlue,
                  child: Center(
                    child: Text(
                      "Libertas People",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                    builder: (context, state) {
                      if (state is LoadingHomeScreenState ||
                          state is UninitializedHomeScreenState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is UnfinishedSurveyHomeScreenState) {
                        return UnfinishedSurvey(
                            surveyID: state.surveyID,
                            sessionID: state.sessionId);
                      } else if (state is WelcomeHomeScreenState) {
                        return Welcome(state.firstSurveyId);
                      } else if (state is WelcomeBackHomeScreenState) {
                        return WelcomeBack(state.surveyId);
                      } else if (state is NoSurveyHomeScreenState) {
                        return NoSurvey();
                      } else if (state is FailureHomeScreenState) {
                        return Center(
                            child:
                                Text("There was an issue: ${state.message}"));
                      }
                      return Center(
                        child: Text(
                            "There is an unexpected state in the bloc builder, this should be handled by development"),
                      );
                    },
                  ),
                ),
              ],
            ),
          )))
        ],
      ),
    );
  }
}
