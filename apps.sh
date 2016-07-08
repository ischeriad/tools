#!/bin/bash

apps=('Avid Media Composer/AvidMediaComposer.app' 'Final Cut Pro.app' 'Final Cut Studio/Final Cut Pro.app')

for app in "${apps[@]}"
do
	plist="/Applications/${app}/Contents/Info.plist"
	if [ -f "${plist}" ]
	then
		plutil -p "${plist}" | grep -E 'CFBundleShortVersionString|CFBundleName' | cut -d \" -f4 | cut -d . -f1-3
	fi
done

echo
echo "Resolution:"

system_profiler SPDisplaysDataType | grep Resolution | sed -E 's/.* ([0-9]+) x ([0-9]+).*/\1 \2/'
