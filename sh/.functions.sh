function cgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) -print0 | xargs -0 grep --color -n "$@"
}

# simplified version of ps; output in the form
# <pid> <procname>
local adb_version=$(adb version 2>> /dev/null)
if [ -n "${adb_version}" ] ; then
    function qpid() {
        local prepend=''
        local append=''
        if [ "$1" = "--exact" ]; then
            prepend=' '
            append='$'
            shift
        elif [ "$1" = "--help" -o "$1" = "-h" ]; then
            echo "usage: qpid [[--exact] <process name|pid>"
            return 255
        fi

        local EXE="$1"
        if [ "$EXE" ] ; then
            qpid | \grep "$prepend$EXE$append"
        else
            adb shell ps \
                | tr -d '\r' \
                | sed -e 1d -e 's/^[^ ]* *\([0-9]*\).* \([^ ]*\)$/\1 \2/'
        fi
    }

    function pid()
    {
        local prepend=''
        local append=''
        if [ "$1" = "--exact" ]; then
            prepend=' '
            append='$'
            shift
        fi
        local EXE="$1"
        if [ "$EXE" ] ; then
            local PID=`adb shell ps \
                | tr -d '\r' \
                | \grep "$prepend$EXE$append" \
                | sed -e 's/^[^ ]* *\([0-9]*\).*$/\1/'`
            echo "$PID"
        else
            echo "usage: pid [--exact] <process name>"
            return 255
        fi
    }

    # Maybe it is a bug that `xxd -version` prints its version to stderr
    # So, we just need to care about executing `xxd -version` OK or not
    xxd -verison 2>&1 /dev/null && function is64bit(){
        local PID="$1"
        if [ "$PID" ] ; then
            if [[ "$(adb shell cat /proc/$PID/exe | xxd -l 1 -s 4 -ps)" -eq "02" ]] ; then
                echo "64"
            else
                echo ""
            fi
        else
            echo ""
        fi
    }
fi

case `uname -s` in
    Darwin)
        function sgrep()
        {
            find -E . -name .repo -prune -o -name .git -prune -o  -type f -iregex '.*\.(c|h|cc|cpp|S|java|xml|sh|mk|aidl)' -print0 | xargs -0 grep --color -n "$@"
        }

        ;;
    *)
        function sgrep()
        {
            find . -name .repo -prune -o -name .git -prune -o  -type f -iregex '.*\.\(c\|h\|cc\|cpp\|S\|java\|xml\|sh\|mk\|aidl\)' -print0 | xargs -0 grep --color -n "$@"
        }
        ;;
esac

function ggrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.gradle" -print0 | xargs -0 grep --color -n "$@"
}

function jgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.java" -print0 | xargs -0 grep --color -n "$@"
}

function cgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) -print0 | xargs -0 grep --color -n "$@"
}

function resgrep()
{
    for dir in `find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -name res -type d`; do find $dir -type f -name '*\.xml' -print0 | xargs -0 grep --color -n "$@"; done;
}

function mangrep()
{
    find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -type f -name 'AndroidManifest.xml' -print0 | xargs -0 grep --color -n "$@"
}

function sepgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -name sepolicy -type d -print0 | xargs -0 grep --color -n -r --exclude-dir=\.git "$@"
}

function rcgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.rc*" -print0 | xargs -0 grep --color -n "$@"
}

case `uname -s` in
    Darwin)
        function mgrep()
        {
            find -E . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -type f -iregex '.*/(Makefile|Makefile\..*|.*\.make|.*\.mak|.*\.mk)' -print0 | xargs -0 grep --color -n "$@"
        }

        function treegrep()
        {
            find -E . -name .repo -prune -o -name .git -prune -o -type f -iregex '.*\.(c|h|cpp|S|java|xml)' -print0 | xargs -0 grep --color -n -i "$@"
        }

        ;;
    *)
        function mgrep()
        {
            find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -regextype posix-egrep -iregex '(.*\/Makefile|.*\/Makefile\..*|.*\.make|.*\.mak|.*\.mk)' -type f -print0 | xargs -0 grep --color -n "$@"
        }

        function treegrep()
        {
            find . -name .repo -prune -o -name .git -prune -o -regextype posix-egrep -iregex '.*\.(c|h|cpp|S|java|xml)' -type f -print0 | xargs -0 grep --color -n -i "$@"
        }

        ;;
esac
