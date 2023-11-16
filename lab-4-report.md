# Lab 4

Entire sequence:

```
ssh cs15lfa23rz@ieng6.ucsd.edu<enter>git clone git@github.com:owainwilliams1/lab7.git<enter>cd lab7<enter>javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar ListExamples.java<enter>java ListExamplesTests.java<enter>java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ListExamplesTests<enter>vim L<tab>.<tab>43jer2:wq<enter><up><up><up><enter><up><up><up><enter>git add -A<enter>git commit -m "bugfix"<enter>git push<enter>
```

### Log into ieng6

```bash
$ ssh cs15lfa23rz@ieng6.ucsd.edu<enter>
```

![Image](assets/Lab4-1.png)

### Clone your fork of the repository from your Github account

```bash
$ git clone git@github.com:owainwilliams1/lab7.git<enter>
```

![Image](assets/Lab4-2.png)

### Run the tests, demonstrating that they fail

```bash
$ cd lab7<enter>
```

![Image](assets/Lab4-3.png)

```bash
$ javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar ListExamples.java<enter>
$ java ListExamplesTests.java<enter>
```

![Image](assets/Lab4-4.png)

```bash
$ java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ListExamplesTests<enter>
```

![Image](assets/Lab4-5.png)

### Edit the code file to fix the failing test

```bash
$ vim L<tab>.<tab>43jer2:wq<enter>
```

![Image](assets/Lab4-6.png)

### Run the tests, demonstrating that they now succeed

```bash
$ <up><up><up><enter>
$ <up><up><up><enter>
```

![Image](assets/Lab4-7.png)

### Commit and push the resulting change to your Github account

```bash
$ git add -A<enter>
$ git commit -m "bugfix"<enter>
$ git push<enter>
```

![Image](assets/Lab4-8.png)
