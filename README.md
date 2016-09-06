# Pre-work - *Tipi*

**Tipi** is a tip calculator application for iOS.

Submitted by: **Usman Ajmal**

Time spent: **8** hours spent in total
            (while some serious people-watching at coffee-shop)

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* **[x]** UI animations
* **[x]** Remembering the bill amount across app restarts (if <10mins)
* **[x]** Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* **[x]** The Tip calculator has a very primitive UI. Feel free to play with colors, layout, or even modify the UI to improve it.
* **[ ]** Using locale-specific currency and currency thousands separators.
* **[ ]** Add a light/dark color theme

The following **additional** features are implemented:

- [x] Feature for splitting the total amount between 2,3 and 4 people

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/a/Ysq8R' title='Tipi Video Walkthrough' width='' alt='Tipi Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- I wasn't able to use NSDate. Used NSTimer for the timer functionality
- Had trouble with solving a warning related to usage of #selector
  instead of creatin a new selector but figured it out finally.
- Had trouble sometimes with navigating between files in Xcode sometimes
- Couldn't define static array for tip percentages
 

## License

    Copyright [2016] [Usman Ajmal]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
