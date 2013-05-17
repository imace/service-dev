#!/bin/bash
#Merge the statisics result between the gitstats and gitinspector
#

echo ">>>>>>>> Start gitstats: >>>>>>>>"
gitstats $1 $2
echo "<<<<<<<< End gitstats! <<<<<<<<"
echo ">>>>>>> Start gitinspector : >>>>>>>>"
echo "<pre>" > $2/inspector.html
/home/RedmineWorkspace/gitinspector/gitinspector.py -T $1 -F text >> $2/inspector.html
echo "</pre>" >> $2/inspector.html
echo "<<<<<<<< End gitinspector! <<<<<<<<"
echo " ----- List statisics files : -----"
pwd
ls $2/
echo ">>>>>>>> Start merge results: >>>>>>>"
sed '19a <li><a href=\"inspector.html\">git inspector</a></li>' $2/index.html > tmpfile
mv tmpfile $2/index.html
echo ">>>>>>> Merge results finished! >>>>>>>>"

echo " Get Git Statisics Success! "
