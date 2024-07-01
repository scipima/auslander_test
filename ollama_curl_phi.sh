#!/usr/bin/env bash

curl http://localhost:11434/api/generate -d '{
    "model": "llava",
    "prompt": "What's in this image? /home/scipima/Documents/github/auslander_test/data_in/png/FS-1-2-Auslä-1987_45.png",
    "stream": false
}' | jq .