#!/bin/bash

mkdir html
ruby to_opf.rb < edict2.txt > html/edict2.html
zip edict2.epub edict2.opf html/edict2.html
./kindlegen edict2.epub

