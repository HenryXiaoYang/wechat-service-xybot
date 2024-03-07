#!/bin/bash

file_path="/inj-entrypoint.sh"
text_to_insert="start-xybot &"
line_number=21

sed -i "${line_number}i${text_to_insert}" "$file_path"
