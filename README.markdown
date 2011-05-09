Here’s another handy little object. Again, it’s pretty trivial but might save you 10 minutes.

Extend StageAwareSprite instead of Sprite to get automatic handing of any stage-related activity. This simply saves you all the hassle of adding and removing the event listeners yourself.

The class has protected addedToStage, removedFromStage and stageResize methods that are triggered as you expect but which do nothing by default. They are intended to be extended so you can create your own custom behaviours.