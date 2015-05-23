#!/bin/sh
# Just a simple alternative to
# https://github.com/michaelklishin/jdk_switcher/blob/master/jdk_switcher.sh
# for mac users

if [ "$(uname)" = "Darwin" ]; then
    echo "Darwin detected, installing JDK SWITCHER"
else
    echo "You are not running Darwing, bye" >&2
fi

switch_to_jdk6 () {
    export JAVA_HOME="$(/usr/libexec/java_home -v1.6)"
    echo "Switched to JDK6 , JAVA_HOME will be set to $JAVA_HOME"
}

switch_to_jdk7 () {
    export JAVA_HOME="$(/usr/libexec/java_home -v1.7)"
    echo "Switched to JDK7 , JAVA_HOME will be set to $JAVA_HOME"
}

switch_to_jdk8 () {
    export JAVA_HOME="$(/usr/libexec/java_home -v1.8)"
    echo "Switched to JDK8 , JAVA_HOME will be set to $JAVA_HOME"
}

warn_jdk_not_known () {
    echo "Sorry, but JDK '$1' is not known." >&2
}

switch_jdk()
{
    case "${1:-default}" in
        jdk6|1.6.0|1.6|6.0|6)
            switch_to_jdk6
            ;;
        jdk7|1.7.0|1.7|7.0|7)
            switch_to_jdk7
            ;;
        jdk8|1.8.0|1.8|8.0|8)
            switch_to_jdk8
            ;;
        default)
            switch_to_jdk7
            ;;
        *)
            warn_jdk_not_known "$1"
            false
            ;;
    esac
}
