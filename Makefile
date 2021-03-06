JAVADOCPARAMS = -doctitle "Nachos 4.0 Java" -protected \
		-link http://java.sun.com/products/jdk/1.2/docs/api

machine =	Lib Config Stats Machine TCB \
		Interrupt Timer \
		Processor TranslationEntry \
		SerialConsole StandardConsole \
		OpenFile OpenFileWithPosition ArrayFile FileSystem StubFileSystem \
		ElevatorBank ElevatorTest ElevatorGui \
		ElevatorControls ElevatorEvent ElevatorControllerInterface \
		RiderControls RiderEvent RiderInterface \
		Kernel Coff CoffSection \
		NetworkLink Packet MalformedPacketException

security =	Privilege NachosSecurityManager

ag =		AutoGrader BoatGrader

threads =	ThreadedKernel KThread Alarm \
		Scheduler ThreadQueue RoundRobinScheduler \
		Semaphore Lock Condition SynchList \
		Condition2 Communicator Rider ElevatorController \
		PriorityScheduler LotteryScheduler Boat \
        AdderThread StaticPriorityScheduler DynamicPriorityScheduler \
        MultiLevelScheduler ResourceNode Log
         
tests = TestScheduler Lock1 Lock2Inversion Scenario1 Scenario2

userprog =	UserKernel UThread UserProcess SynchConsole

vm =		VMKernel VMProcess

network = 	NetKernel NetProcess PostOffice MailMessage

ALLDIRS = machine security ag threads userprog vm network threads/test

PACKAGES := $(patsubst %,nachos.%,$(ALLDIRS))

CLASSFILES := $(foreach dir,$(ALLDIRS),$(patsubst %,nachos/$(dir)/%.class,$($(dir)))) $(patsubst %,nachos/threads/test/%.class,$(tests))

.PHONY: all rmtemp clean doc hwdoc swdoc

all: $(CLASSFILES)
	
nachos/%.class: nachos/%.java
	javac -classpath . -d . -g $<

clean:
	rm -f */*/*.class */*/*/*.class

doc:
	mkdir -p ../doc
	javadoc $(JAVADOCPARAMS) -d ../doc -sourcepath .. $(PACKAGES)

test:
	cd ../test ; gmake
