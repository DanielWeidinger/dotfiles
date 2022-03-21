#!/bin/bash

FILE="${1}"
DIR="$(dirname "${FILE}")"
feh "${DIR}" --start-at "${FILE}" &
