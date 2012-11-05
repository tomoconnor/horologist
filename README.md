horologist
==========

The Horologist: Distributed HA cron.

Using Apache Zookeeper as a DLM.

### Data Model:
* Second (?)
* Minute
* Hour
* Day of Month
* Month
* Day of Week (Every Tuesday, etc..)
* User to run as.
* Enabled (boolean)
* Command
* Notes (comments, who put it in, etc)
* OutputTo (One of: M L S D O)
 * M = Mailto
 * L = Logstash
 * S = Syslog
 * D = /dev/null
 * O = STDOUT

Need some kind of admin controller too. 

Here's how it'll work.

1. Find the .horologist files in ~/.horologist and /etc/horologist.conf and /etc/horologist.d/*.conf

2. Parse those files into a distributed queue shared across the entire cluster.

3. For each job, calculate the time it'll run, and use rufus-scheduler to schedule that job.

4. To run a job
  1. Acquire a Distributed Lock where lockID = sha1(Command)
  2. Run the job, redirecting the output(s) to OutputTo
  3. Release the Distrib. Lock
5. Sleep till next job.

6. On SIGHUP, goto (1)


