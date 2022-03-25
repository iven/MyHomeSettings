
function f -d "easy way to 'find' files"
    set -l case -name
    set -l blur true
    set -l dir .
    set -l file $argv[1]

    if test (count $argv) -gt 1
        set file $argv[2]

        for i in (echo $argv[1] | cut -c2- | fold -w1)
            switch $i
                case 'i'
                    set case -iname
                case 'x'
                    set blur
                case 'd'
                    set dir $argv[2]
                    set file $argv[3]
            end
        end
    end

    if test $blur
        set file \*$file\*
    end

    find $dir $case $file
end

# vim:ts=4:sw=4:et:ft=fish:
