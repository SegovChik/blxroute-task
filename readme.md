This repository contains terraform code to describe a minimalistic infrastructure of two servers, one for the logging system, the other for the etx node, and a description of the security groups for them.Also a simple ansible configuration to deploy all software.

Task 1
We need to load part of the geth logs to s3 central log repository (elastic for example). We want to use fluentd or logstash to read the geth log file and extract only the relevant rows. 
You need to create the fluentd / logstash configuration that:
1. read the geth log - the source can be a local file that geth writes log records to
2. extract only part of the geth log records and save them to a different file (every 5 minutes, you should create a new file), in this task we will use the following pattern
* Persisted the clean trie cache.
* Writing clean trie cache to disk
all other log records should not be in the output file(s) 

I made it in a different way, accepting the http log from containers, and pushing filtered logs to grafana loki.
it was useful for me, it might be useful for you too:) 

But also here is a template for a literally completed task

#####################
### Read log file
<source>
  @type tail 
  <parse>
    @type none
  </parse>
  read_from_head true
  tag geth.app
  path {{ geth_logfile_path }}
</source>

#####################
### filter log file 
<filter geth.app>
  @type grep
  <regexp>
    key log
    pattern ( * Persisted the clean trie cache | * Writing clean trie cache to disk)
  </regexp>
</filter>

#####################
### copy to file
<match **>
  @type copy
  <store>
    @type file
    path {{ output_log_file }}
    <buffer>
      @type file
      timekey 5m
      timekey_use_utc true
      timekey_wait 3m
    </buffer>
  </store>
</match>

Task 2
Please create a log rotate script that rotates every 1 hour and has a history of 5 hours

Create file /etc/logrotate.d/application

/var/log/application.log {
  hourly
  notifempty
  missingok
  rotate 5
}
