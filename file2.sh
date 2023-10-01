#!/bin/bash

cp file1.sh  ~/




usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -s SCRIPT_PATH  Specify the path to the existing script"
    echo "  -i INTERVAL     Set the cron job INTERVAL in crontab format"
    echo "  -? or -h     Show this usage information"
    exit 1
}

while getopts ":i:h" opt; do
    case $opt in
      
        i)
            cron_interval="$OPTARG"
            ;;
      
        ?|h)
            echo "Invalid option: -$OPTARG"
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            usage
            ;;
    esac
done
 crontab -e
(crontab -l; echo "*/1 * * * * ~/file1.sh") | crontab -









