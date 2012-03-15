#! /bin/bash
set +e
make clean && make && WRITE_JUNIT_XML=YES make test

#Build InternIOS
mkdir build/InternIOS
find Intern InternIOS -iname *.h -exec cp -Rf {} build/InternIOS/ \;
cp build/Release-iphoneos/libInternIOS.a build/InternIOS
cp build/Release-iphonesimulator/libInternIOS.a build/InternIOS/libInternIOS-simulator.a

#Build InternIOSTest
mkdir build/InternIOSTest
find InternIOSTest -iname *.h -exec cp -Rf {} build/InternIOSTest/ \;
cp build/Release-iphonesimulator/libInternIOSTest.a build/InternIOSTest/

#Copy language files
mkdir build/en.lproj
cp InternIOS/en.lproj/Intern.strings build/en.lproj/Intern.strings

#Create package
cd build/
tar -czvf intern.tgz InternIOS InternIOSTest *.lproj
