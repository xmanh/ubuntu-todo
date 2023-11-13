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
    ip addr | grep noprefixroute | grep -v inet6
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

k-namespace() {
    k config set-context --current --namespace=$1
}

k-bash() {
    k exec -it $1 -- sh -c "(bash || sh)"
}

k-scale() {
    k scale --replicas=$2 deployment $1
}

k-env() {
    k exec -it $1 -- env | egrep -v "(TCP|tcp|HTTP|SERVICE_HOST|SERVICE_PORT)"
}

k-restart() {
    k rollout restart deployment/$1
}

k-logs() {
    if [[ -z "$2" ]]; then
        k logs -f deployment/$1 | pino-pretty
    else
        k logs -f deployment/$1 | grep -v $2 | pino-pretty
    fi
}

k-logs-chat() {
    k logs -f deployment/$1 ${@:2} | grep -v '"url":"/chat"' | pino-pretty
}

k-image() {
    k get deploy -o wide | grep $1 | awk '{print $7}'
}

k-port() {
    k port-forward --address='0.0.0.0' $@
}

helm-debug() {
    helm template --debug \
        --output-dir bin/debug \
        -f bin/values-staging.yaml \
        deploy/$1
}
