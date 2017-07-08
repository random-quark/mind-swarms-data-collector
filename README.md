# emoscape-data-collector

This software allows a naive user to collect data using the muse device. They must also install the Muse research tools from http://developer.choosemuse.com/research-tools otherwise the app will refuse to run.

## to build
1. In processing `File > Export Application` as Mac OSX, with Java included. This will create an export folder that contains `source` and `emoscapeDataCollector.app`. Right click on `emoscapeDataCollector.app` and click `Show package contents`. The .app is just a unix directory treated specially by OSX.
1. Inside the .app folder go to `Contents/MacOS/` and rename `emoscapeDataCollector` to `emoscapeDataCollector-2`. This will be run by the custom bash script.
1. Copy the files across from `prepped_application` in the root of the repo to `Contents/MacOS/`
1. Use `ls -l` to inspect the permissions of the files `emoscapeDataCollector` and `checker`. If they are not already executable, run `chmod u+x filename` to set permissions. Otherwise the app will give an error saying its not supported or similar.
1. The app should now be able run as a single package which starts the OSC server, runs the app and the checker without the user seeing a terminal window.
