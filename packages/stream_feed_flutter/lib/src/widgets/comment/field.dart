import 'package:flutter/material.dart';
import 'package:stream_feed_flutter/src/widgets/comment/button.dart';
import 'package:stream_feed_flutter/src/widgets/comment/textarea.dart';
import 'package:stream_feed_flutter/src/widgets/user/avatar.dart';
import 'package:stream_feed_flutter/stream_feed_flutter.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

///{@template comment_field}
/// A field for adding comments to a feed.
///
/// It displays the avatar, a text area and a button to submit the comment.
///{@endtemplate}
class CommentField extends StatelessWidget {
  /// The activity on which the comment will be posted (reaction).
  ///
  /// If no activity is provided, the comment will be posted as a new activity.
  final EnrichedActivity? activity;

  /// The target feed on which the comment will be posted.
  final List<FeedId>? targetFeeds;

  /// [TextEditingController] used by both the comment text area and the
  /// submit button.
  final TextEditingController textEditingController;

  /// Whether or not to display the comment button.
  final bool enableButton;

  ///The feed group part of the feed
  final String feedGroup;

  /// Builds a [CommentField].
  const CommentField({
    Key? key,
    required this.feedGroup,
    this.activity,
    this.targetFeeds,
    required this.textEditingController,
    this.enableButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Avatar(), //TODO: User in core and onUserTap
            ),
            Expanded(
              child: TextArea(
                textEditingController: textEditingController,
              ),
            ),
            if (enableButton)
              PostCommentButton(
                feedGroup: feedGroup,
                activity: activity,
                targetFeeds: targetFeeds,
                textEditingController: textEditingController,
              )
          ],
        ),
      ],
    );
  }
}
