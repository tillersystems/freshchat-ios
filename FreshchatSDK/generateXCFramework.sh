#!/bin/bash
helpFunction() {
   echo ""
   echo "Usage: $0 -p libraryPath -h headersPath -m moduleName"
   exit 1 # Exit script after printing help
}

while getopts p:h:m: opt
do
    case "${opt}" in
        p) library_path=${OPTARG} ;;
        h) library_headers_path=${OPTARG} ;;
        m) expected_module_name=${OPTARG} ;;
        ?) helpFunction ;;
    esac
done

# Print helpFunction in case parameters are empty
if [ -z "$library_path" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
library_name="${library_path##*/}"
library_name="${library_name%.*}"
libraryArm64=$library_name-arm64.a
libraryX8664=$library_name-x86_64.a
library_headers_name="${library_headers_path##*/}"

rm -rf $library_name.xcframework

echo "Spliting $library_name in several .a files, one for each arch"

echo "Processing arm64 arch"
lipo $library_path -thin arm64 -output $libraryArm64
echo "Processing x86_64 arch"
lipo $library_path -thin x86_64 -output $libraryX8664

echo "Creating xcframework with arm64 & x86_64 architecture"

mkdir includes
cp $library_headers_path ./includes
echo "module $expected_module_name {
    umbrella header \"$library_headers_name\"
    export *
}" > ./includes/module.modulemap

xcodebuild -create-xcframework -library $libraryArm64 -headers ./includes -library $libraryX8664 -headers ./includes -output $library_name.xcframework

# Clean tmp files
rm $libraryArm64
rm $libraryX8664
rm -rf includes
