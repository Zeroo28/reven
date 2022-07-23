### Contents
1. [Getting started](#getting-started).
    - [Download](#download).
    - [Build your client](#building-your-client).
2. [Contributing](#contributing).
3. [FAQ](#faq).
4. [Known issues](#known-issues).
5. [License](#license).

## Getting started

### Download

You can download the app from [releases](https://github.com/Zeroo28/discord_rpc/releases/) or [build](#getting-started) your client.

### Building your client

Make sure you have all the requirements installed on your machine before proceeding.

**Requirements**: [Flutter](https://docs.flutter.dev/get-started/install) and Git.

For flutter-related questions/doubts, refer to their [documentation](https://docs.flutter.dev/).

Then, clone the repository and install all dependencies.

```sh
git clone https://github.com/Zeroo28/discord_rpc
cd discord_rpc
flutter pub get
```

To build the release version of Reven run the following commands:

```sh
# Make sure that you're on the main branch
git checkout main

# Re-install dependencies because the last command will change files.
flutter pub get

# Now you can build your client.
flutter build windows|macos|linux --release
```

You can find the generated artifacts in the build directory. I.e `build/windows/` on windows, `build/macos` on macOS and `build/linux/<release|debug>/bundle/` on Linux.

To build the unstable dev version, run the following commands:

```sh
# Switch to the dev branch
git checkout dev

# Re-install dependencies because the last command will change files.
flutter pub get

# Build the application
flutter build windows|macos|linux --release|debug
```

## Contributing

-   Fork this repository.
-   Create a new branch: `git checkout -b <my-super-cool-feature>`
-   Commit your changes: `git commit -am "Feat: Added a new feature"`

-   Make sure that you don't have any errors and the application runs as expected.

-   Push your branch: `git push origin dev`
-   And open a pull request on GitHub.

Note: This project encourages the use of conventional commits, [know more](https://www.conventionalcommits.org/en/v1.0.0/).

## FAQ

**Q**: Why make another discord rich presence client? There are already a lot of them out there...

**A:** I wanted to make my own application because very few of them supported the Linux platform or required Java to be installed on the machine. PS, this app doesn't require anything to be installed on your machine ;D ( unless you want to build it by yourself, duh )

*More FAQs will be added soon™.*

## Known Issues

-   Update [build](#building-your-client) instructions to specify the exact artifact locations on Windows and MacOS.

-   Script to generate package after building the application.

## License

MIT License

Copyright (c) 2022 Zeroo28

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
