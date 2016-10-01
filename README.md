# SwiftScreenSaverTemplate

## Overview

**SwiftScreenSaverTemplate** is a MacOS screen saver written in Swift.  The example HTML content is based upon octoscreen, referenced in the [acknowledgements](#acknowledgements) section below.  This screen saver template provides the following features:

- Embedded HTML based screen saver

## Screenshots

System Preferences - Screen Saver

<img style="max-width:100%;" src="./assets/system_preferences_screen_saver.png" />

Screen Saver - Animation

<img style="max-width:100%;" src="./assets/screen_saver_animation.gif" />

## Customizing

Replace the instance of "NewSwiftScreenSaver" in the first command below with your desired project name.

```sh
$ export newScreenSaverName="NewSwiftScreenSaver"
$ git clone https://github.com/burnsra/SwiftScreenSaverTemplate.git "$newScreenSaverName"
$ cd "$newScreenSaverName"
$ git mv SwiftScreenSaverTemplate "$newScreenSaverName"
$ git mv SwiftScreenSaverTemplate.xcodeproj "$newScreenSaverName".xcodeproj
$ find README.md "$newScreenSaverName" "$newScreenSaverName".xcodeproj -path "*html*" -prune -o -type f -print0 | xargs -0 sed -i "" "s/SwiftScreenSaverTemplate/$newScreenSaverName/g"
$ git add -A
$ git commit -m "Renamed template screen saver project to "$newScreenSaverName
$ unset newScreenSaverName
```

## Acknowledgements

- [octicons](https://octicons.github.com/) by [Github](https://github.com)
- [octoscreen](https://github.com/orderedlist/octoscreen/) by [Steve Smith (orderedlist)](steve@github.com)

## Contributions

Do you want to improve the app or add any useful features? Please go ahead and create pull requests. I'm thankful for any help.

## License

[MIT](https://github.com/burnsra/SwiftScreenSaverTemplate/blob/master/LICENSE) © Robert Burns
