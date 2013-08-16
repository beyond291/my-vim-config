#!/usr/bin/awk -f
BEGIN {
    include_num=split("./application/video,./application/include,./mcfw",include_files,",")
    exclude_num=split("./bin,./build,./initFiles,./lib,./lib_third_party,./userintf",exclude_files,",")
}

function exclude_filter(line) {
    orig_line = line
    for ( e=1; e<=exclude_num; e++ ) {
        #speed faster
        edx = index(line, exclude_files[e])
        if (edx != 0) {
            return;
        }

        #speed lower
        #if (match(line, exclude_files[e])) {
        #    # print orig_line " match " reg
        #    return;
        #}
    }

    print line
}

{
    for ( x=1; x<=include_num; x++ ) {
        idx = index($0, include_files[x])

        if ( 0 != idx ) {
            exclude_filter($0)
            continue
        }
    }
}
