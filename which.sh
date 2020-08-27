#!/usr/bin/env bash
# 📌 which() - checks for alias, then checks for funciton, then checks /usr/bin/which
#    Usage:  which <alias_name>, which <function_name>, which <progrem>, whcih -ff <file>
alias .which='/usr/bin/which'  # default which
which() {
  _self="${FUNCNAME[0]}"
 [[ -z ${1}               ]] && { shift; ${FUNCNAME[0]} -?; return; }
 [[ "${1}" == "aliases"   ]] || [[ "${1}" == "-a"  ]] && { shift; alias | less; return; }
 [[ "${1}" == "functions" ]] || [[ "${1}" == "-f"  ]] && { shift; declare -f | less; return; }
 [[ "${1}" == "find"      ]] || [[ "${1}" == "-ff" ]] && { shift; find ~ -path ~/Library -prune -false -o -name ${1}; return; }
 [[ "${1}" == "favs"      ]] || [[ "${1}" == "-v"  ]] && { shift; favs; return; }
 [[ "${1}" == "help"      ]] || [[ "${1}" == "-h"  ]] || [[ "${1}" == "-?" ]] || [[ "${1}" == "?" ]] && {
 echo -e "
    PURPOSE: which is a bash function that overloads which. '${FUNCNAME[0]}()' looks for aliases/functions,
    then programs (using native 'which')";
 #_self="$(alias | grep 'alias' | grep "${FUNCNAME[0]}" | awk '/alias/ { print $2 }' | cut -f 1 -d '=')";
 [[ "${_self}" != "${FUNCNAME[0]}" ]] && { echo -e "\n\t  (NOTE: '${_self}' is now an alias for this tool: $(alias ${_self}))"; }
 echo -e "
    ${FUNCNAME[0]} <options> | <alias name> | <function name> | <program name>

    OPTIONS:
      -a  | aliases   Display all aliases with 'less'
      -f  | functions Display all fucntions with 'less'
      -ff | find      find a specifc file and return path
      -v  | favs      Favorite aliases, functions, and scripts (file: .favs)
      -?  | help      This help

    USAGE:
       ${FUNCNAME[0]}                 Display this help.
       ${FUNCNAME[0]} <alias name>    Returns the alias definition.
       ${FUNCNAME[0]} <function name> Returns the fucntion definition using 'less'
       ${FUNCNAME[0]} <program>       Returns program using '/usr/bin/which'
       ${FUNCNAME[0]} -a              Display all aliases with 'less'
       ${FUNCNAME[0]} -f              Display all fucntions with 'less'
       ${FUNCNAME[0]} -ff <file>      find a specifc file and return path
       ${FUNCNAME[0]} -v              List (.favs) favorite aliases, functions, & scripts
                              (NOTE: favs() maintains .favs file)
   "
   return;
   }
   [[ $( alias | grep "alias ${1}=" ) ]] && { alias ${1}; }
   [[ $( declare -f ${1} ) ]] && { declare -f ${1} | less; }
   /usr/bin/which ${1};
   return;

}
export -f which;
