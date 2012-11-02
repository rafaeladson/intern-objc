#! /bin/bash
set +e

###########################################################################################################################################################
# Executing this will do the following:
# 1) delete InternIOS, InternIOSTest and any *.lproj folder in your lib dir.
# 2) download the file in the URL given as a command line parameter
# 3) extract the contents of the downloaded file to the lib directory
# 4) copy the language files to any *.lproj folder that it can find on the path (except in build and lib folders).
#
# Make sure that you understand the source code before running this. This was made to simplify the life of people trying to configure
# their project to use Intern, but I haven't in any way tried to solve every possible situation and the script can be destructive.
# At least, make sure that you can restore your workspace with ease via backup or a SCM if things go wrong.
###########################################################################################################################################################


if [ $# -eq 0 ]
then 
    echo "Usage: $0 <URL>"
    exit 1
fi

mkdir -p lib

rm -Rf lib/InternIOS
rm -Rf lib/InternIOSTest
rm -Rf lib/*.lproj


wget -O /tmp/intern.tgz "$1"
tar -xvzf /tmp/intern.tgz -C lib/
find $(ls | grep -v build | grep -v lib) -iname en.lproj -exec cp lib/en.lproj/Intern.strings {} \;

rm -Rf lib/*.lproj
rm -Rf /tmp/intern.tgz