#!/bin/bash
#####################################################
# Description   : Rubber Ducky Arming Wizard        #
# Author        : maverick193                       #
# Version       : v1.0                              #
# License       : OSL - Open Software Licence 3.0.  #
#####################################################

# Text colors
green="\033[32;40m"
blue="\033[36;40m"
red="\033[31;40m"
none="\033[0m"

#Script information
name="Rubber Ducky Arming Wizard"
author="maverick193"
version="v1.0"

# Other variables
COLUMNS=12
dep=true
rd=$(echo $PWD)
duckygit="https://github.com/kevthehermit/DuckToolkit.git"
jarurl="https://github.com/hak5darren/USB-Rubber-Ducky/blob/master/duckencoder.jar?raw=true"

# Display welcome message
welcome() {
    clear
    echo -e $blue"##########################################################";
    echo -e "#"$none"                                                        "$blue"#";
    echo -e "#"$none"  ___      _    _               ___          _          "$blue"#";
    echo -e "#"$none" | _ \_  _| |__| |__  ___ _ _  |   \ _  _ __| |___  _   "$blue"#";
    echo -e "#"$none" |   / || | '_ \ '_ \/ -_) '_| | |) | || / _| / / || |  "$blue"#";
    echo -e "#"$none" |_|_\\ _,_|_.__/_.__/\___|_|   |___/ \_,_\__|_\_\\ _, |  "$blue"#";
    echo -e "#"$none"    _             _             ___         _    |__/   "$blue"#";
    echo -e "#"$none"   /_\  _ _ _ __ (_)_ _  __ _  / __| __ _ _(_)_ __| |_  "$blue"#";
    echo -e "#"$none"  / _ \| '_| '  \| | ' \/ _\` | \__ \/ _| '_| | '_ \  _| "$blue"#";
    echo -e "#"$none" /_/ \_\_| |_|_|_|_|_||_\__, | |___/\__|_| |_| .__/\__| "$blue"#";
    echo -e "#"$none"                        |___/                |_|        "$blue"#";
    echo -e "#"$none"                                                        "$blue"#";
    echo -e $blue"##########################################################";
    echo -e "                                         "$author" - "$version$none;

    echo; echo; echo -e "Hello $blue$USER$none, welcome to $name $version"; echo
}

# OS detection
detectOS() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     os=Linux;;
        Darwin*)    os=Mac;;
        CYGWIN*)    os=Cygwin;;
        MINGW*)     os=MinGw;;
        *)          os="UNKNOWN:${unameOut}"
    esac
    echo ${os}
}

# Create a backup if a previous version exists
backup() {
    if [ -d "$rd/RD/" ]; then
        read -p "Backup the existing version ? (y/n) : " -n 1 -s backuprd
        case "$backuprd" in
           y | Y) if [ ! -d "$rd/backups/" ]; then mkdir backups; fi; echo -ne $blue"processing"$none; tar -czf backups/RD_$(date +%Y%m%d_%H%M%S).tar.gz RD/; echo -en "\b\b\b\b\b\b\b\b\b\b"; echo -e $green"OK        "$none ;;
        esac
    fi
}

welcome
sleep 1

# Check setup and dependencies
echo -n "Check setup and dependencies : "
if [[ $(which curl) == "" ]]; then echo; echo -e $red"Package curl not found, please install it"$none; dep=false; fi
if [[ $(which git) == "" ]]; then echo; echo -e $red"Package git not found, please install it"$none; dep=false; fi
if [[ $(which tar) == "" ]]; then echo; echo -e $red"Package tar not found, please install it"$none; dep=false; fi
if [[ "$dep" == false ]]; then echo; echo -e $red"Aborting !! please make sure all the dependencies are installed ..."$none; exit 1; fi

response=$(curl --write-out %{http_code} --silent --output /dev/null www.google.fr)
if [ "$response" != "200" ]; then echo; echo -e $red"Aborting !! check your internet connection ..."$none; exit 1; fi
sleep 0.5 && echo -e $green"OK"$none

# Check and ask for a backup
backup

# Cleanup any existing version
echo -n "Clean up previous versions : "
rm -rf RD/
rm -f .info.txt && rm -f .version.txt
if [ -f ".extras.sh" ]; then bash .extras.sh; fi
rm -f rd-arming.sh
sleep 0.5 && echo -e $green"OK"$none

# Create folders & install encoders
echo -n "Create folder structure and install encoders : "
echo -ne $blue"processing"$none
mkdir -p RD/payloads/Linux
mkdir -p RD/payloads/Windows
mkdir -p RD/payloads/OSX
mkdir -p RD/tools/encoder/java
git clone -q $duckygit RD/tools/encoder/python
curl -s -o RD/tools/encoder/java/duckencoder.jar $jarurl
echo -en "\b\b\b\b\b\b\b\b\b\b"
echo -e $green"OK        "$none

# Install main script
echo -n "Create main script rd-arming.sh : "
cat > rd-arming.sh <<\EOF
#!/bin/bash
#####################################################
# Description   : Rubber Ducky Arming Wizard        #
# Author        : maverick193                       #
# Version       : v1.0                              #
# License       : OSL - Open Software Licence 3.0.  #
#####################################################

# Text colors
green="\033[32;40m"
blue="\033[36;40m"
red="\033[31;40m"
none="\033[0m"

#Script information
name="Rubber Ducky Arming Script"
author="Maverick193"
version="v1.0"

# Other variables
COLUMNS=12
KEYBOARD_LAYOUT="fr"

# Display welcome message
welcome() {
    clear
    echo -e $blue"##########################################################";
    echo -e "#"$none"                                                        "$blue"#";
    echo -e "#"$none"  ___      _    _               ___          _          "$blue"#";
    echo -e "#"$none" | _ \_  _| |__| |__  ___ _ _  |   \ _  _ __| |___  _   "$blue"#";
    echo -e "#"$none" |   / || | '_ \ '_ \/ -_) '_| | |) | || / _| / / || |  "$blue"#";
    echo -e "#"$none" |_|_\\ _,_|_.__/_.__/\___|_|   |___/ \_,_\__|_\_\\ _, |  "$blue"#";
    echo -e "#"$none"    _             _             ___         _    |__/   "$blue"#";
    echo -e "#"$none"   /_\  _ _ _ __ (_)_ _  __ _  / __| __ _ _(_)_ __| |_  "$blue"#";
    echo -e "#"$none"  / _ \| '_| '  \| | ' \/ _\` | \__ \/ _| '_| | '_ \  _| "$blue"#";
    echo -e "#"$none" /_/ \_\_| |_|_|_|_|_||_\__, | |___/\__|_| |_| .__/\__| "$blue"#";
    echo -e "#"$none"                        |___/                |_|        "$blue"#";
    echo -e "#"$none"                                                        "$blue"#";
    echo -e $blue"##########################################################";
    echo -e "                                         "$author" - "$version$none;

    echo; echo; echo -e "Hello $blue$USER$none, welcome to $name $version"; echo
}

# Read current payload information
current_payload() {
    echo
    if [ -f .info.txt ]; then
	info=$(cat .info.txt)
        echo -e $blue"$info"$none
    else
        echo -e $red"Cannot recognize the current payload !!"$none
    fi
    echo; sleep 0.5

}

# Arm a payload menu
arm_payload() {
    error=$(check_encoders)
    if [ -n "$error" ]; then
	    echo -e $red$error$none; echo
    else
        os_selected=0
        os="linux"
        while (( !os_selected )); do
            echo -e $green"Select your target OS :"$none
            osystems=("Linux" "Windows" "OSX")
            select osystem in "${osystems[@]}"; do
                case $osystem in
                    "Linux") os="Linux"; os_selected=1; break;;
                    "Windows") os="Windows"; os_selected=1; break;;
                    "OSX") os="OSX"; os_selected=1; break;;
                    *) echo -e $red"Invalid option."$none; continue;;
                esac
            done
        done
        OIFS=$IFS; IFS=$'\n'; payloads=($(ls "RD/payloads/$os")); IFS=$OIFS;
    	payloads+=("Exit")
    	quit_arming=0

    	while (( !quit_arming )); do
    	    echo; echo -e $green"Select a payload to arm :"$none
            select payload in "${payloads[@]}"; do
                case $payload in
                    "Exit") quit_arming=1; echo -e $green"Bye !!"$none; break;;
                    *) if [ -z "$payload" ]; then echo -e $red"Invalid payload !!"$none; else quit_arming=1; arm $payload $os; fi; break;;
                esac
            done
        done
        echo
    fi
}

# Arm the selected payload
arm() {
    pl=$1
    os=$2

    if [ -f RD/payloads/$os/$pl/payload.txt ]; then
        if [ -f RD/payloads/$os/$pl/info.txt ]; then echo "$(cat RD/payloads/$os/$pl/info.txt )" > .info.txt; else echo "No information" > .info.txt; fi
        if [ -f .extras.sh ]; then bash .extras.sh; fi
        if [[ $(which python) == "" ]] ; then encoder="java"; else encoder="python"; fi

        ${encoder}_encoder $pl $os
        if [ -d RD/payloads/$os/$pl/extras ]; then
            echo; echo -e $blue"#### Copying extra files"$none
            cp -r -v RD/payloads/$os/$pl/extras/* .
            echo '#!/bin/bash'> .extras.sh
            for f in $(ls "RD/payloads/$os/$pl/extras/"); do
                echo "rm -rf $f" >> .extras.sh
            done
            echo 'rm -- "$0"' >> .extras.sh
        fi
        echo; echo -e $blue"#### $pl Successfully Armed"$none
    else
        echo -e $red"Unable to find RD/payloads/$os/$pl/payload.txt file"
    fi
}

# Check encoders and dependencies
check_encoders() {
    error=""
    if [[ $(which python) == "" ]] ; then
        if [[ $(which java) == "" ]] ; then
            error="In order to arm the payloads you need to install python or java on your machine"
        else
            if [ ! -f RD/tools/encoder/java/duckencoder.jar ]; then
                error="Java found but unable to find the encoder : \"duckencoder.jar\""
	        fi
        fi
    else
        if [ ! -f RD/tools/encoder/python/ducktools.py ]; then
            error="Python found but unable to find the encoder : \"ducktools.py\""
        fi
    fi

    echo $error
}

# Encode the payload with the python encoder
python_encoder() {
    pl=$1
    os=$2
    echo; echo -e $blue"#### Arming the USB RubberDucky with $none$green$pl$none$blue using "$none$green"PYTHON"$none$blue" encoder"$none; sleep 0.5
    python RD/tools/encoder/python/ducktools.py -e -l $KEYBOARD_LAYOUT RD/payloads/$os/$pl/payload.txt inject.bin
    echo
}

# Encode the payload with duckencoder.jar
java_encoder() {
    pl=$1
    os=$2
    echo; echo -e $blue"#### Arming the USB RubberDucky with $none$green$pl$none$blue using "$none"JAVA"$blue" encoder"$none; sleep 0.5
    java -jar RD/tools/encoder/java/duckencoder.jar -i RD/payloads/$os/$pl/payload.txt -o inject.bin -l $KEYBOARD_LAYOUT
    echo
}

# Main function
run() {
    welcome
    quit=0

    while (( !quit )); do
        echo -e $green"Select an option :"$none
        options=("Display the current payload" "Arm a new payload" "Exit")
        select option in "${options[@]}"; do
            case $option in
                "Display the current payload") current_payload; break;;
                "Arm a new payload") arm_payload; break;;
                "Exit") quit=1; echo -e $green"Bye !!"$none; break;;
                *) echo -e $red"Invalid option."$none; continue;;
            esac
        done
    done
}

# todo : update RDAS
update() {
    echo "Up-to-date"
}

# Display help
usage(){
	printf "Usage : bash $0 $green--[option]$none\n"
	printf "\t$green--run$none                     : Init & create the Rubber Ducky arming structure and script\n"
	printf "\t$green--update$none                  : Update the Rubber Ducky arming\n"
	printf "\t$green--help$none or $green-h$none              : display this help\n"
}

if [ $# -eq 0 ]; then
    run
else
    case "$1" in
        --run) run;;
        --update) update;;
        --help|-h) usage;;
        *) echo -e $red"Unknown command : "$none$1; usage; exit 1;;
    esac
fi
EOF
echo -e $green"OK"$none

# Create version.txt file
echo $version > .version.txt

# Success !!
echo
echo -e $blue"                            __"
echo "                        ___( o)>"
echo "                        \\ <_. )"
echo -e "Done !! Happy Duckying   \`---"$none