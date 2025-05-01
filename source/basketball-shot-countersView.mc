import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class basketball_shot_countersView extends WatchUi.View {
  var madeShots = 0;
  var missedShots = 0;
  var backgroundImg = null;

  function incrMadeShots() as Void {
    madeShots++;
    System.println("Made shots: " + madeShots);
    WatchUi.requestUpdate();
  }

  function incrMissedShots() as Void {
    missedShots++;
    System.println("Missed shots: " + missedShots);
    WatchUi.requestUpdate();
  }

  function initialize() {
    View.initialize();
  }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.MainLayout(dc));
  }

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {
    // load the background image to variable
    backgroundImg = WatchUi.loadResource(Rez.Drawables.BackgroundImg);
  }

  function onUpdate(dc) {
    View.onUpdate(dc); // Always call parent

    if (backgroundImg != null) {
      System.println("drawing bitmap");
      dc.drawBitmap(0, 0, backgroundImg);
    }

    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

    var madeShotsLabel = WatchUi.loadResource(Rez.Strings.madeShotsLabel);
    var missedShotsLabel = WatchUi.loadResource(Rez.Strings.missedShotsLabel);

    // Labels -----
    dc.drawText(
      (0.5 * dc.getWidth()) / 2,
      0.3 * dc.getHeight(),
      Graphics.FONT_LARGE,
      madeShotsLabel,
      Graphics.TEXT_JUSTIFY_CENTER
    );
    dc.drawText(
      (1.5 * dc.getWidth()) / 2,
      0.3 * dc.getHeight(),
      Graphics.FONT_LARGE,
      missedShotsLabel,
      Graphics.TEXT_JUSTIFY_CENTER
    );

    // Values -----

    dc.drawText(
      (0.5 * dc.getWidth()) / 2,
      0.5 * dc.getHeight(),
      Graphics.FONT_LARGE,
      madeShots.toString(),
      Graphics.TEXT_JUSTIFY_CENTER
    );
    dc.drawText(
      (1.5 * dc.getWidth()) / 2,
      0.5 * dc.getHeight(),
      Graphics.FONT_LARGE,
      missedShots.toString(),
      Graphics.TEXT_JUSTIFY_CENTER
    );
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}
}
