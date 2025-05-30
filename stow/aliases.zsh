#!/bin/zsh

alias o="xdg-open"

mrl() {
    mongorestore --host localhost --drop --gzip --archive="$HOME/Projects/Deskpilot/database/$1" --nsFrom="$2" --nsTo="$3"
}

mdr() {
    mongodump --uri="mongodb+srv://daniel:$MONGODB_PASSWORD@cluster0.dbdrlww.mongodb.net/?retryWrites=true&w=majority" --gzip  --db $1 --archive="$HOME/Projects/Deskpilot/database/$2"
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

