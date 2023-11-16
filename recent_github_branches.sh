function gbre() {
    local count=${1:-10}
    local email=${2:-"ohNoMyEmail@gmail.com"}
    
    for branch in $(git for-each-ref --sort=-committerdate refs/heads --format="%(refname:short)"); do
        if git log -1 --author="$email" $branch > /dev/null; then
            echo $branch
        fi
    done | head -n $count
}

