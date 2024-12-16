---
tags: []
date: "09-27-2024"
tag: linux file editing basic text editor vim vi nvim emacs nano
---

## Introduction

In most Linux distributions, vi (short for “visual”) is pre-installed and is the standard editor in the shell environment. vi is an interactive text editor that shows the file content on the screen while being edited, allowing modifications anywhere in the document. Unlike visual editors from graphical desktops, vi is a shell application with keyboard shortcuts to every editing task.

An alternative to vi, called vim (vi improved), is sometimes used as a modern replacement for vi and offers enhancements like syntax highlighting, multi-level undo/redo, and multi-document editing. Despite its resourcefulness, vim is fully backward compatible with vi.
Starting vi

To start vi, provide it a path to a file as a parameter. To jump directly to a specific line, its number should be preceded by a plus sign (e.g., vi +9 /etc/fstab to open /etc/fstab and place the cursor at the 9th line). Without a number, the plus sign by itself places the cursor at the last line.
Modes in vi

vi operates in different execution modes where the program's behavior changes:

    Insert Mode: Text appears as it is typed.
    Normal Mode: The default mode for command input.
    Colon Commands: Commands starting with : for various functions.

## Insert Mode

Insert mode is straightforward; text appears on the screen as it is typed on the keyboard. This mode is what most users expect from a text editor. To enter insert mode, you must execute an insertion command in normal mode. Pressing Esc finishes the insert mode and returns to normal mode.

Common insertion commands:

    i: Insert before the cursor.
    I: Insert at the beginning of the line.
    a: Append after the cursor.
    A: Append at the end of the line.
    o: Open a new line below the current line.
    O: Open a new line above the current line.

## Normal Mode

Normal mode (command mode) is vi's default starting mode. In this mode, keys are associated with commands for navigation and text manipulation. Here are some common commands:
Navigation

    h, j, k, l: Move left, down, up, right.
    0, $: Go to the beginning and end of the line, respectively.
    1G, G: Go to the beginning and end of the document, respectively.
    (, ): Move to the beginning and end of the sentence.
    {, }: Move to the beginning and end of the paragraph.

## Editing Commands

    d: Delete.
    dd: Delete the current line.
    p: Paste after the cursor.
    P: Paste before the cursor.
    y: Yank (copy).
    yy: Yank the current line.
    u: Undo.
    Ctrl + r: Redo.

## Colon Commands

Colon commands begin with a : and are used for executing more complex commands:

    :w: Save the file.
    :q: Quit vi.
    :wq: Save and quit.
    :q!: Quit without saving.
    :x: Save and quit (like :wq).

## Alternative Editors

While vi is the standard editor on many systems, there are alternatives:

    Emacs: An extensible and customizable text editor.
    nano: A simple, easy-to-use text editor.
    vim: An improved version of vi.

### Guided Exercises

    Navigate a Document:
        Open a file using vi and practice moving around using h, j, k, and l.
    Edit Text:
        Insert text using i, a, o, and practice deleting text with d.
    Use Colon Commands:
        Save a file with :w, quit with :q, and try :wq and :q!.

### Explorational Exercises

    Configuration:
        Configure the standard editor by setting the EDITOR environment variable:

        export EDITOR=vim

    Multi-line Editing:
        Use visual mode (v for character, V for line) to select multiple lines and edit.

#### Summary

    Navigate and Edit Files: Learn the vi basics of navigating and editing text.
    Modes in vi: Understand the difference between insert mode, normal mode, and colon commands.
    Alternative Editors: Be aware of other editors like vim, nano, and Emacs.

