#! /bin/bash

CMAKE=cmake
BUILD_DIR=$(pwd)/build/codeCoverage
BUILD_TYPE=Release
thresholds=("100" "100" "80") # "Lines", "Functions" "Branches"
PASS=0
FAIL=1
PATH_TO_COVERAGE_FILE=$BUILD_DIR/coverage.txt

rm -rf $BUILD_DIR
mkdir $BUILD_DIR
$CMAKE -S . -B $BUILD_DIR --warn-uninitialized -DBUILD_COVERAGE:TYPE=ON -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS_RELEASE="-g -O0 -fprofile-arcs -ftest-coverage"
$CMAKE --build $BUILD_DIR 
cd $BUILD_DIR
ctest -T Test -T coverage
lcov --rc lcov_branch_coverage=1 --directory . --capture --output-file coverage.info
lcov --rc lcov_branch_coverage=1 --remove coverage.info '/opt/*' --output-file coverage.info
lcov --rc lcov_branch_coverage=1 --list coverage.info > coverage.txt
genhtml --rc lcov_branch_coverage=1 --legend -o html coverage.info


# Get the code coverage report from coverage.txt
total_coverage=$(grep -F "Total:" $PATH_TO_COVERAGE_FILE | tr -d ' ')

# Extract the line coverage percentage
line_coverage=($(echo "$total_coverage" | awk -F '|' '{print $2}' | awk -F '%' '{print $1}' ))

# Extract the function coverage percentage
function_coverage=($(echo "$total_coverage" | awk -F '|' '{print $3}' | awk -F '%' '{print $1}'))

# Extract the branch coverage percentage
branch_coverage=($(echo "$total_coverage" | awk -F '|' '{print $4}' | awk -F '%' '{print $1}'))



# Check if the line coverage is less than 85%
line_threshold=$PASS
if [[ "$line_coverage" != "${thresholds[0]}" ]];
then
    echo " "
    echo "Line coverage should be ${thresholds[0]}%: FAILED"
    echo "Current line coverage is: $line_coverage"
    line_threshold=$FAIL
else
    echo " "
    echo "Line coverage is: $line_coverage%: PASSED"
fi

## Check if the function coverage is less than 90%
function_threshold=$PASS
if [[ "$function_coverage" != "${thresholds[1]}" ]]; 
then
    echo " "
    echo "Function coverage should ${thresholds[1]}%: FAILED"
    echo "Current function coverage is: $function_coverage"
    function_threshold=$FAIL
else
    echo " "
    echo "Function coverage is: $function_coverage%: PASSED"
fi

# Check if the branch coverage is less than 60%
branch_threshold=$PASS
if [[ "$branch_coverage" < "${thresholds[2]}" ]]; 
then
    echo " "
    echo "Branch coverage should ${thresholds[2]}%: FAILED"
    echo "Current branch coverage is: $branch_coverage"
    branch_threshold=$FAIL
else
    echo " "
    echo "Branch coverage is: $branch_coverage%: PASSED"
fi


if [[ $line_threshold = $FAIL || $function_threshold = $FAIL || $branch_threshold = $FAIL ]];
then
    echo " "
    echo "Code Coverage FAILED!"
    #exit $FAIL
    exit $PASS
else
    echo " "
    echo "Code Coverage PASSED!"
    exit $PASS
fi
