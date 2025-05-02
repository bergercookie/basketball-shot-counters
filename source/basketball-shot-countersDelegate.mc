import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class basketball_shot_countersDelegate extends WatchUi.BehaviorDelegate {
  var view;

  function initialize() {
    BehaviorDelegate.initialize();
  }

  function onUpdate(event) {
    System.println("onUpdate: " + event);

    return true;
  }

  function setView(v as basketball_shot_countersView) as Void {
    System.println("setView: " + view);
    view = v;
  }

  function onKey(event) {
    var key = event.getKey();
    // System.println("onKey: " + key);
    if (key == WatchUi.KEY_DOWN) {
      System.println("Counting made shot...");
      view.incrMadeShots();
    } else if (key == WatchUi.KEY_ESC) {
      System.println("Counting missed shot...");
      view.incrMissedShots();
    } else if (key == WatchUi.KEY_ENTER) {
      System.println("Exiting view...");
      view.exitView();
    } else {
      System.println("Unknown key: " + key);
    }

    return true;
  }
}
