default:
	xcodebuild -target InternIOS -sdk iphonesimulator5.0
clean:
	rm -rf build/*
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator5.0 build
lib:
	xcodebuild -target Intern -sdk macosx10.7 build
