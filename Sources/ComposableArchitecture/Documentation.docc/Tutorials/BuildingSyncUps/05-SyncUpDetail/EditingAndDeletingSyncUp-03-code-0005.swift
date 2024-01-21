import ComposableArchitecture

@Reducer
struct SyncUpDetail {
  // ...
}

extension SyncUpDetail {
  @Reducer
  struct Destination {
    @ObservableState
    enum State {
      case alert(AlertState<Action.Alert>)
      case edit(SyncUpForm.State)
    }
    enum Action {
      case alert(Alert)
      case edit(SyncUpForm.Action)
      enum Alert {
        case confirmButtonTapped
      }
    }
    var body: some ReducerOf<Self> {
      Scope(state: \.edit, action: \.edit) {
        SyncUpForm()
      }
    }
  }
}

struct SyncUpDetailView: View {
  // ...
}
