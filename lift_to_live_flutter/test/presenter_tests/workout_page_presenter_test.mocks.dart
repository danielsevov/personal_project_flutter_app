// Mocks generated by Mockito 5.3.2 from annotations
// in lift_to_live_flutter/test/presenter_tests/workout_page_presenter_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:lift_to_live_flutter/domain/entities/exercise.dart' as _i7;
import 'package:lift_to_live_flutter/domain/entities/workout.dart' as _i2;
import 'package:lift_to_live_flutter/domain/entities/workout_set.dart' as _i5;
import 'package:lift_to_live_flutter/domain/repositories/exercise_repo.dart'
    as _i6;
import 'package:lift_to_live_flutter/domain/repositories/workout_repo.dart'
    as _i3;
import 'package:lift_to_live_flutter/presentation/ui/widgets/workout_related/editable_set_holder.dart'
    as _i9;
import 'package:lift_to_live_flutter/presentation/views/workout_page_view.dart'
    as _i8;
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

class _FakeWorkout_0 extends _i1.SmartFake implements _i2.Workout {
  _FakeWorkout_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WorkoutRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWorkoutRepository extends _i1.Mock implements _i3.WorkoutRepository {
  MockWorkoutRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> patchWorkout(
    int? id,
    String? coachNote,
    String? note,
    String? userId,
    String? coachId,
    List<_i5.WorkoutSet>? workoutSets,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i2.Workout>> fetchTemplates(
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
        returnValue: _i4.Future<List<_i2.Workout>>.value(<_i2.Workout>[]),
      ) as _i4.Future<List<_i2.Workout>>);
  @override
  _i4.Future<void> deleteWorkout(
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i2.Workout>> fetchWorkouts(
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
        returnValue: _i4.Future<List<_i2.Workout>>.value(<_i2.Workout>[]),
      ) as _i4.Future<List<_i2.Workout>>);
  @override
  _i4.Future<_i2.Workout> fetchTemplate(
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
        returnValue: _i4.Future<_i2.Workout>.value(_FakeWorkout_0(
          this,
          Invocation.method(
            #fetchTemplate,
            [
              id,
              jwtToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Workout>);
  @override
  _i4.Future<_i2.Workout> fetchWorkout(
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
        returnValue: _i4.Future<_i2.Workout>.value(_FakeWorkout_0(
          this,
          Invocation.method(
            #fetchWorkout,
            [
              id,
              jwtToken,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Workout>);
  @override
  _i4.Future<void> postWorkout(
    String? coachNote,
    String? note,
    String? userId,
    String? coachId,
    List<_i5.WorkoutSet>? workoutSets,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [ExerciseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExerciseRepository extends _i1.Mock
    implements _i6.ExerciseRepository {
  MockExerciseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i7.Exercise>> getExercises() => (super.noSuchMethod(
        Invocation.method(
          #getExercises,
          [],
        ),
        returnValue: _i4.Future<List<_i7.Exercise>>.value(<_i7.Exercise>[]),
      ) as _i4.Future<List<_i7.Exercise>>);
}

/// A class which mocks [WorkoutPageView].
///
/// See the documentation for Mockito's code generation for more information.
class MockWorkoutPageView extends _i1.Mock implements _i8.WorkoutPageView {
  MockWorkoutPageView() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void setTemplateData(
    String? templateName,
    String? templateNote,
    List<_i9.EditableSetHolder>? workoutSetWidgets,
    int? duration,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setTemplateData,
          [
            templateName,
            templateNote,
            workoutSetWidgets,
            duration,
          ],
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
  void notifyNoName() => super.noSuchMethod(
        Invocation.method(
          #notifyNoName,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyNoSets() => super.noSuchMethod(
        Invocation.method(
          #notifyNoSets,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifySaved() => super.noSuchMethod(
        Invocation.method(
          #notifySaved,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
