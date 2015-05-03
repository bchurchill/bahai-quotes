# bahai-quotes
A selection of Bahá'í quotes that can be integrated into any kind of software project.  The intent is to provide downloadable quotes in a small variety of formats (text, json, yaml, xml, etc.) along with some scripts for doing sanity checks and conversions.

## Current State

***The initial bootstraping of this is work-in-progress.***  Right now I have a collection of quotes for use by the UNIX fortune program.  By August 2015 I hope to have a minimal framework that others can expand on if they have any desire.  If you're reading this after August 2015, I haven't met my goal and you should consider this project defunct.

## Purpose

The purpose of this mini-project is to gather Bahá'í quotes for any development project which whishes to use them.  The major goals are:

* **To provide the quotes!**  The most basic purpose is to aggregate quotes to be easily consumed by software.
* **Avoid duplicating effort**.  Our time is limitted, so let's work together!
* **Usability**.  It should be easy for anyone to use these in their software project, small or large.
* **Authenticity**.  We want to be sure the quotes match exactly the Bahá'í writings, down to the punctuation.  The official source is http://www.bahai.org/library/.

## Design

Some principles of this project are:

* **Low developer barrier-to-entry**.  It should be easy for *anyone* to add quotes to the project, for example.
* **Minimal Dependencies**.  For now, the only language is Ruby.
* **Incremental growth**.  This project is very small at the moment.  It will grow only as there is need to do so.
* **Common quote format**.  To reduce redundancy, all the quotes in the "database" should be in the same format.

## Codebase

* The main quotes "database" is /source.json.  *This is the file to update!!*
* Quotes in different formats (yaml, xml, etc.) will also go in /quotes, and these will be generated automaticaly.
* Each library gets its own folder in /lib.  Each library should have its own README.md file in its folder with all the details on how to use it.
* Anything common to all the libraries will go in /shared.

There's a script, /shared/generate.py, which takes the shared.json file and translates it into the several available formats.  It also does sanity checking and sorting on the quotes.json file.  It should always be run as a post-commit hook when committing so that the best-available quotes files are in the repository at all times.

## Ideas for the future

* Automatically slurp the quotes from the official website?
* Create a web-based API to serve these quotes to other applications?
* (Your idea here)
