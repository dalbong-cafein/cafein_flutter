import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatefulWidget {
  final String text;

  final TextStyle? textStyle;

  final TextStyle? linkStyle;

  final TextAlign textAlign;

  final bool shouldTrimParams;

  final void Function(String url)? onLinkTap;

  const LinkText(
    this.text, {
    Key? key,
    this.textStyle,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.shouldTrimParams = false,
    this.onLinkTap,
  }) : super(key: key);

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  final _gestureRecognizers = <TapGestureRecognizer>[];
  final _regex = RegExp(
      r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%.,_\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\,+.~#?&//=]*)");
  final _shortenedRegex = RegExp(r"(.*)\?");

  @override
  void dispose() {
    for (var recognizer in _gestureRecognizers) {
      recognizer.dispose();
    }
    super.dispose();
  }

  void _launchUrl(String url) async {
    if (widget.onLinkTap != null) {
      widget.onLinkTap!(url);
      return;
    }

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textStyle = widget.textStyle ?? themeData.textTheme.bodyMedium;
    final linkStyle = widget.linkStyle ??
        themeData.textTheme.bodyMedium?.copyWith(
          color: themeData.colorScheme.secondary,
          decoration: TextDecoration.underline,
        );

    final links = _regex.allMatches(widget.text);

    if (links.isEmpty) {
      return Text(widget.text, style: textStyle);
    }

    final textParts = widget.text.split(_regex);
    final textSpans = <TextSpan>[];

    int i = 0;
    for (var part in textParts) {
      textSpans.add(TextSpan(text: part, style: textStyle));

      if (i < links.length) {
        final link = links.elementAt(i).group(0) ?? '';
        String? shortenedLink;

        final recognizer = TapGestureRecognizer()
          ..onTap = () => _launchUrl(link);

        if (widget.shouldTrimParams) {
          shortenedLink = _shortenedRegex.firstMatch(link)?.group(1);
        }

        _gestureRecognizers.add(recognizer);

        textSpans.add(
          TextSpan(
            text: shortenedLink ?? link,
            style: linkStyle,
            recognizer: recognizer,
          ),
        );

        i++;
      }
    }

    return Text.rich(
      TextSpan(children: textSpans),
      textAlign: widget.textAlign,
    );
  }
}
