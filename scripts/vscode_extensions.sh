vscode_backup() {
    code --list-extensions > $1 && echo "Extensions saved:" && cat $1
}

vscode_restore() {
    cat $1 | while read extension || [[ -n $extension ]];
    do
    code --install-extension $extension --force
    done
}