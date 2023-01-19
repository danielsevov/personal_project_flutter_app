// Mocks generated by Mockito 5.3.2 from annotations
// in lift_to_live_flutter/test/factory_tests/mock_presenter_factory.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:lift_to_live_flutter/domain/entities/exercise.dart' as _i15;
import 'package:lift_to_live_flutter/domain/entities/habit.dart' as _i2;
import 'package:lift_to_live_flutter/domain/entities/habit_task.dart' as _i9;
import 'package:lift_to_live_flutter/domain/entities/image.dart' as _i4;
import 'package:lift_to_live_flutter/domain/entities/news.dart' as _i5;
import 'package:lift_to_live_flutter/domain/entities/role.dart' as _i12;
import 'package:lift_to_live_flutter/domain/entities/user.dart' as _i3;
import 'package:lift_to_live_flutter/domain/entities/workout.dart' as _i6;
import 'package:lift_to_live_flutter/domain/entities/workout_set.dart' as _i17;
import 'package:lift_to_live_flutter/domain/repositories/exercise_repo.dart'
    as _i14;
import 'package:lift_to_live_flutter/domain/repositories/habits_repo.dart'
    as _i7;
import 'package:lift_to_live_flutter/domain/repositories/news_repo.dart'
    as _i13;
import 'package:lift_to_live_flutter/domain/repositories/token_repo.dart'
    as _i10;
import 'package:lift_to_live_flutter/domain/repositories/user_repo.dart'
    as _i11;
import 'package:lift_to_live_flutter/domain/repositories/workout_repo.dart'
    as _i16;
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

class _FakeHabit_0 extends _i1.SmartFake implements _i2.Habit {
  _FakeHabit_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMyImage_2 extends _i1.SmartFake implements _i4.MyImage {
  _FakeMyImage_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNews_3 extends _i1.SmartFake implements _i5.News {
  _FakeNews_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWorkout_4 extends _i1.SmartFake implements _i6.Workout {
  _FakeWorkout_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HabitsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHabitsRepository extends _i1.Mock implements _i7.HabitsRepository {
  MockHabitsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<void> patchHabit(
    int? id,
    String? date,
    String? note,
    String? userId,
    String? coachId,
    List<_i9.HabitTask>? habits,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchHabit,
          [
            id,
            date,
            note,
            userId,
            coachId,
            habits,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<_i2.Habit> fetchTemplate(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTemplate,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<_i2.Habit>.value(_FakeHabit_0(
          this,
          Invocation.method(
            #fetchTemplate,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Habit>);
  @override
  _i8.Future<List<_i2.Habit>> fetchHabits(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchHabits,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<List<_i2.Habit>>.value(<_i2.Habit>[]),
      ) as _i8.Future<List<_i2.Habit>>);
  @override
  _i8.Future<void> postHabit(
    String? date,
    String? note,
    String? userId,
    String? coachId,
    bool? isTemplate,
    List<_i9.HabitTask>? habits,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postHabit,
          [
            date,
            note,
            userId,
            coachId,
            isTemplate,
            habits,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [TokenRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenRepository extends _i1.Mock implements _i10.TokenRepository {
  MockTokenRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> getToken(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i11.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i12.Role>> fetchUserRoles(String? jwtToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserRoles,
          [jwtToken],
        ),
        returnValue: _i8.Future<List<_i12.Role>>.value(<_i12.Role>[]),
      ) as _i8.Future<List<_i12.Role>>);
  @override
  _i8.Future<_i3.User> fetchUser(
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
        returnValue: _i8.Future<_i3.User>.value(_FakeUser_1(
          this,
          Invocation.method(
            #fetchUser,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i8.Future<_i3.User>);
  @override
  _i8.Future<List<_i3.User>> fetchMyTrainees(
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
        returnValue: _i8.Future<List<_i3.User>>.value(<_i3.User>[]),
      ) as _i8.Future<List<_i3.User>>);
  @override
  _i8.Future<List<_i4.MyImage>> fetchUserImages(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUserImages,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<List<_i4.MyImage>>.value(<_i4.MyImage>[]),
      ) as _i8.Future<List<_i4.MyImage>>);
  @override
  _i8.Future<_i4.MyImage> fetchProfileImage(
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
        returnValue: _i8.Future<_i4.MyImage>.value(_FakeMyImage_2(
          this,
          Invocation.method(
            #fetchProfileImage,
            [
              userId,
              jwtToken,
            ],
          ),
        )),
      ) as _i8.Future<_i4.MyImage>);
  @override
  _i8.Future<void> patchImage(
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
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> postImage(
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
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> deleteImage(
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
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<_i12.Role>> fetchCoachRoles(String? jwtToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchCoachRoles,
          [jwtToken],
        ),
        returnValue: _i8.Future<List<_i12.Role>>.value(<_i12.Role>[]),
      ) as _i8.Future<List<_i12.Role>>);
  @override
  _i8.Future<void> registerUser(
    String? userId,
    String? coachId,
    String? password,
    String? name,
    String? phoneNumber,
    String? nationality,
    String? dateOfBirth,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [
            userId,
            coachId,
            password,
            name,
            phoneNumber,
            nationality,
            dateOfBirth,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [NewsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRepository extends _i1.Mock implements _i13.NewsRepository {
  MockNewsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.News> getNews(
    String? search,
    int? count,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNews,
          [
            search,
            count,
          ],
        ),
        returnValue: _i8.Future<_i5.News>.value(_FakeNews_3(
          this,
          Invocation.method(
            #getNews,
            [
              search,
              count,
            ],
          ),
        )),
      ) as _i8.Future<_i5.News>);
}

/// A class which mocks [ExerciseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExerciseRepository extends _i1.Mock
    implements _i14.ExerciseRepository {
  MockExerciseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i15.Exercise>> getExercises() => (super.noSuchMethod(
        Invocation.method(
          #getExercises,
          [],
        ),
        returnValue: _i8.Future<List<_i15.Exercise>>.value(<_i15.Exercise>[]),
      ) as _i8.Future<List<_i15.Exercise>>);
}

/// A class which mocks [WorkoutRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWorkoutRepository extends _i1.Mock implements _i16.WorkoutRepository {
  MockWorkoutRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<void> patchWorkout(
    int? id,
    String? coachNote,
    String? note,
    String? userId,
    String? coachId,
    List<_i17.WorkoutSet>? workoutSets,
    String? completedOn,
    String? createdOn,
    String? name,
    String? duration,
    bool? isTemplate,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchWorkout,
          [
            id,
            coachNote,
            note,
            userId,
            coachId,
            workoutSets,
            completedOn,
            createdOn,
            name,
            duration,
            isTemplate,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<_i6.Workout>> fetchTemplates(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTemplates,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<List<_i6.Workout>>.value(<_i6.Workout>[]),
      ) as _i8.Future<List<_i6.Workout>>);
  @override
  _i8.Future<void> deleteWorkout(
    int? id,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteWorkout,
          [
            id,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<_i6.Workout>> fetchWorkouts(
    String? userId,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWorkouts,
          [
            userId,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<List<_i6.Workout>>.value(<_i6.Workout>[]),
      ) as _i8.Future<List<_i6.Workout>>);
  @override
  _i8.Future<_i6.Workout> fetchTemplate(
    int? id,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTemplate,
          [
            id,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<_i6.Workout>.value(_FakeWorkout_4(
          this,
          Invocation.method(
            #fetchTemplate,
            [
              id,
              jwtToken,
            ],
          ),
        )),
      ) as _i8.Future<_i6.Workout>);
  @override
  _i8.Future<_i6.Workout> fetchWorkout(
    int? id,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWorkout,
          [
            id,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<_i6.Workout>.value(_FakeWorkout_4(
          this,
          Invocation.method(
            #fetchWorkout,
            [
              id,
              jwtToken,
            ],
          ),
        )),
      ) as _i8.Future<_i6.Workout>);
  @override
  _i8.Future<void> postWorkout(
    String? coachNote,
    String? note,
    String? userId,
    String? coachId,
    List<_i17.WorkoutSet>? workoutSets,
    String? completedOn,
    String? createdOn,
    String? name,
    String? duration,
    bool? isTemplate,
    String? jwtToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postWorkout,
          [
            coachNote,
            note,
            userId,
            coachId,
            workoutSets,
            completedOn,
            createdOn,
            name,
            duration,
            isTemplate,
            jwtToken,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}
