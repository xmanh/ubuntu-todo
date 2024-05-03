alias ll='ls -lah --group-directories-first'
alias env-highlight='GREP_COLOR="34" egrep "^([A-Z\_]+)"'

gmd() {
    git branch --merged | egrep -v "(^\*|master|main|develop|production)" | xargs git branch -d
}

git-graph() {
    git log --all --decorate --oneline --graph
}

open-port() {
    sudo netstat -tulpn | grep LISTEN $@
}

ip-addr() {
    hostname -I
}

video2mp4() {
    ffmpeg -y -i "${1}" -vf "fps=${2:-12},pad=ceil(iw/2)*2:ceil(ih/2)*2" "${1}.mp4"
}

cut2mp4() {
    ffmpeg -i "${1}" ${@:2} -c copy "${1}.copy.mp4"
}

s3() {
    aws --endpoint-url http://localhost:4566 --profile local s3 $@
}
