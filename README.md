# Discord RPC client

Another Discord RPC client, cuz why not?

You can download the app from [releases](https://github.com/Zeroo28/discord_rpc/releases/) or [build](#getting-started) your client by following the steps below.

## Requirements

1. [Flutter](https://docs.flutter.dev/get-started/install)
2. Git

## Getting started

Make sure you have all the requirements installed on your machine before proceeding.

To get started, refer to flutter [documentation](https://docs.flutter.dev/).

```sh
git clone https://github.com/Zeroo28/discord_rpc
cd discord_rpc
flutter pub get
flutter build <your platform>
```

\*Your build artifacts will be in the `build` directory.

\*_Flutter only supports building an application for your platform._

**Todo:** Create scripts to build the application and package it.

## Contributing

#### Note: This project encourages the use of conventional commits, [know more](https://www.conventionalcommits.org/en/v1.0.0/).

<details>
<summary>Example of a conventional commit.</summary>

    <type>[optional scope]: <description>

    [optional body]

    [optional footer(s)]

</details>


-   Fork this repository.
-   Create a new branch: `git checkout -b <my-super-cool-feature>`
-   Commit your changes: `git commit -am "Feat: Added a new feature"`
-   Push your branch: `git push origin dev`
-   And open a pull request on GitHub.

## Known Issues

-   Can't use the custom discord RPC application id.
-   Docs to use custom discord RPC application id are not available.
