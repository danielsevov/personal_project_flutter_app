import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/user.dart';
import '../../../factory/profile_page_factory.dart';
import '../../presenters/profile_page_presenter.dart';
import '../../state_management/app_state.dart';
import '../../../helper.dart';
import '../../views/profile_page_view.dart';
import 'home_page.dart';

/// Custom ProfilePage widget used as a main overview of a user.
/// It provides navigation to the user's pictures and habits pages.
/// It is a stateful widget and its state object implements the ProfilePageView abstract class.
class ProfilePage extends StatefulWidget {
  final String userId;
  final bool fromHome;

  const ProfilePage({Key? key, required this.userId, required this.fromHome}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

/// State object of the ProfilePage. Holds the mutable data, related to the profile page.
class ProfilePageState extends State<ProfilePage> implements ProfilePageView {
  late ProfilePagePresenter _presenter; // The business logic object of the log in page
  bool _isLoading =
          false, // Indicator showing if data is being fetched at the moment
  _isFetched = false;
  late User
      _user; // The user object holding the details of the current logged in user
  late Image
      _profilePicture; // The image object holding the current user profile picture

  /// initialize the page view by attaching it to the presenter
  @override
  void initState() {
    _presenter = ProfilePageFactory().getProfilePagePresenter(widget.userId);
    _presenter.attach(this);
    super.initState();
  }

  /// detach the view from the presenter
  @override
  void deactivate() {
    _presenter.detach();
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
      _isFetched = true;
    });
  }

  /// Function called when user wants to change the profile picture.
  @override
  void changeProfilePicture(Image image) {
    setState(() {
      _profilePicture = image;
    });
  }

  /// Function to show a toast message when no user data can be fetched.
  @override
  void notifyNoUserData() {
    Helper.makeToast(context, 'No user data found!');
  }

  /// Function called when user wants to navigate from the users profile to the users habit page.
  @override
  void habitsPressed(BuildContext context) {
    Helper.pushPageWithAnimation(context, const Text("Habits"));
  }

  /// Function called when user wants to navigate from profile page to pictures page.
  @override
  void picturesPressed(BuildContext context) {
    Helper.pushPageWithAnimation(context, const Text("Pictures"));
  }

  /// Build method of the home page view
  @override
  Widget build(BuildContext context) {
    
    // initialize presenter and log in form, if not initialized yet
    if (!_presenter.isInitialized()) {
      _presenter.setAppState(Provider.of<AppState>(context));
    }

    // fetch data if it is not fetched yet
    if (!_isFetched) {
      _presenter.fetchData();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(centerTitle: true,
          backgroundColor: Helper.blueColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          pinned: true,
          snap: true,
          floating: true,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if(widget.fromHome) {
                  Helper.replacePage(context, const HomePage());
                }
                else {
                  Navigator.pop(context);
                }
              }
          ),
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: _isFetched ? Text(_user.name, style: const TextStyle(fontSize: 25),) : const Text('Profile Page', style: TextStyle(fontWeight: FontWeight.w600),),
            centerTitle: true,
          ),),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _isLoading ? const Center(child: CircularProgressIndicator(color: Helper.blueColor,)) : SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(image: DecorationImage(
                      image: AssetImage("assets/images/whitewaves.png"),
                      fit: BoxFit.fill,
                    ),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _presenter.isAuthorized() ? const SizedBox(width: 50,) : const SizedBox(),
                            Container(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: _isFetched ? _profilePicture : null,
                              ),
                            ),
                            _presenter.isAuthorized() && _isFetched ? IconButton(onPressed: () {_presenter.changeProfilePicture();}, icon: const Icon(CupertinoIcons.camera_fill, color: Colors.black, size: 30,)) : const SizedBox()
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const Text('User details:', style: TextStyle(color: Helper.blueColor, fontSize: 22, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Helper.blueColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.email_outlined,
                                            color: Colors.white, size: 25,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            _user.email,
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.phone,
                                            color: Colors.white, size: 25,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            _user.phoneNumber,
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(CupertinoIcons.location_solid,
                                              color: Colors.white, size: 25),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            _user.nationality,
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.date_range,
                                              color: Colors.white, size: 25),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            _user.dateOfBirth,
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.fitness_center_outlined,
                                            color: Colors.white, size: 25,),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            _user.coachId,
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Wrap( //will break to another line on overflow
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceAround,//use vertical to show  on vertical axis
                          children: <Widget>[
                            Container(
                                margin:const EdgeInsets.all(10),
                                child: FloatingActionButton.extended(
                                  heroTag: 'btn5',
                                  backgroundColor: Helper.blueColor,
                                  label: const Text('View Pictures'),
                                  onPressed: () async {
                                    if(_presenter.isAuthorized()) {
                                      Helper.pushPageWithAnimation(context, const Text('Pictures'));
                                    }
                                    else {
                                      Helper.makeToast(context, 'You are not authorized to see this page!');
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.photo_library_rounded,
                                    color: Colors.white,
                                  ),
                                )
                            ), // button second
                            const SizedBox(height: 10,),
                            Container(
                                margin:const EdgeInsets.all(10),
                                child: FloatingActionButton.extended(
                                  heroTag: 'btn6',
                                  backgroundColor: Helper.redColor,
                                  icon: const Icon(Icons.task),
                                  label: const Text('View Habits'),
                                  onPressed: () {
                                    Helper.pushPageWithAnimation(context, const Text('Habits'));
                                  },
                                )
                            ), // button third

                            // Add more buttons here
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )]),
    );
  }
}