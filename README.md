# which()
A bash function that overloads which. It looks for aliases/functions then programs (using native 'which')

# OS
Used / created for macOS bash but can be modified for other OS.

## Use
Use this and customize it with your variations.  I use it to search for commands, whether it be a command, a script or any other file.

I use it to get the following:
  1) get the path for a program for the command lines
  2) get the location of a specific script (using 'find')
  3) get the location of a speific file  ('find')

## Help menu
When you execute which() without parameters you will get the following:
![Help menu](https://github.com/al-jimenez/which/blob/master/which.png)

## Usage Examples:
   which which      - returns '/usr/bin/which'

   which which    - returns '/usr/bin/which'

   which dotfiles.sh - returns locations of dotfiles.sh (w/find)

   which chknet.sh  - returns locations of chknet.sh (w/find)
