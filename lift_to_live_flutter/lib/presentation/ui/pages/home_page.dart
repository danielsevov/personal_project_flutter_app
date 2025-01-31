import 'dart:developer';

import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lift_to_live_flutter/domain/entities/news.dart';
import 'package:lift_to_live_flutter/presentation/presenters/home_page_presenter.dart';
import 'package:lift_to_live_flutter/presentation/ui/widgets/custom_bottom_nav_bar/custom_bottom_bar.dart';
import 'package:lift_to_live_flutter/presentation/ui/widgets/custom_drawer/custom_drawer.dart';
import 'package:lift_to_live_flutter/presentation/ui/widgets/news_related/news_article_holder.dart';
import 'package:lift_to_live_flutter/presentation/views/home_page_view.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/user.dart';
import '../../../factory/abstract_page_factory.dart';
import '../../state_management/app_state.dart';
import '../../../helper.dart';
import '../widgets/reusable_elements/custom_dialog.dart';

/// Custom widget, which is the HomePage and is used as a main navigational hub for the application.
/// It provides navigation to the main app pages, as well as a news overview and the log out functionality.
/// It is a stateful widget and its state object implements the HomePageView abstract class.
class HomePage extends StatefulWidget {
  final HomePagePresenter
      presenter; // The business logic object of the log in page
  final AbstractPageFactory pageFactory;

  const HomePage({Key? key, required this.presenter, required this.pageFactory}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

/// State object of the HomePage. Holds the mutable data, related to the home page.
class HomePageState extends State<HomePage> implements HomePageView {
  bool _isLoading =
          false, // Indicator showing if data is being fetched at the moment
      _isFetched = false; // Indicator showing if data is already fetched
  late News _currentNews; // The object holding the news articles
  late User
      _user; // The user object holding the details of the current logged in user
  late Image
      _profilePicture; // The image object holding the current user profile picture
  late double _screenWidth, _screenHeight; // The screen dimensions

  @override
  get screenWidth => _screenWidth;

  @override
  get screenHeight => _screenHeight;

  @override
  get userData => _user;

  @override
  get isFetched => _isFetched;

  @override
  get profilePicture => _profilePicture;

  @override
  get currentNews => _currentNews;

  /// initialize the page view by attaching it to the presenter
  @override
  void initState() {
    widget.presenter.attach(this);
    super.initState();
  }

  /// detach the view from the presenter
  @override
  void deactivate() {
    widget.presenter.detach();
    super.deactivate();
  }

  /// Function to set if data is currently being fetched and an loading indicator should be displayed.
  @override
  void setInProgress(bool inProgress) {
    setState(() {
      _isLoading = inProgress;
    });
  }

  /// Function to set and display the user details, user profile picture.
  @override
  void setUserData(User user, Image profileImage) {
    setState(() {
      _user = user;
      _profilePicture = profileImage;
    });
  }

  /// Function to set and display the list of news.
  @override
  void setNewsData(News news) {
    setState(() {
      _currentNews = news;
    });
  }

  /// Function to indicate that the required data has been fetched, so appropriate layout can be displayed.
  @override
  void setFetched(bool fetched) {
    setState(() {
      _isFetched = fetched;
    });
  }

  /// Function to show a toast message when a news URL is incorrect.
  @override
  void notifyWrongURL(String s) {
    Helper.makeToast(context, s);
  }

  /// Function called when user wants to navigate from home to habit page
  @override
  void habitsPressed(bool bottomBarButton) {
    if (!bottomBarButton) Navigator.of(context).pop();
    Helper.pushPageWithSlideAnimation(
        context, widget.pageFactory.getHabitsPage(_user.id));
  }

  /// Function to redirect user to URL
  @override
  void redirectToUrl(int index) {
    widget.presenter.redirectToURL(index);
  }

  /// Function called when user wants to navigate from home to profile page
  @override
  void profilePressed(bool bottomBarButton) {
    if (!bottomBarButton) Navigator.of(context).pop();
    Helper.pushPageWithSlideAnimation(
        context, widget.pageFactory.getProfilePage(_user.id, 'home'));
  }

  /// Function called when user wants to navigate from home to workout history page
  @override
  void historyPressed(bool fromBottomBar) {
    if (!fromBottomBar) Navigator.of(context).pop();
    Helper.pushPageWithSlideAnimation(
        context, widget.pageFactory.getWorkoutHistoryPage(_user.id));
  }

  /// Function for navigating to edit workout templates page.
  @override
  void templatesPressed(bool fromBottomBar) {
    if (!fromBottomBar) Navigator.of(context).pop();
    Helper.pushPageWithSlideAnimation(
        context, widget.pageFactory.getWorkoutTemplatesPage(_user.id));
  }

  /// Function for navigating to edit workout page.
  @override
  void workoutPressed(bool bool) {
    Helper.pushPageWithSlideAnimation(
        context, widget.pageFactory.getWorkoutPage(0, _user.id, false, false));
  }

  /// Function called when user wants to navigate from home to trainees page
  /// This is only allowed if user is admin or coach.
  @override
  void traineesPressed(bool bottomBarButton) {
    if (!bottomBarButton) Navigator.of(context).pop();
    if (widget.presenter.isCoachOrAdmin()) {
      Helper.pushPageWithSlideAnimation(context, widget.pageFactory.getTraineesPage());
    } else {
      Helper.makeToast(context, "Become coach to access this page!");
    }
  }

  /// Function to clear the app state upon log out and navigate to log in page
  @override
  void logOutPressed(BuildContext context) {
    widget.presenter.logOut(const FlutterSecureStorage());
    Helper.pushPageWithSlideAnimation(context, widget.pageFactory.getLogInPage());
  }

  /// Function for showing sign out dialog
  @override
  void showSignOutDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
              title: 'Sign out',
              bodyText: 'Are you sure you want to sign out?',
              confirm: () {
                logOutPressed(context);
              },
              cancel: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialog(
                          title: 'Exit',
                          bodyText: 'Do you want to exit the app instead?',
                          confirm: () {
                            Navigator.pop(context);
                            SystemNavigator.pop();
                          },
                          cancel: () {
                            Navigator.pop(context);
                          });
                    });
              });
        });
  }

  /// Build method of the home page view
  @override
  Widget build(BuildContext context) {
    // get screen dimensions
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    // initialize presenter and log in form, if not initialized yet
    if (!widget.presenter.isInitialized()) {
      widget.presenter.setAppState(Provider.of<AppState>(context));
    }

    // fetch data if it is not fetched yet
    if (!_isFetched) {
      widget.presenter.fetchData();
    }

    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent the user from navigating away
        showSignOutDialog();
        return false;
      },
      child: Scaffold(
        extendBody: true,
        floatingActionButton: FloatingActionButton.large(
          heroTag: 'btn4',
          //Floating action button on Scaffold
          onPressed: () {
            if(isFetched) {
              try {
                DefaultBottomBarController.of(context).swap();
              } catch (e) {
                log(e.toString());
              }
            }
          },
          backgroundColor: Helper.actionButtonColor,
          child: const Icon(
            Icons.fitness_center_outlined,
            color: Helper.actionButtonTextColor,
          ), //icon inside button
        ),

        //floating action button position to center
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // bottom navigation bar on scaffold
        bottomNavigationBar: CustomBottomBar(view: this),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Helper.pageBackgroundImage),
              fit: BoxFit.fill,
            ),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Helper.lightBlueColor.withOpacity(0.9),
                elevation: 20,
                iconTheme: const IconThemeData(
                  color: Helper.darkHeadlineColor, //change your color here
                ),
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 100.0,
                shape: const ContinuousRectangleBorder(
                  side: BorderSide(color: Helper.blackColor, width: 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                actions: [
                  IconButton(
                      //on pressed clear token and navigate to log in page
                      onPressed: () async {
                        showSignOutDialog();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Helper.darkHeadlineColor,
                      )),
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text(
                    "L I F T    T O    L I V E",
                    style: TextStyle(color: Helper.headerBarTextColor),
                  ),
                  centerTitle: true,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Hero(
                      tag: 'logo',
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                        child: Image.asset(
                          Helper.logoImage,
                          width: _screenWidth * 0.8,
                          height: _screenHeight * 0.5,
                        ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Scroll down and check what\'s new in the gym world!',
                        style: TextStyle(color: Helper.lightHeadlineColor),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _isLoading
                        ? (index == 0
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Helper.yellowColor,
                              ))
                            : const SizedBox(
                                height: 3,
                              ))
                        : NewsArticleHolder(view: this, index: index);
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
        drawer: isFetched ? CustomDrawer(view: this) : const Drawer(),
      ),
    );
  }
}
