#!/bin/bash
# This bash scripts is used to generate the home page html file which is
# contains all sphinx documents and user can browse them easily in left navigation side.
#
#    Author : bo5.zhang@sonymobile.com

TREE_HTML_FILE="service_doc/main/doc_tree.html"
MAIN_HTML_FILE="service_doc/main/main.html"
DOC_BUILD_PATH="/build/html/index.html"

project_root=`pwd`

function buildProjects()
{
    projects_paths=`find -name Makefile -exec dirname {} \;`

    for path in $projects_paths;
    do
        cd $path
        make html
        cd $project_root
    done
}

function cleanProjects()
{
    projects_paths=`find -name Makefile -exec dirname {} \;`

    for path in $projects_paths;
    do
        cd $path
        make clean
        cd $project_root
    done
}

function isDocumentNoteDirectory()
{
	local dir=$1
	if [ -d $dir ]; then
        local files=$(ls $dir);
        for f in $files
        do
            if [ $f == "Makefile" ]; then
                echo "1";
                exit;
            fi
        done
        echo "0";
	else
        echo "2";
	fi
}

function listCurrentDirectory()
{
    local cur_dir=$1
    local id=$2
    local dir_path=$3
    local file_list=$(ls $cur_dir);
    local i=0;
    echo "<ul>" >> $TREE_HTML_FILE
    for file in $file_list
    do
        ((i++))
        local sub_id=$id"-$i"
        res=`isDocumentNoteDirectory $cur_dir`
        # echo " $cur_dir result = $res"
        if [ $res = 0 ];then
            if [ -d "$cur_dir/$file" ];then
                echo "<li id=\"$sub_id\">" >> $TREE_HTML_FILE
                echo "<a href=\"#\">$file</a>" >> $TREE_HTML_FILE
                listCurrentDirectory "$cur_dir/$file" $sub_id "$dir_path/$file"
                echo "</li>" >> $TREE_HTML_FILE
            else
                # echo "file = $file "
                continue;
            fi
        elif [ $res = 1 ];then
            local path="$cur_dir$DOC_BUILD_PATH"
            echo "<li id=\"$sub_id\">" >> $TREE_HTML_FILE
            echo "<a href=\"../../$path\" target=\"doc_detail\">Document</a>" >> $TREE_HTML_FILE
            echo "</li>" >> $TREE_HTML_FILE
            break;
        elif [ $res = 2 ]; then
            continue;
        fi
    done
    echo "</ul>" >> $TREE_HTML_FILE
    
}

function echoHtmlHeads()
{
	touch $TREE_HTML_FILE
	
    echo "<!DOCTYPE html
          PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"
          \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
          <html xmlns=\"http://www.w3.org/1999/xhtml\">
          <head>
	          <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
	          <title>Service-Dev-Doc-Tree</title>
	          <script type=\"text/javascript\" src=\"_lib/jquery.js\"></script>
              <script type=\"text/javascript\" src=\"_lib/jquery.cookie.js\"></script>
              <script type=\"text/javascript\" src=\"_lib/jquery.hotkeys.js\"></script>
              <script type=\"text/javascript\" src=\"_lib/jquery.jstree.js\"></script>
              <link type=\"text/css\" rel=\"stylesheet\" href=\"syntax/!style.css\"/>
              <script type=\"text/javascript\" src=\"syntax/!script.js\"></script>
          </head>
          <body id=\"demo_body\">

          <div id=\"container\">

          <h3 id=\"dhead\">Service-Dev文档树</h3>

          <div id=\"description\">" > $TREE_HTML_FILE
}

function echoHtmlFoots()
{
    echo "<script type=\"text/javascript\">
          \$(function () {
              \$(\"#demo3\")
                  .jstree({ \"plugins\" : [\"themes\",\"html_data\"] })
                  // 1) if using the UI plugin bind to select_node
                  //.bind(\"select_node.jstree\", function (event, data) { 
     	          // \`data.rslt.obj\` is the jquery extended node that was clicked
                  //	alert(data.rslt.obj.attr(\"id\"));
                  //})
                  // 2) if not using the UI plugin - the Anchor tags work as expected
                  //    so if the anchor has a HREF attirbute - the page will be changed
                  //    you can actually prevent the default, etc (normal jquery usage)
                  //.delegate(\"a\", \"click\", function (event, data) { event.preventDefault(); })
          });

          </script>
          </div>

          </body>
          </html>" >> $TREE_HTML_FILE
}

# Build all availble projects
echo $1
if [ $1 == "clean" ];then
    cleanProjects
else
    buildProjects
fi

TREE_HTML_FILE="$TREE_HTML_FILE"
MAIN_HTML_FILE="$MAIN_HTML_FILE"
REX_PROJECT_NAME='^[0-9]{1,2}_.*'

echoHtmlHeads

#Generate the left projects navigation tree
echo "<div id=\"demo3\" class=\"demo\" style=\"height:100%;\"> " >> $TREE_HTML_FILE
echo "<ul>" >> $TREE_HTML_FILE
# list all documents directories 
file_list=$(ls);
i=0;
for file in $file_list
do
    if [ -d $file ] && [[ "$file" =~ $REX_PROJECT_NAME ]];then
        ((i++));
        root_id="doc_$i"
        echo "<li id=\"$root_id\">" >> $TREE_HTML_FILE
        echo "<a href=\"#\">$file</a>" >> $TREE_HTML_FILE
        listCurrentDirectory "$file" $root_id ""
        echo "</li>" >> $TREE_HTML_FILE
    fi
done
echo "</ul>" >> $TREE_HTML_FILE

echoHtmlFoots

# Create the soft link of our total documents projects
cd $project_root
if [ -f "index.html" ];then
    rm "index.html"
fi
ln -s $MAIN_HTML_FILE index.html

echo ""
echo "******************************************************************"
echo "       You can browse all documents in \"index.html\" now!"
echo "******************************************************************"
