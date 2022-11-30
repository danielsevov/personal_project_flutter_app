// Mocks generated by Mockito 5.3.2 from annotations
// in lift_to_live_flutter/test/presenter_tests/trainees_page_presenter_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter/material.dart' as _i9;
import 'package:lift_to_live_flutter/domain/entities/image.dart' as _i3;
import 'package:lift_to_live_flutter/domain/entities/role.dart' as _i6;
import 'package:lift_to_live_flutter/domain/entities/user.dart' as _i2;
import 'package:lift_to_live_flutter/domain/repositories/user_repo.dart' as _i4;
import 'package:lift_to_live_flutter/presentation/ui/widgets/trainee_search_widget.dart'
    as _i8;
import 'package:lift_to_live_flutter/presentation/views/trainees_page_view.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUser_0 extends _i1.SmartFake implements _i2.User {
  _FakeUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMyImage_1 extends _i1.SmartFake implements _i3.MyImage {
  _FakeMyImage_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i4.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i6.Role>> fetchUserRoles(String? jwtToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserRoles,
          [jwtToken],
        ),
        returnValue: _i5.Future<List<_i6.Role>>.value(<_i6.Role>[]),
      ) as _i5.Future<List<_i6.Role>>);
  @override
  _i5.Future<_i2.User> fetchUser(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUser,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<_i2.User>.value(_FakeUser_0(
          this,
          Invocation.method(
            #fetchUser,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i5.Future<_i2.User>);
  @override
  _i5.Future<List<_i2.User>> fetchMyTrainees(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMyTrainees,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<List<_i2.User>>.value(<_i2.User>[]),
      ) as _i5.Future<List<_i2.User>>);
  @override
  _i5.Future<List<_i3.MyImage>> getUserImages(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserImages,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<List<_i3.MyImage>>.value(<_i3.MyImage>[]),
      ) as _i5.Future<List<_i3.MyImage>>);
  @override
  _i5.Future<_i3.MyImage> fetchProfileImage(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchProfileImage,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<_i3.MyImage>.value(_FakeMyImage_1(
          this,
          Invocation.method(
            #fetchProfileImage,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i5.Future<_i3.MyImage>);
  @override
  _i5.Future<void> patchImage(
    int? id,
    String? userId,
    String? date,
    String? encoded,
    String? type,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchImage,
          [
            id,
            userId,
            date,
            encoded,
            type,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> postImage(
    String? userId,
    String? date,
    String? encoded,
    String? type,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postImage,
          [
            userId,
            date,
            encoded,
            type,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> deleteImage(
    int? id,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteImage,
          [
            id,
            jwtToken,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [TraineesPageView].
///
/// See the documentation for Mockito's code generation for more information.
class MockTraineesPageView extends _i1.Mock implements _i7.TraineesPageView {
  MockTraineesPageView() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void setUserData(List<_i8.TraineeSearchWidget>? users) => super.noSuchMethod(
        Invocation.method(
          #setUserData,
          [users],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setInProgress(bool? inProgress) => super.noSuchMethod(
        Invocation.method(
          #setInProgress,
          [inProgress],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setFetched(bool? inProgress) => super.noSuchMethod(
        Invocation.method(
          #setFetched,
          [inProgress],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyNoUserData() => super.noSuchMethod(
        Invocation.method(
          #notifyNoUserData,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerPressed(_i9.BuildContext? context) => super.noSuchMethod(
        Invocation.method(
          #registerPressed,
          [context],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void navigateToProfilePage(String? id) => super.noSuchMethod(
        Invocation.method(
          #navigateToProfilePage,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}
