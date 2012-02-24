default:
	make clean && make maclib && make ioslib && make iossimlib
maclib:
	xcodebuild -target Intern -sdk macosx10.7 build
clean:
	rm -rf build
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator5.0 build
ioslib: 
	xcodebuild -target InternIOS -sdk iphoneos5.0 build
iossimlib:
	xcodebuild -target InternIOS -sdk iphonesimulator5.0 build 