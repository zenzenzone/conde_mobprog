# conde_mobprog — Flutter Newsfeed Laboratory

## Laboratory Discussion: Dynamic Image Integration in `newsfeed_card.dart`

To support posts both with and without images cleanly in `NewsfeedCard`, `imagePath` is declared as a nullable `String?` field in the `NewsfeedCard` widget constructor. When `NewsfeedScreen` builds a card, posts without an image (such as Steve Rogers's post) omit `imagePath` (defaulting to `null`), while posts with an image (such as Tony Stark's post) pass `'assets/images/iron_man.jpg'`.

Inside `NewsfeedCardState.build()`, conditional rendering (`if (widget.imagePath != null)`) checks whether an image path is provided before rendering the UI. If `widget.imagePath` is `null`, the image widget is not mounted at all, preventing unnecessary layout space or missing-asset errors on text-only posts. When `widget.imagePath` is non-null, it delegates rendering to the reusable `PostImage` widget (`PostImage(imagePath: widget.imagePath!)`), which wraps `Image.asset` with responsive `flutter_screenutil` sizing (`width: double.infinity`, `height: 200.h`, `fit: BoxFit.cover`) and rounded corners (`BorderRadius.circular(10.r)`).

Modularizing the image display into `PostImage` and pairing it with `if (widget.imagePath != null)` keeps `newsfeed_card.dart` clean, readable, and adaptable for dynamic feed data where only certain posts include media.