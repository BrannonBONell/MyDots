---
tags:
  - linux
  - lpic
  - regular-expressions
  - search
  - text
  - files
date: "09-27-2024"
---

# Search text Files using regular expressions

## Introduction

Regular expressions (often abbreviated as regex or REs) consist of sequences of characters that define search patterns. These are used widely in data processing, scripting, and text file manipulation tasks. Understanding and using regular expressions expands the ability to:

    Write parsing rules for HTTP servers, especially nginx.
    Convert text-based datasets to different formats via scripting.
    Search through journal entries or documents for specific occurrences.
    Filter content from markup documents, retaining semantic content.

## Basic Concepts
Atoms

The simplest regular expression contains at least one atom:

    Literal atoms: Characters that match themselves (e.g., b, c).
    Metacharacters:
        . (dot): Matches any single character.
        ^ (caret): Matches the beginning of a line.
        $ (dollar sign): Matches the end of a line.

Example:

    bc can be found in abcd, but not in a1cd.
    .c can be found in both abcd and a1cd because . matches any character.

## Advanced Components
Bracket Expressions

Bracket expressions (or character classes) match any single character within the brackets.

    [abc]: Matches any one of a, b, or c.

## Quantifiers

Quantifiers specify the number of instances of an atom that must be present for a match:

    *: Matches zero or more instances.
    +: Matches one or more instances.
    ?: Matches zero or one instance.
    {n}: Matches exactly n instances.
    {n,m}: Matches between n and m instances.

Examples:

    a*: Matches ``, a, aa, aaa, etc.
    a+: Matches a, aa, aaa, etc.
    a?: Matches a or `` (zero or one).
    a{2}: Matches aa.
    a{2,4}: Matches aa, aaa, or aaaa.

## Bounds

Use \b to assert a word boundary, \B asserts non-word boundaries.
Branches and Back References

    Branch (alternation) uses | to match one pattern or another.
    Back references use \1, \2, etc., to refer to previous matches within the same regex.

## Searching with Regular Expressions
Tools and Commands

    grep: Searches files for lines matching a given pattern.
        grep 'pattern' file
    egrep: Extended grep for extended regex syntax.
        egrep 'pattern' file
    fgrep: Fixed grep, searches for fixed strings.
        fgrep 'string' file
    sed: Stream editor for filtering and transforming text.
        sed 's/pattern/replacement/' file

Practical Examples
Example 1: Searching for an email address

Extended regex to match any email address:

egrep "\S+@\S+\.\S+" file

Example 2: Matching IPv4 addresses

Regex to match any IPv4 address:

egrep "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" file

Example 3: Using grep to filter comments

List contents of /etc/services, excluding comments:

grep -v '^#' /etc/services

Example 4: Searching for specific domains

List .org or .com domains in domains.txt:

egrep '\.(org|com)$' domains.txt

Guided Exercises

    Write a regex to match any email address:

egrep "\S+@\S+\.\S+" file

    Write a regex to match any IPv4 address:

egrep "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" file

    Use grep to list contents of /etc/services without comments:

grep -v '^#' /etc/services

    Use egrep to list .org or .com domains in domains.txt:

egrep '\.(org|com)$' domains.txt

Summary

    Regular expressions are powerful tools for text searching and manipulation.
    Basic regex components include literals, metacharacters, brackets, quantifiers, bounds, and branches.
    Tools such as grep, egrep, and sed utilize regex for various searching and editing tasks.


# Introduction

In this lesson, we will explore two essential tools for text processing in Linux: grep and sed. These tools are fundamental for searching within text files and for stream editing, making them invaluable for system administrators and developers.
The Pattern Finder: grep

grep is a command-line utility for searching plain text data sets for lines that match a regular expression. It stands for "Global Regular Expression Print".
Common grep Options

    -i : Ignore case distinctions
    -v : Invert the sense of matching, to select non-matching lines
    -c : Count the number of matching lines
    -l : List filenames containing matches
    -n : Prefix each line of output with the line number within its input file
    -E : Use extended regular expressions for interpretation (egrep is equivalent)

Basic Usage

Search for a pattern in a file:

$ grep "pattern" file

Search recursively in directories:

$ grep -r "pattern" directory/

Examples

    Search for a specific word in a file:

$ grep "word" filename.txt

Case insensitive search:

$ grep -i "word" filename.txt

Count the occurrences of a word:

$ grep -c "word" filename.txt

Display line numbers with matches:

    $ grep -n "word" filename.txt

The Stream Editor: sed

sed is a stream editor for filtering and transforming text. It is commonly used for search and replace operations on text streams.
Basic Syntax

$ sed [options] script [input-file]

Common sed Commands

    s : Substitute command
    d : Delete pattern space
    p : Print pattern space
    a : Append text after the current line
    i : Insert text before the current line

Basic Usage

    Substitute a string:

$ sed 's/old/new/' filename.txt

Substitute a string globally across the file:

$ sed 's/old/new/g' filename.txt

Delete lines matching a pattern:

$ sed '/pattern/d' filename.txt

Print specific lines:

    $ sed -n '5p' filename.txt

Examples

    Replace the first occurrence of "apple" with "orange" in each line:

$ sed 's/apple/orange/' filename.txt

Replace all occurrences of "apple" with "orange" in the entire file:

$ sed 's/apple/orange/g' filename.txt

Delete all lines containing "apple":

$ sed '/apple/d' filename.txt

Print the 10th line of a file:

    $ sed -n '10p' filename.txt

Combining grep and sed

Often, grep and sed are used together to perform more complex text processing tasks.
Example Workflow

    Find lines in a log file containing "error" and replace "404" with "Not Found" in those lines:

    $ grep "error" log.txt | sed 's/404/Not Found/'

Guided Exercises

    Use grep to search for the word 'error' in log.txt and display line numbers:

$ grep -n "error" log.txt

Use sed to replace 'apple' with 'banana' in fruits.txt:

$ sed 's/apple/banana/g' fruits.txt

Combine grep and sed to find lines with 'ERROR' in system.log and replace 'CRITICAL' with 'CRIT':

    $ grep "ERROR" system.log | sed 's/CRITICAL/CRIT/'

Summary

    grep: A powerful tool for searching text using patterns.
    sed: A stream editor for parsing and transforming text.
    Combining grep and sed: These tools can be combined for more complex text processing and manipulation tasks.

