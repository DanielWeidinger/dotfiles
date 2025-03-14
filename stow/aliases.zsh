#!/bin/zsh

# alias mrt="echo test"

mrl() {
    mongorestore --host localhost --drop --gzip --archive="$HOME/Projects/Deskpilot/database/$1" --nsFrom="$2" --nsTo="$3"
}

mdr() {
    mongodump --uri="mongodb+srv://daniel:$MONGODB_PASSWORD@cluster0.dbdrlww.mongodb.net/?retryWrites=true&w=majority" --gzip  --db $1 --archive="$HOME/Projects/Deskpilot/database/$2"
}

qp() {
    timestamp=$(date +%s)
    file_path="$HOME/tmp/scripts/$timestamp.py"
    cp "$HOME/.local/share/templates/basic.py" "$file_path"
    eval "$(conda shell.bash hook)"
    conda activate scripts
    nvim $file_path
}

