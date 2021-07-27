# preference_list

[![pub version][pub-image]][pub-url]

[pub-image]: https://img.shields.io/pub/v/preference_list.svg
[pub-url]: https://pub.dev/packages/preference_list

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [preference_list](#preference_list)
  - [Quick Start](#quick-start)
    - [Installation](#installation)
    - [Usage](#usage)
  - [License](#license)

  - [Quick Start](#quick-start)
    - [Installation](#installation)
    - [Usage](#usage)
  - [License](#license)

  - [Quick Start](#quick-start)
    - [Installation](#installation)
    - [Usage](#usage)
  - [API](#api)
    - [ScreenTextExtractor](#screentextextractor)
  - [License](#license)

  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Quick Start

### Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  preference_list:
    git:
      url: https://github.com/leanflutter/preference_list
      ref: main
```

### Usage

```dart
import 'package:preference_list/preference_list.dart';

Widget _build(BuildContext context) {
  return PreferenceList(
    children: <Widget>[
      PreferenceListSection(
        title: Text('APPEARANCE'),
        children: [
          PreferenceListSwitchItem(
            title: Text('Dark Appearance'),
            value: _isDarkAppearance,
            onChanged: (newValue) {
              setState(() {
                _isDarkAppearance = !_isDarkAppearance;
              });
            },
          )
        ],
      ),
      PreferenceListSection(
        title: Text('DISPLAY ZOOM'),
        description: Text(
            'Choose a view for iphone Zoomed shows larger controls. Standard shows more content'),
        children: [
          PreferenceListItem(
            title: Text('View'),
            detailText: Text('Standard'),
            onTap: () {
              BotToast.showText(text: 'Tapped!');
            },
          )
        ],
      ),
      PreferenceListSection(
        title: Text('PAIRED DEVICES'),
        description: Text(
            'Removing trusted computers will delete all of the records of computers that you have paired with previously'),
        children: [
          PreferenceListItem(
            title: Text(
              'Clear Trusted Computers',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            accessoryView: Container(),
            onTap: () {
              BotToast.showText(text: 'Tapped!');
            },
          )
        ],
      ),
    ],
  );
}
```

> Please see the example app of this plugin for a full example.

## License

```text
MIT License

Copyright (c) 2021 LiJianying <lijy91@foxmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
