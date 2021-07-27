import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceListItem extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? icon;
  final Widget? title;
  final Widget? summary;
  final Widget? detailText;
  final Widget? accessoryView;
  final Widget? bottomView;
  final bool? disabled;
  final VoidCallback? onTap;

  const PreferenceListItem({
    Key? key,
    this.padding,
    this.icon,
    this.title,
    this.summary,
    this.detailText,
    this.accessoryView,
    this.bottomView,
    this.disabled = false,
    this.onTap,
  }) : super(key: key);

  _onTap() {
    if (onTap != null) {
      onTap!();
    }
  }

  Widget buildDetailText(BuildContext context) {
    if (detailText != null) {
      return DefaultTextStyle(
        style: TextStyle(
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
      return Padding(
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
      color: Theme.of(context).canvasColor,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: disabled! ? null : _onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: 48,
              ),
              padding: padding ?? EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                children: [
                  if (icon != null)
                    Container(
                      child: icon,
                      margin: EdgeInsets.only(right: 10),
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
                                    .headline6
                                    ?.color,
                                fontSize: 14,
                              ),
                              child: title!,
                            ),
                          if (summary != null)
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 12,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 4, bottom: 4),
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
  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;

  const PreferenceListRadioItem({
    Key? key,
    Widget? icon,
    Widget? title,
    Widget? summary,
    Widget? detailText,
    Widget? accessoryView,
    VoidCallback? onTap,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
  }) : super(
          key: key,
          icon: icon,
          title: title,
          summary: summary,
          detailText: detailText,
          accessoryView: accessoryView,
          onTap: onTap,
        );

  @override
  void _onTap() {
    onChanged!(value!);
    super._onTap();
  }

  @override
  Widget buildAccessoryView(BuildContext context) {
    if (value != null && value == groupValue) {
      return Container(
        child: Icon(
          CupertinoIcons.checkmark_alt_circle_fill,
          size: 22,
          color: Theme.of(context).primaryColor,
        ),
      );
    }
    return Container();
  }
}

class PreferenceListSwitchItem extends PreferenceListItem {
  final bool? value;
  final ValueChanged<bool>? onChanged;

  const PreferenceListSwitchItem({
    Key? key,
    Widget? icon,
    Widget? title,
    Widget? summary,
    Widget? detailText,
    Widget? accessoryView,
    VoidCallback? onTap,
    @required this.value,
    @required this.onChanged,
  }) : super(
          key: key,
          icon: icon,
          title: title,
          summary: summary,
          detailText: detailText,
          accessoryView: accessoryView,
          onTap: onTap,
        );

  @override
  void _onTap() {
    onChanged!(!value!);
    super._onTap();
  }

  @override
  Widget buildAccessoryView(BuildContext context) {
    return Container(
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
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  const PreferenceListTextFieldItem({
    Key? key,
    Widget? icon,
    Widget? title,
    Widget? summary,
    Widget? accessoryView,
    VoidCallback? onTap,
    this.placeholder,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(
          key: key,
          icon: icon,
          title: title,
          summary: summary,
          accessoryView: accessoryView,
          onTap: onTap,
        );

  @override
  bool get disabled => true;

  @override
  Widget buildDetailText(BuildContext context) {
    return Expanded(
      child: CupertinoTextField(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(),
        placeholder: placeholder,
        style: TextStyle(
          fontSize: 14,
        ),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
