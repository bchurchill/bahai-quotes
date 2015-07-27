# bahai-quotes
A selection of Bahá'í quotes that can be integrated into any kind of software project.  The intent is to provide downloadable quotes in a small variety of formats (text, json, yaml, xml, etc.) along with some scripts for doing sanity checks and conversions.

## Current State

We've got a bunch of quotes!  Adib has graciously facilitated scraping all of bahaiquotes.com, and Lights of Guidance is coming soon.

## Purpose

The purpose of this mini-project is to gather Bahá'í quotes for any development project which whishes to use them.  The major goals are:

* **To provide the quotes!**  The most basic purpose is to aggregate quotes to be easily consumed by software.
* **Avoid duplicating effort**.  Our time is limitted, so let's work together!
* **Simplicity and Usability**.  It should be easy for anyone to use these in their software project, small or large.
* **Authenticity**.  We want to be sure the quotes match exactly the Bahá'í writings, down to the punctuation.  The official source is http://www.bahai.org/library/.

## Design

Some principles of this project are:

* **Low developer barrier-to-entry**.  It should be easy for *anyone* to add quotes to the project, for example.
* **Minimal Dependencies**.  For now, the only language is Ruby.
* **Incremental growth**.  This project is very small at the moment.  It will grow only as there is need to do so.
* **Common quote format**.  To reduce redundancy, all the quotes in the "database" should be in the same format.

## Codebase

* The "database" of quotes are .json files in the /sources/ folder.  If you want to contribute, add a file here!
* Quotes in different formats (yaml, xml, etc.) will also go in /quotes, and these will be generated automaticaly.
* Libraries to manipulate the quotes or write them to different formats will go in /lib.

There's a script, /lib/generate.rb, which takes the JSON files in /sources and translates them into the available formats.  In the future it will also do sanity checking and sorting on the quotes.json file.  

## Ideas for the future

* Automatically slurp the quotes from the official website?
* Create a web-based API to serve these quotes to other applications?
* (Your idea here)
