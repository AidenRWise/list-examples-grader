# Create your grading script here

rm -rf student-submission
echo "removed everything from student-submission"


git clone $1 student-submission

cp -r lib student-submission

cp TestListExamples.java student-submission
echo "copied the tests to student-submission"

cd student-submission
echo "changed directory to student-submission"

FILE=ListExamples.java

if [ ! -f "$FILE" ];
then
	echo "correct file not on system: fail 0/2"
	exit

fi

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2> compileError.txt
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > goodOutput.txt

echo "after the javac and java"

if [ -s compileError.txt ]
then
echo "compile Error : Fail 0/2"
exit
fi


if grep -q "2 tests" "goodOutput.txt";
then 
echo "You passed 2/2"
exit
fi

cat goodOutput.txt
echo "You didnt pass all the test, you failed 0/2"


