# fish_dir_jumplist

A FISH directory changer. The model is the jumplist in an editor like Helix.
You add directories to it, and then jump back and forth.

[fzf](https://junegunn.github.io/fzf/) is a dependency.

The functions are:

* *ja* adds the current directory to the jumplist.
* *jr* resets (clears) the jumplist.
* *jn* goes to the next directory in the jumplist.
* *jp* goes to the previous directory to the jumplist.
* *j* gives you a fuzzy finder to choose a directory from the jumplist.

The jumplist is circular, and it applies only to the current FISH instance
(you'll see that the implementation uses set -g).
