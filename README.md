# which()
A bash function that overloads which. It looks for aliases/functions then programs (using native 'which')

# OS
Used / created for macOS bash but can be modified for other OS.

## Use
Use this and customize it with your variations.  I use it to search for commands, whether it be a command, a script or any other file.

I use it to get the following:
  1) get the location for a program for the command lines
  2) get the definition of an alias or function
  3) get the location of a specific script (using 'find')

## Help menu
When you execute which() without parameters you will get the following:
![Help menu](https://github.com/al-jimenez/which/blob/master/which.png)

## Options

  -a  | aliases        = Display all aliases with 'less'

  -f  | functions      = Display all fucntions with 'less'

  -ff | find           = find a specifc file and return path

  -v  | favs           = Favorite aliases, functions, and scripts (file: .favs)

  -?  | help           = This help

## Usage Examples:

   which                    = Display help menu.

   which <alias name>       = Returns the alias definition.

   which <function name>    = Returns the fucntion definition using 'less'

   which <program>          = Returns program using '/usr/bin/which'

   which -a                 = Display all aliases with 'less'

   which -f                 = Display all fucntions with 'less'

   which -ff <file>         = find a specifc file and return path

   which -v                 = List (.favs) favorite aliases, functions, & scripts
                              (NOTE: favs() maintains .favs file)
