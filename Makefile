default:
	xcodebuild -target Intern -sdk macosx10.7 build
clean:
	rm -rf build
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator5.0 build
staticlib: default test
	xcodebuild -target InternIOS -sdk iphonesimulator5.0 build; find Intern -iname *.h -exec cp {} build/Release-iphonesimulator/ \;