
# function
usage() {
    echo "Usage: $0 [-h] [-n name] [-a age] [-v]"
    echo "Options:"
    echo "  -h        Show help"
    echo "  -n name   Specify a name"
    echo "  -a age    Specify an age"
    echo "  -v        Enable verbose mode"
}

# default values
VERBOSE=0
NAME=""
AGE=""

# parsing command-line options using getopts
while getopts "hn:a:v" opt; do
    case $opt in
        h)
            usage
            exit 0
            ;;
        n)
            NAME=$OPTARG
            ;;
        a)
            AGE=$OPTARG
            ;;
        v)
            VERBOSE=1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
    esac
done

###

usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${s}" ] || [ -z "${p}" ]; then
    usage
fi

echo "s = ${s}"
echo "p = ${p}"
