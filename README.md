# vision-tools
A repo that includes all the tools and examples you need to modify and package Vision Browser.

## How can I run the scripts?
**This repo was made on a Windows system and is designed to be used on such setups**. If you have macOS or Linux, you will need to either make shell scripts yourself *or* manually run the commands.


First, create a workspace to store the files in. Windows users can use [WorkspaceBuilder](https://github.com/BeanedTaco/WorkspaceBuilder/releases) to create a workspace quickly.

Next, download the Vision repo and the Vision Tools repo.

- Vision: [Click here](https://github.com/BeanedTaco/vision/archive/master.zip)

- Vision Tools: [Click here](https://github.com/BeanedTaco/vision-tools/archive/master.zip)

Store the repos in the workspace.

Take the scripts from the [scripts](scripts) folder and move them to the main Vision repo folder.

If you haven't already, grab Node.js at its [website](https://nodejs.org). Then, install the dependencies with ``npm install``.

If you changed the appname in package.json, you will need to rename the files in the Build script accordingly.

## Where is the documentation?
[Click here to go to the documentation](https://vision.saturdaynightdead.xyz/docs).

## How to build/package Vision without a script

```npx electron-packager . --platform=darwin --arch=x64 --out=.\dist
npx electron-packager . --platform=linux --arch=x64 --out=.\dist
npx electron-packager . --platform=linux --arch=ia32 --out=.\dist
npx electron-packager . --platform=linux --arch=armv7l --out=.\dist
npx electron-packager . --platform=linux --arch=arm64 --out=.\dist
npx electron-builder build --win -p always
```
