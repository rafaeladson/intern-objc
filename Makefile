default:
	make clean && make maclib && make ioslib && make iossimlib && make iostestlib
maclib:
	xcodebuild -target Intern -sdk macosx10.7 build
clean:
	rm -rf build
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator5.1 build
ioslib: 
	xcodebuild -target InternIOS -sdk iphoneos5.1 build
iossimlib:
	xcodebuild -target InternIOS -sdk iphonesimulator5.1 build
iostestlib:
	xcodebuild -target InternIOSTest -sdk iphonesimulator5.1 build 