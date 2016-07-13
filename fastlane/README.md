fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
### ci_commit
```
fastlane ci_commit
```
Runs tests and builds example for the given environment

The lane to run by ci on every commit This lanes calls the lanes `test_framework` and `build_example`.

####Example:

```
fastlane ci_commit configuration:Debug --env ios91
```

####Options

 * **`configuration`**: The build configuration to use. (`AF_CONFIGURATION`)


### test_framework
```
fastlane test_framework
```
Runs all tests for the given environment

Set `scan` action environment variables to control test configuration

####Example:

```
fastlane test_framework configuration:Debug --env ios91
```

####Options

 * **`configuration`**: The build configuration to use.



----

This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools).
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).