// Mocks generated by Mockito 5.3.2 from annotations
// in lift_to_live_flutter/test/widget_tests/trainee_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:lift_to_live_flutter/presentation/ui/widgets/user_related/trainee_search_holder.dart'
    as _i3;
import 'package:lift_to_live_flutter/presentation/views/trainees_page_view.dart'
    as _i2;
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

/// A class which mocks [TraineesPageView].
///
/// See the documentation for Mockito's code generation for more information.
class MockTraineesPageView extends _i1.Mock implements _i2.TraineesPageView {
  MockTraineesPageView() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void setUserData(List<_i3.TraineeSearchHolder>? users) => super.noSuchMethod(
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
  void registerPressed(_i4.BuildContext? context) => super.noSuchMethod(
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
