# conde_mobprog

Flutter app for the Facebook replication laboratory activities: a newsfeed and a notification screen, switched with a bottom navigation bar.

## Lab Activity 1: discussion

### Dynamic image integration in `newsfeed_card.dart`

To support posts both with and without images cleanly in `NewsfeedCard`, `imagePath` is declared as a nullable `String?` field in the constructor. When `NewsfeedScreen` builds a card, posts without an image (such as Steve Rogers's post) leave `imagePath` as `null`, while posts with an image (such as Tony Stark's post) pass `'assets/images/iron_man.jpg'`.

Inside the card's `build()`, conditional rendering checks whether an image should be shown before building that part of the UI. If there is no image, the image widget is not created at all, so text-only posts have no extra empty space and no missing-asset errors. When an image path is given, rendering is handed to the reusable `PostImage` widget, which wraps `Image.asset` with `width: double.infinity`, a default height of 220, `BoxFit.cover`, rounded corners through `ClipRRect`, and an `errorBuilder` that shows an "Image not found" box if the file is missing.

Splitting the image display into `PostImage` keeps `newsfeed_card.dart` short and readable, and makes it easy to feed the card dynamic data where only some posts have media.

## Lab Activity 2: discussion

**Laboratory Discussion:** Discuss how you manage to do the posts and the notification efficiently. Also, how you've accomplished the enhancement states the challenges and how you address them.

### How the posts and notifications were done

Instead of writing one card or one tile per item, I turned each post and each notification into a row of data and let Flutter build the widgets from that data.

- **Posts:** `newsfeed_screen.dart` holds a list of 10 posts. Each one has a user name, post content, date, number of likes, a `hasImage` flag, and optional image and avatar paths. A `ListView.builder` reads the list and creates one `NewsfeedCard` per item, so adding a post means adding one row, not copying a widget.
- **Notifications:** `notification_screen.dart` holds a list of 20 notifications (name, post, description). A `ListView.separated` builds one `NotificationWidget` per item and puts a `Divider` between them. Both lists scroll, and `builder` only creates the items that are on screen, which keeps it efficient.
- **Reusable widgets:** `NewsfeedCard`, `NotificationWidget`, `CustomText`, `PostImage`, `UserAvatar` and `ActionButton` are separate files, so the styling lives in one place.

### Enhancements

1. **Dynamic post:** the card takes the number of likes, the date and `hasImage` as parameters. When `hasImage` is true it shows the post image if a path is given, or a grey placeholder box if not. When it is false, nothing is shown. The like button also toggles and updates its count.
2. **Dynamic AppBar title:** a `_titles` list is indexed by the selected tab, so the title changes with the page.
3. **More BottomNavigationBarItem:** added a third Profile item and a third page in the `PageView`.
4. **App name:** changed to Kwentuhan, stored once as `appName` in `constants.dart` and used in the AppBar and the app title.
5. **Color palette:** the colors in `constants.dart` were changed to a teal palette. Every widget reads from those constants, so one file controls the whole theme.

### Challenges and how I addressed them

- **Sizes looked huge in Chrome.** `flutter_screenutil` scales from a 412 x 715 phone design size, so a wide browser window scales everything up. I tested in a phone sized window instead.
- **Imports and file names did not match.** The required structure uses `constants.dart` and `notification_screen.dart`, so I renamed the files and updated every import. A typo in one file name caused import errors until I fixed it.
- **Bottom navigation and pages falling out of sync.** Tapping a tab calls `jumpToPage`, and swiping calls `onPageChanged`, and both update `_selectedIndex` so the highlighted icon and the AppBar title always match.
- **Posts with and without images.** Not every post has a real image file, so `hasImage` decides whether the image area exists, and a placeholder fills in when there is no path. This keeps the layout consistent without needing 10 image files.