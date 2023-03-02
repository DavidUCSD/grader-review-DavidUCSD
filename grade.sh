CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]; then
  echo "Student Submission Successful" 
  cp student-submission/ListExamples.java ./ 
  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java

if [[ $? -eq 0 ]]; then
    java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > testResults.txt
    echo "# of Test Passed: $(grep -c 'OK' testResults.txt)"
    echo "# of Test Failed: $(grep -c 'FAILURES!!!' testResults.txt)"
 else 
    echo "Tests failed to compile"
    exit
  fi
else
  echo "Incorrect File, please submit the correct file"
  exit 
fi
