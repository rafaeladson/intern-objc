default:
	make clean && make maclib && make ioslib && make iossimlib && make iostestlib
maclib:
	xcodebuild -target Intern -sdk macosx10.7 build
clean:
	rm -rf build
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator6.0 build
ioslib: 
	xcodebuild -target InternIOS -sdk iphoneos6.0 build
iossimlib:
	xcodebuild -target InternIOS -sdk iphonesimulator6.0 build
iostestlib:
	xcodebuild -target InternIOSTest -sdk iphonesimulator6.0 build 