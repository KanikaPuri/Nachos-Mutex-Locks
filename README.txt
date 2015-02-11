Readme.txt

Partners:
Daniel Burgoyne
Kanika Puri

To compile the files, use the make command in the Nachos-Java directory.
(e.g. cd Nachos-Java; make) 

There are tests provided in Nachos-Java/nachos/threads/test These are:
   Lock1
   Lock2Inversion
   Scenario1
   Scenario2

All but the 1st one has 2 conf files associated with it (with donation on/off).
    
To run the
tests, configuration files are provided in Nachos-Java/conf/PA2. Simply invoke
nachos giving it the name of the configuration file for the test you want to run.
Currently, we have the required information printing out to the file PA2Log.txt
instead of the standard output. It looks cleaner this way and the output from
the test threads themselves does a nice job of demonstrating the correctness.
You can simply view this file after each test to get detailed information about
the run. Alternatively you could remove the statistics.logFile parameter from
the config files and have the log information interleaved with thread output on
the standard output.

Added configuration parameters:
    scheduler.maxPriorityValue
    statistics.logFile
    KThread.Tester
    Locks.usePriorityDonation

The first 2 are from the previous assignment and function the same as
specified. The 3rd one is again one we added to tell nachos which test to run from
the Nachos-Java/nachos/threads/test directory. If this is not specified, then no
test will be run. The last one function as specified from the description.
