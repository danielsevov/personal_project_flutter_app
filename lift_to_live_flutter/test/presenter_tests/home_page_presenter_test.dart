import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lift_to_live_flutter/domain/entities/role.dart';
import 'package:lift_to_live_flutter/domain/entities/user.dart';
import 'package:lift_to_live_flutter/domain/repositories/news_repo.dart';
import 'package:lift_to_live_flutter/domain/repositories/user_repo.dart';
import 'package:lift_to_live_flutter/presentation/presenters/home_page_presenter.dart';
import 'package:lift_to_live_flutter/presentation/state_management/app_state.dart';
import 'package:lift_to_live_flutter/presentation/ui/widgets/log_out_dialog.dart';
import 'package:lift_to_live_flutter/presentation/views/home_page_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_data.dart';
import 'home_page_presenter_test.mocks.dart';


@GenerateMocks([NewsRepository, UserRepository, HomePageView, LogOutDialog])
void main() {
  test('test presenter constructor', () {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final presenter = HomePagePresenter(newsRepo, userRepo);

    expect(presenter, isA<HomePagePresenter>());
    expect(presenter.isInitialized(), false);
  });

  test('test set app state', () {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final appState = AppState();
    final presenter = HomePagePresenter(newsRepo, userRepo);
    expect(presenter.isInitialized(), false);

    expect(() async => presenter.setAppState(appState), returnsNormally);

    expect(presenter.isInitialized(), true);
  });

  test('test log out', () {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final appState = AppState();
    final presenter = HomePagePresenter(newsRepo, userRepo);
    presenter.setAppState(appState);

    expect(appState.hasState(), false);
    appState.setState('email', 'token', []);

    expect(appState.hasState(), true);
    presenter.logOut();
    expect(appState.hasState(), false);
  });

  test('test is no coach or admin', () {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final appState = AppState();
    final presenter = HomePagePresenter(newsRepo, userRepo);
    presenter.setAppState(appState);
    appState.setState('email', 'token', []);

    expect(presenter.isCoachOrAdmin(), false);
  });

  test('test is coach or admin', () {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final appState = AppState();
    final presenter = HomePagePresenter(newsRepo, userRepo);
    presenter.setAppState(appState);
    appState.setState('email', 'token', [Role('A', 'admin')]);

    expect(presenter.isCoachOrAdmin(), true);
  });

  group('test attach and detach view methods', () {
    test('test attach view', () {
      final newsRepo = MockNewsRepository();
      final userRepo = MockUserRepository();
      final view = MockHomePageView();
      final presenter = HomePagePresenter(newsRepo, userRepo);

      expect(() async => presenter.attach(view), returnsNormally);
    });

    test('test detach view', () {
      final newsRepo = MockNewsRepository();
      final userRepo = MockUserRepository();
      final presenter = HomePagePresenter(newsRepo, userRepo);

      expect(() async => presenter.detach(), returnsNormally);
    });

    test('test attach and detach view', () {
      final newsRepo = MockNewsRepository();
      final userRepo = MockUserRepository();
      final view = MockHomePageView();
      final presenter = HomePagePresenter(newsRepo, userRepo);

      expect(() async => presenter..attach(view)..detach(), returnsNormally);
    });
  });

  test('test fetch news data', () async {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final appState = AppState();
    final view = MockHomePageView();
    final presenter = HomePagePresenter(newsRepo, userRepo);
    presenter.setAppState(appState);
    appState.setState('email', 'token', [Role('A', 'admin')]);
    presenter.attach(view);

    when(view.setInProgress(any)).thenAnswer((realInvocation) { });
    when(view.setFetched(any)).thenAnswer((realInvocation) { });
    when(newsRepo.getNews(any, any)).thenAnswer(
            (_) async => TestData.test_news_1);
    when(view.setNewsData(any)).thenAnswer((realInvocation) { });

    await presenter.fetchNews();

    expect(appState.getToken(), 'token');
    expect(appState.getUserRoles().length, 1);
    verify(view.setInProgress(any)).called(2);
    verify(newsRepo.getNews(any, any)).called(1);
    verify(view.setNewsData(any)).called(1);
  });

  test('test fetch data', () async {
    final newsRepo = MockNewsRepository();
    final userRepo = MockUserRepository();
    final appState = AppState();
    final view = MockHomePageView();
    final presenter = HomePagePresenter(newsRepo, userRepo);
    presenter.setAppState(appState);
    appState.setState('email', 'token', [Role('A', 'admin')]);
    presenter.attach(view);

    when(view.setInProgress(any)).thenAnswer((realInvocation) { });
    when(view.setFetched(any)).thenAnswer((realInvocation) { });
    when(userRepo.fetchUser('email', 'token')).thenAnswer(
            (_) async => User('email', 'email', 'coachId', 'nationality', 'dateOfBirth', 'name', 'phoneNumber'));
    when(userRepo.fetchProfileImage('email', 'token')).thenAnswer(
            (_) async => Image.asset('assets/images/prof_pic.png'));
    when(view.setUserData(any, any)).thenAnswer((realInvocation) { });
    when(newsRepo.getNews(any, any)).thenAnswer(
            (_) async => TestData.test_news_1);
    when(view.setNewsData(any)).thenAnswer((realInvocation) { });

    await presenter.fetchData();

    expect(appState.getToken(), 'token');
    expect(appState.getUserRoles().length, 1);
    verify(view.setInProgress(any)).called(4);
    verify(newsRepo.getNews(any, any)).called(1);
    verify(view.setNewsData(any)).called(1);
    verify(view.setUserData(any, any)).called(1);
  });
}