CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone -q $1 student-submission
echo 'Downloaded submission.'

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

# check if file exists
if ! test -f student-submission/ListExamples.java; then
  echo "ListExamples.java file does not exist."
fi

# move files to grading area
cp -r student-submission/ grading-area/

# move grading files to grading area
cp GradeServer.java Server.java TestListExamples.java grading-area

# export classpath
export CLASSPATH=$CLASSPATH:$PWD/lib/hamcrest-core-1.3.jar:$PWD/lib/junit-4.13.2.jar

# change directory to grading area
cd grading-area

# add to classpath
export CLASSPATH=$CLASSPATH:$PWD

# compile the files
javac GradeServer.java Server.java TestListExamples.java ListExamples.java 2> debug.txt

# check if the program compiled sucessfully
if [ ! $? -eq 0 ]; then
  echo "Failed to compile submission. Check ' $PWD/debug.txt ' to see your errors."
  exit;
fi
echo "Compiled submission."

java org.junit.runner.JUnitCore TestListExamples > result.txt
if [ $? -eq 0 ]; then
  echo "Test complete [1/1]."
else
  echo "Test complete [0/1]."
fi
