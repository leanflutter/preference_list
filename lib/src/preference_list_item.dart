import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceListItem extends StatelessWidget {
  const PreferenceListItem({
    super.key,
    this.padding,
    this.icon,
    this.title,
    this.summary,
    this.detailText,
    this.accessoryView,
    this.bottomView,
    this.disabled = false,
    this.onTap,
  });

  final EdgeInsets? padding;
  final Widget? icon;
  final Widget? title;
  final Widget? summary;
  final Widget? detailText;
  final Widget? accessoryView;
  final Widget? bottomView;
  final bool? disabled;
  final VoidCallback? onTap;

  _onTap() {
    onTap?.call();
  }

  Widget buildDetailText(BuildContext context) {
    if (detailText != null) {
      return DefaultTextStyle(
        style: const TextStyle(
          color: Color(0xff999999),
          fontSize: 13,
        ),
        child: detailText!,
      );
    } else {
      return Container();
    }
  }

  Widget buildAccessoryView(BuildContext context) {
    if (accessoryView != null) {
      return accessoryView!;
    } else {
      return const Padding(
        padding: EdgeInsets.only(left: 4),
        child: Icon(
          CupertinoIcons.chevron_forward,
          size: 14,
          color: Color(0xff999999),
        ),
      );
    }
  }

  Widget buildBottomView(BuildContext context) {
    return bottomView ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: disabled! ? null : _onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                minHeight: 48,
              ),
              padding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                children: [
                  if (icon != null)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: icon,
                    ),
                  if (title != null || summary != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (title != null)
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.color,
                                fontSize: 14,
                              ),
                              child: title!,
                            ),
                          if (summary != null)
                            DefaultTextStyle(
                              style: const TextStyle(
                                color: Color(0xff999999),
                                fontSize: 12,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, bottom: 4),
                                child: summary,
                              ),
                            ),
                        ],
                      ),
                    ),
                  buildDetailText(context),
                  buildAccessoryView(context),
                ],
              ),
            ),
            buildBottomView(context),
          ],
        ),
      ),
    );
  }
}

class PreferenceListRadioItem<T> extends PreferenceListItem {
  const PreferenceListRadioItem({
    super.key,
    super.icon,
    super.title,
    super.summary,
    super.detailText,
    super.accessoryView,
    super.onTap,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
  });

  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;

  @override
  void _onTap() {
    onChanged!(value as T);
    super._onTap();
  }

  @override
  Widget buildAccessoryView(BuildContext context) {
    if (value != null && value == groupValue) {
      return Icon(
        CupertinoIcons.checkmark_alt_circle_fill,
        size: 22,
        color: Theme.of(context).primaryColor,
      );
    }
    return Container();
  }
}

class PreferenceListSwitchItem extends PreferenceListItem {
  const PreferenceListSwitchItem({
    super.key,
    super.icon,
    super.title,
    super.summary,
    super.detailText,
    super.accessoryView,
    super.onTap,
    @required this.value,
    @required this.onChanged,
  });

  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  void _onTap() {
    onChanged!(!value!);
    super._onTap();
  }

  @override
  Widget buildAccessoryView(BuildContext context) {
    return SizedBox(
      height: 22,
      width: 34,
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: value!,
          onChanged: onChanged,
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class PreferenceListTextFieldItem extends PreferenceListItem {
  const PreferenceListTextFieldItem({
    super.key,
    super.icon,
    super.title,
    super.summary,
    super.accessoryView,
    super.onTap,
    this.placeholder,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  @override
  bool get disabled => true;

  @override
  Widget buildDetailText(BuildContext context) {
    return Expanded(
      child: CupertinoTextField(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(),
        placeholder: placeholder,
        style: const TextStyle(
          fontSize: 14,
        ),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
