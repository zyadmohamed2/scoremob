enum EventTypesEnum { Goal, Card, Subst, Var }

sealed class EventType {
  const EventType();

  factory EventType.goal(String detail) => EventTypeGoal(detail);

  factory EventType.card(String detail) => EventTypeCard(detail);

  factory EventType.VAR(String detail) => EventTypeVAR(detail);

  factory EventType.sub(String detail) => EventTypeSub(detail);
}

// Sub
// ===============================================================================================================================
class EventTypeSub extends EventType {
  String detail;

  EventTypeSub(this.detail);
}

// Goal
// ===============================================================================================================================
class EventTypeGoal extends EventType {
  late EventTypeGoalEnum goalType;

  EventTypeGoal(String detail) {
    this.goalType = _parseType(detail);
  }

  EventTypeGoalEnum _parseType(String detail) {
    if (detail.toLowerCase().contains('own')) {
      return EventTypeGoalEnum.Own;
    }
    if (detail.toLowerCase().contains('missed')) {
      return EventTypeGoalEnum.MissedPenalty;
    }
    if (detail.toLowerCase().contains('penalty')) {
      return EventTypeGoalEnum.Penalty;
    }
    return EventTypeGoalEnum.Normal;
  }

  bool isOwnGoal() {
    return goalType == EventTypeGoalEnum.Own;
  }

  bool isPenalty() {
    return goalType == EventTypeGoalEnum.Penalty;
  }

  bool isMissedPenalty() {
    return goalType == EventTypeGoalEnum.MissedPenalty;
  }

  bool shouldCount() {
    return !this.isMissedPenalty();
  }
}

enum EventTypeGoalEnum { Normal, Own, Penalty, MissedPenalty }

// VAR
// ===============================================================================================================================
class EventTypeVAR extends EventType {
  EventTypeVAR(String detail) {
    this.varType = _parseType(detail);
  }

  late EventTypeVAREnum varType;

  EventTypeVAREnum _parseType(String detail) {
    if (detail.toLowerCase().contains('cancel')) {
      return EventTypeVAREnum.GoalCancelled;
    } else {
      return EventTypeVAREnum.PenaltyConfirmed;
    }
  }
}

enum EventTypeVAREnum { GoalCancelled, PenaltyConfirmed }

// Card
// ===============================================================================================================================

class EventTypeCard extends EventType {
  EventTypeCard(String detail) {
    this.cardType = _parseType(detail);
  }

  late EventTypeCardEnum cardType;

  EventTypeCardEnum _parseType(String detail) {
    if (detail.toLowerCase().contains('red')) {
      return EventTypeCardEnum.Red;
    } else {
      return EventTypeCardEnum.Yellow;
    }
  }
}

enum EventTypeCardEnum { Yellow, Red }
