// Mocks generated by Mockito 5.3.2 from annotations
// in lift_to_live_flutter/test/repository_tests/token_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:http/http.dart' as _i2;
import 'package:lift_to_live_flutter/data/datasources/backend_api.dart' as _i3;
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

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BackendAPI].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackendAPI extends _i1.Mock implements _i3.BackendAPI {
  MockBackendAPI() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response> logIn(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #logIn,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #logIn,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> fetchUserRoles(String? jwtToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserRoles,
          [jwtToken],
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #fetchUserRoles,
            [jwtToken],
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> fetchUsers(String? jwtToken) => (super.noSuchMethod(
        Invocation.method(
          #fetchUsers,
          [jwtToken],
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #fetchUsers,
            [jwtToken],
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> fetchUser(
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
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #fetchUser,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> fetchProfileImage(
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
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #fetchProfileImage,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Response>);
}
