#!/bin/bash
# https://stackoverflow.com/questions/14062895/bash-argument-case-for-args-in

START_DATE="$(date '+%Y-%m-%d')";
LAST_DATE="$(date '+%Y-%m-%d')";
while [[ $# -gt 0 ]] && [[ ."$1" = .--* ]] ;
do
    opt="$1";
    shift;              #expose next argument
    case "$opt" in
        "--" ) break 2;;
        "--first" )
           START_DATE="$1"; shift;;
        "--first="* )     # alternate format: --first=date
           START_DATE="${opt#*=}";;
        "--last" )
           LAST_DATE="$1"; shift;;
        "--last="* )
           LAST_DATE="${opt#*=}";;
        "--copy" )
           COPY=true;;
        "--remove" )
           REMOVE=true;;
        "--optional" )
           OPTIONAL="$optional_default";;     #set to some default value
        "--optional=*" )
           OPTIONAL="${opt#*=}";;             #take argument
        *) echo >&2 "Invalid option: $@"; exit 1;;
   esac
done

# another exemple

opt=$1
shift

case "$opt" in
        start)
            start
            ;;
         
        stop)
            stop
            ;;
         
        status)
            status anacron
            ;;
        restart)
            stop
            start
            ;;
        condrestart)
            if test "x`pidof anacron`" != x; then
                stop
                start
            fi
            ;;
         
        *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1
 
esac
