#!/bin/zsh

alias o="xdg-open"
alias c="wl-copy"

mrl() {
    mongorestore --host localhost --drop --gzip --archive="$HOME/Projects/Deskpilot/database/$1" --nsFrom="$2" --nsTo="$3"
}

mdr() {
    mongodump --uri="mongodb+srv://daniel:$DO_DESKPILOT_DATABASE_PASSWORD@deskpilot-main-116ef2a6.mongo.ondigitalocean.com/?tls=true&authSource=admin&replicaSet=deskpilot-main" --gzip  --db $1 --archive="$HOME/Projects/Deskpilot/database/$2"
}

mdl() {
    mongodump --host localhost --db $1 --gzip --archive="$HOME/Projects/Deskpilot/database/$2"
}

qp() {
    timestamp=$(date +%s)
    base_path="$HOME/tmp/scripts"
    file_name="$timestamp.py"
    file_path="$base_path/$file_name"
    cp "$HOME/.local/share/templates/basic.py" "$file_path"
    eval "$(conda shell.bash hook)"
    conda activate scripts
    cd $base_path
    nvim $file_name
}

philo(){
    if [ "$1" = "hü" ]; then
        proj_type="Hausübung"
    elif [ "$1" = "se" ]; then
        proj_type="Seminararbeit"
    else
        echo "Error: Invalid argument"
        exit 1
    fi
    cp "$HOME/Philosophie/0_Templates/$proj_type" $2 -r
}

