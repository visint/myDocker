#!/bin/bash

parse_yaml() {
    local prefix=$2
    local s
    local w
    local fs
    s='[[:space:]]*'
    w='[a-zA-Z0-9_]*'
    fs="$(echo @|tr @ '\034')"
    sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s[:-]$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
    awk -F"$fs" '{
    indent = length($1)/2;
    vname[indent] = $2;
    for (i in vname) {if (i > indent) {delete vname[i]}}
        if (length($3) > 0) {
            vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
            printf("%s%s%s=(\"%s\")\n", "'"$prefix"'",vn, $2, $3);
        }
    }' | sed 's/_=/+=/g'
}

join() {
    local IFS="$1"
    shift
    echo "$*"
}

if [ "${DEBUG}" = true ]; then
    echo "PHP Code Sniffer"
    echo $(pwd)
fi

if [ ! -f ${PHPCS_CONFIG_FILE} ]; then
    if [ "${DEBUG}" = true ]; then
        echo "Missing phpcs config file, using default one"
    fi
    eval $(parse_yaml /root/.phpcs.yml "config_")
else
    eval $(parse_yaml ${PHPCS_CONFIG_FILE} "config_")
fi

PARAMS=""

if [ "${DEBUG}" = true ]; then
    printenv
    PARAMS="$PARAMS -vvv"
fi

# no-warnings: false
if [ ! -z "${config_no-warnings}" ] && [ "${config_no-warnings}" = true ]; then
	  PARAMS="$PARAMS -n"
fi

# errors: true
if [ ! -z "${config_errors}" ] && [ "${config_errors}" = true ]; then
	  PARAMS="$PARAMS -w"
fi

# no-recursion: false
if [ ! -z "${config_no-recoursion}" ] && [ "${config_no-recoursion}" = true ]; then
	  PARAMS="$PARAMS -l"
fi

# sniff: false
if [ ! -z "${config_sniff}" ] && [ "${config_sniff}" = true ]; then
	  PARAMS="$PARAMS -s"
fi

# interactive: false
if [ ! -z "${config_interactive}" ] && [ "${config_interactive}" = true ]; then
	  PARAMS="$PARAMS -a"
fi

# explain: false
if [ ! -z "${config_explain}" ] && [ "${config_explain}" = true ]; then
	  PARAMS="$PARAMS -e"
fi

# progress: false
if [ ! -z "${config_progress}" ] && [ "${config_progress}" = true ]; then
	  PARAMS="$PARAMS -p"
fi

# colors: true
if [ ! -z "${config_colors}" ] && [ "${config_colors}" = true ]; then
	  PARAMS="$PARAMS --colors"
fi

# standard
if [ ! -z "${config_standard}" ]; then
  	PARAMS="$PARAMS --standard=${config_standard}"
fi

# ignore
if [ ! -z "${config_ignore}" ]; then
    PARAMS="$PARAMS --ignore=$(join , ${config_ignore[@]})"
fi

# extensions
if [ ! -z "${config_extensions}" ]; then
    PARAMS="$PARAMS --extensions=$(join , ${config_extensions[@]})"
fi

# files
for i in "${!config_files[@]}"; do
  	if [ ! -d "./${config_files[$i]}" ]; then
    		if [ "${DEBUG}" = true ]; then
            echo "Missing directory: ${config_files[$i]}"
        fi
    		unset config_files[$i]
    else
        PARAMS="$PARAMS ${config_files[$i]}"
  	fi
done

if [ "${DEBUG}" = true ]; then
  $HOME/.composer/vendor/bin/phpcs $PARAMS
fi

$HOME/.composer/vendor/bin/phpcs $PARAMS
