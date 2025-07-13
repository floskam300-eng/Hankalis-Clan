import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class EmojisWidget extends StatelessWidget {
  const EmojisWidget({
    super.key,
    required this.overlayPortalController,
    required this.emojisBtnKey,
    required this.onEmojiSelected,
    this.newTop,
    this.newLeft,
  });

  final OverlayPortalController overlayPortalController;
  final GlobalKey emojisBtnKey;
  final void Function(Category?, Emoji)? onEmojiSelected;

  final double? newTop;
  final double? newLeft;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return OverlayPortal(
      controller: overlayPortalController,
      overlayChildBuilder: (context) {
        final RenderBox renderBox =
            emojisBtnKey.currentContext!.findRenderObject() as RenderBox;
        final Offset offset = renderBox.localToGlobal(Offset.zero);
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  overlayPortalController.hide();
                },
                behavior: HitTestBehavior.opaque,
              ),
            ),
            Positioned(
              top: offset.dy - (newTop ?? 300),
              left: offset.dx - (newLeft ?? 0),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: SizedBox(
                  height: 300,
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: EmojiPicker(
                      onEmojiSelected: onEmojiSelected,
                      onBackspacePressed: () {},
                      config: Config(
                        height: 50,
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          gridPadding: const EdgeInsets.all(5),
                          recentsLimit: 15,
                          replaceEmojiOnLimitExceed: true,
                          loadingIndicator: Center(
                            child: CircularProgressIndicator(),
                          ),
                          backgroundColor: theme.onSecondary,
                          emojiSizeMax: 20 * (foundation.kIsWeb ? 1.30 : 1.0),
                        ),
                        viewOrderConfig: const ViewOrderConfig(
                          top: EmojiPickerItem.categoryBar,
                          middle: EmojiPickerItem.emojiView,
                        ),
                        skinToneConfig: const SkinToneConfig(),
                        categoryViewConfig: CategoryViewConfig(
                          backgroundColor: theme.onSecondary,
                          dividerColor: theme.onPrimaryContainer,
                          iconColorSelected: theme.onTertiary,
                          indicatorColor: theme.onTertiary,
                        ),
                        bottomActionBarConfig: BottomActionBarConfig(
                          enabled: false,
                        ),
                        searchViewConfig: const SearchViewConfig(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
