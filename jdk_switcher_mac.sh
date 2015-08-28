#!/usr/bin/env sh
# Just a simple alternative to
# https://github.com/michaelklishin/jdk_switcher/blob/master/jdk_switcher.sh
# for mac users

{ # this ensures the entire script is downloaded #


    if [ "$(uname)" = "Darwin" ]; then
        echo "=> JDK SWITCHER"
    else
        echo "You are not running Darwing, bye" >&2
    fi

    warn_jdk_not_known () {
        echo "Sorry, but JDK '$1' is not known." >&2
    }

    java_use () {
        export JAVA_HOME="$(/usr/libexec/java_home -v $1)"
        CLEANPATH="$(echo $PATH | awk -v RS=: -v ORS=: '/Library\/Java\/JavaVirtualMachines/ {next} {print}'| sed 's/:$//')"
        export PATH="$JAVA_HOME/bin:$CLEANPATH"
        echo "Switched to JDK $1 , JAVA_HOME will be set to $JAVA_HOME"
        echo "PATH is:
$PATH"
        java -version
    }

    switch_jdk()
    {
        typeset JDK
        JDK="${1:-default}"

        case "$JDK" in
            jdk6|1.6.0|1.6|6.0|6)
                java_use 1.6
                ;;
            jdk7|1.7.0|1.7|7.0|7)
                java_use 1.7
                ;;
            jdk8|1.8.0|1.8|8.0|8)
                java_use 1.8
                ;;
            default)
                java_use 1.7
                ;;
            *)
                warn_jdk_not_known "$JDK" >&2
                ;;
        esac
    }

    print_java_home_for()
    {
        echo "$(/usr/libexec/java_home -v $1)"
    }

    print_java_home()
    {
        typeset JDK
        JDK="${1:-current}"

        case "$JDK" in
            jdk6|1.6.0|1.6|6.0|6)
                print_java_home_for 1.6
                ;;
            jdk7|1.7.0|1.7|7.0|7)
                print_java_home_for 1.7
                ;;
            jdk8|1.8.0|1.8|8.0|8)
                print_java_home_for 1.8
                ;;
            current)
                echo "$JAVA_HOME"
                ;;
            *)
                warn_jdk_not_known "$JDK" >&2
                ;;
        esac
    }

    jdk_switcher()
    {
        typeset COMMAND JDK
        COMMAND="$1"
        JDK="$2"

        case "$COMMAND" in
            use)
                switch_jdk "$JDK"
                ;;
            home)
                print_java_home "$JDK"
                ;;
            *)
                echo "Usage: $FUNCNAME {use|home} [ JDK version ]" >&2
                ;;
        esac
    }

} # this ensures the entire script is downloaded #
