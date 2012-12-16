#!/bin/bash

mkdir html
ruby to_opf.rb < edict2.txt > html/edict2.html
  #
  # turning the edict2 entries into OPB/mobi entries

zip edict2.epub edict2.opf html/edict2.html
  #
  # package that into a epub file

./kindlegen edict2.epub
  #
  # the "kindlegen" tool is available via
  # http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
  #
  # turning the epub into a mobi/prc file grokkable by the Kindle

#cp edict2.mobi /Volumes/Kindle/documents
  #
  # last step of the automation

