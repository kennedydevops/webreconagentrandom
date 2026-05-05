#!/bin/bash

domain=$1

used_agents(){
user_agents=(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/134.0.0.0"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 14.5; rv:126.0) Gecko/20100101 Firefox/126.0"
    "Mozilla/5.0 (Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36"
    "Mozilla/5.0 (Linux; Android 10; SM-G996U Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15"
)

get_random_user_agent() {
    local count=${#user_agents[@]}
    local index=$((RANDOM % count))
    echo "${user_agents[$index]}"
}

user_agent=$(get_random_user_agent)
}

if [ -z $domain ]; then
    echo "$0 <domain>"
else
    for word in $(cat words.txt); do
	sleep 2
	used_agents
    	response=$(curl -H "User-Agent:$user_agent" -s -o /dev/null -w "%{http_code}" https://$word.$domain/)
    	echo "$user_agent + $word.$domain" = $response
    done
fi
