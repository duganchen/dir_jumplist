function jp
    _jgc

    if test -f ~/.dir_jumplist.txt
        set -l jumplist (cat ~/.dir_jumplist.txt)
        if contains $PWD $jumplist
            if test $i -eq 1
                cd $jumplist[(count $jumplist)]
            else
                cd $jumplist[(math $i - 1)]
            end
        else
            cd $jumplist[(count $jumplist)]
        end
    end
end
