
# edict2-kindle

The scripts I used to build the edict2 japanese-english dictionary for the Kindle (2012 Paperwhite).

The instructions here are for Mac (SnoLeo). Shouldn't be too different for a GNU/Linux system.

Latest dictionary build: http://cipangu.s3.amazonaws.com/edict2.mobi


## links

* http://www.csse.monash.edu.au/~jwb/edict_doc.html
* http://www.csse.monash.edu.au/~jwb/
* http://www.mobipocket.com/dev/article.asp?basefolder=prcgen&file=indexing.htm
* http://www.perrygarvin.com/blog/2012/01/16/how-to-make-an-amazon-kindle-book-using-html-and-css/
* http://1manfactory.com/create-your-own-kindle-dictionary-for-every-language-for-free/
* http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
* http://en.wikipedia.org/wiki/Network_Kanji_Filter

* http://cipangu.s3.amazonaws.com/edict2.mobi


## building

Make sure you have the kindlegen command line tool available (I placed it in the edict2-kindle directory).

run ```. make.sh```

The last step of the automation (copy to the kindle) is commented out.


## using

* Copy the edict2.mobi file to the documents/ directory of your Kindle
* Set it as primary dictionary for Japanese in your Kindle's settings


## notes

The edict2.txt file was generated with ```nkf -J -w edict2 > edict2.txt```


## license

Edict2: Copyright (C) 2010 The Electronic Dictionary Research and Development Group.

Those scripts are released under the MIT license, (c) 2012 John Mettraux


## credits

* Jim Breen and all the edict2 contributors
* the authors and contributors of NKF
* the mobipocket/OPF contributors / communities

