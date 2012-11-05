require 'lib/parse-cron/cron_parser'

test = "* * * * * /usr/local/bin/sync_content.sh >> /var/log/rsync.log"

parser = CronParser.new(test)

parser.next()
