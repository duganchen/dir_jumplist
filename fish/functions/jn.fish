function jn
    _jgc

    if test -f ~/.dir_jumplist.txt
        set -l jumplist (cat ~/.dir_jumplist.txt)
        if contains $PWD jumplist
            if test $i -eq (count $jumplist)
                cd $jumplist[1]
            else
                cd $jumplist[(math $i + 1)]
            end
        else
            cd $jumplist[1]
        end
    end
end
