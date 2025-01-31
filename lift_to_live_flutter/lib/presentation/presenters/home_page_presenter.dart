import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lift_to_live_flutter/domain/repositories/user_repo.dart';
import 'package:lift_to_live_flutter/factory/presenter_factory.dart';
import 'package:lift_to_live_flutter/presentation/presenters/base_presenter.dart';
import 'package:lift_to_live_flutter/presentation/views/home_page_view.dart';

import '../../domain/entities/news.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/news_repo.dart';

import 'package:url_launcher/url_launcher.dart';

/// This is the object, which holds the business logic, related to the Home Page view.
/// It is the mediator between the HomePage view (UI) and the repositories (Data).
class HomePagePresenter extends BasePresenter {
  HomePageView? _view;
  late final NewsRepository _newsRepository;
  late final UserRepository _userRepository;
  late User _user;
  late News _currentNews;
  late Image _profilePicture;
  bool _dataFetched = false;

  /// Simple constructor for passing the required repositories
  HomePagePresenter();

  /// Function to attach repositories
  void attachRepositories(UserRepository userRepository, NewsRepository newsRepository) {
    _userRepository = userRepository;
    _newsRepository = newsRepository;
    super.repositoriesAttached = true;
  }

  void reset() {
    _dataFetched = false;
  }

  /// Function to attach a view to the presenter
  void attach(HomePageView view) {
    _view = view;
  }

  /// Function to detach the view from the presenter
  void detach() {
    _view = null;
  }

  /// Function called to indicate if user is coach or admin.
  isCoachOrAdmin() {
    return super.appState.isCoachOrAdmin();
  }

  /// Function to clear the app state upon log out and navigate to log in page
  Future<void> logOut(FlutterSecureStorage storage) async {
    super.appState.clearState();
    await storage.deleteAll();
    PresenterFactory().reset();
  }

  /// Function used for fetching the required data, which is then displayed on the home page.
  Future<void> fetchData() async {
    if(_dataFetched) {
      _view?.setUserData(_user, _profilePicture);
      _view?.setNewsData(_currentNews);
      _view?.setFetched(true);
      return ;
    }

    // set the loading indicator to be displayed on the home page view
    _view?.setInProgress(true);

    // fetch the user details and profile picture
    _user = await _userRepository.fetchUser(
        super.appState.getUserId(), super.appState.getToken());

    try {
      var myImage = await _userRepository.fetchProfileImage(
          super.appState.getUserId(), super.appState.getToken());
      _profilePicture = Image.memory(
        base64Decode(myImage.data),
        height: 150,
      );
    } catch (e) {
      _profilePicture = Image.asset(
        'assets/images/prof_pic.png',
        height: 150,
      );
    }

    // display the fetched user data
    _view?.setInProgress(false);
    _view?.setUserData(_user, _profilePicture);
    _view?.setFetched(true);

    // fetch the news
    await fetchNews();
    _dataFetched = true;
  }

  /// Sub-function to fetch news separately from the user details, as they use different data-sources.
  Future<void> fetchNews() async {
    // display loading indicator on home page
    _view?.setInProgress(true);

    // fetch the news
    _currentNews = await _newsRepository.getNews("bodybuilding", 20);

    // stop the loading indicator and display the news
    _view?.setInProgress(false);
    _view?.setNewsData(_currentNews);
    _view?.setFetched(true);
  }

  // coverage:ignore-start
  /// Function used to open an external browser application and navigate to a news article URL.
  Future<void> redirectToURL(int index) async {
    var url = _currentNews.articles[index].url;
    try {
      if (url.length >= 5 &&
          !await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          )) {
        _view?.notifyWrongURL('Could not launch $url');
      }
    } catch (e) {
      _view?.notifyWrongURL('Could not launch $url');
    }
  }
// coverage:ignore-end
}
