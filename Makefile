default:
	xcodebuild -target Intern -sdk macosx10.7 build
clean:
	rm -rf build/*
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator5.0 build