import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class basketball_shot_countersApp extends Application.AppBase {
  function initialize() {
    AppBase.initialize();
  }

  // onStart() is called on application start up
  function onStart(state as Dictionary?) as Void {}

  // onStop() is called when your application is exiting
  function onStop(state as Dictionary?) as Void {}

  // Return the initial view of your application here
  function getInitialView() as [Views] or [Views, InputDelegates] {
    var inputDelegate = new basketball_shot_countersDelegate();
    var view = new basketball_shot_countersView();
    inputDelegate.setView(view);
    return [view, inputDelegate];
  }
}

function getApp() as basketball_shot_countersApp {
  return Application.getApp() as basketball_shot_countersApp;
}
