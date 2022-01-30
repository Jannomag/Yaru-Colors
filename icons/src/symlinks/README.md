## Symbolic Links

To save on space many icons are just symbolic links to generic icons and, to keep track of all links, sets of lists are maintained that corresponds to a icon `context` for both the fullcolor and the symbolic icons set.

To generate symlinks icons you will only need the provided script, but to clear broken symlinks you'll need `symlinks` installed.

 - [fullcolor](./fullcolor) - the list files for symbolic icon links
 - [symbolic](./symbolic) -  the list files for fullcolor icon links
 - [generate-symlinks.sh](./generate-symlinks.sh) - the generation script

## Usage
`generate-symlinks.sh [--all|--match <string>] [--verbose]`

#####Options:

|  Flag     |  Description |
| --------- | ------|
| -a, --all   | Generates all the symlinks defined in .list files **(warning: this might break manually generated symlinks)** |
| -m, --match  &lt;string&gt;       |   Generates only the symlinks in .list files that matches the provided string |
| -v, --verbose      |    More verbose output  |

 #####Example:
`$ generate-symlinks.sh -m inode-directory`

This generates only the link defined in `./symbolic/apps.list`
