#!/bin/bash
# This shell script is used to get the Service Dev section work time
# statistics on FY2013
MYSQL_PASSWD=zhu88jie
REPORT_DIR=/home/RedmineWorkspace/redmine-embeded-doc/service_dev_direction_project/html/
mkdir -p $REPORT_DIR
REPORT_FILE=$REPORT_DIR/index.html
PATH="/opt/redmine-2.3.0-0/perl/bin:/opt/redmine-2.3.0-0/git/bin:/opt/redmine-2.3.0-0/sqlite/bin:/opt/redmine-2.3.0-0/ruby/bin:/opt/redmine-2.3.0-0/subversion/bin:/opt/redmine-2.3.0-0/php/bin:/opt/redmine-2.3.0-0/mysql/bin:/opt/redmine-2.3.0-0/apache2/bin:/opt/redmine-2.3.0-0/common/bin:$PATH"
export PATH

function getEstimatedTime()
{
   start_year=$1;
   start_month=$2;
   end_year=$1;
   end_month=$((10#${start_month}+1));
   if [ $start_month -gt 12 ]
   then
      end_month=1;
      end_year=$((10#${start_year}+1));
   fi
#   mysql -u root -p$MYSQL_PASSWD bitnami_redmine -e "select substr(sum(i.estimated_hours),1,instr(sum(i.estimated_hours),'.')+1) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id;" > $REPORT_DIR/temp
#   cat $REPORT_DIR/temp
#   echo "$start_year-$start_month-01 <-> $end_year-$end_month-01"
   mysql -u root -p$MYSQL_PASSWD bitnami_redmine -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id;" > $REPORT_DIR/temp
#   cat $REPORT_DIR/temp
   echo $(sed -n '2p' $REPORT_DIR/temp)|awk '{printf "%.1f\n",$0}';
}

function getSpentTime()
{
   start_year=$1;
   start_month=$2;
   end_year=$1;
   end_month=$((10#${start_month}+1));
   if [ $start_month -gt 12 ]
   then
      end_month=1;
      end_year=$((10#${start_year}+1));
   fi
   mysql -u root -p$MYSQL_PASSWD bitnami_redmine -e "select sum(hours) from time_entries where spent_on >= '$start_year-$start_month-01' and spent_on < '$end_year-$end_month-01';" > $REPORT_DIR/temp
#   cat $REPORT_DIR/temp
#   mysql -u root -p$MYSQL_PASSWD bitnami_redmine -e "select substr(sum(hours),1,instr(sum(hours),'.')+1) from time_entries where spent_on >= '$start_year-$start_month-01' and spent_on < '$end_year-$end_month-01';" > $REPORT_DIR/temp
#   cat $REPORT_DIR/temp
   echo $(sed -n '2p' $REPORT_DIR/temp)|awk '{printf "%.1f\n",$0}';
}

est1304=`getEstimatedTime 2013 04`
spt1304=`getSpentTime 2013 04`
est1305=`getEstimatedTime 2013 05`
spt1305=`getSpentTime 2013 05`
est1306=`getEstimatedTime 2013 06`
spt1306=`getSpentTime 2013 06`
est1307=`getEstimatedTime 2013 07`
spt1307=`getSpentTime 2013 07`
est1308=`getEstimatedTime 2013 08`
spt1308=`getSpentTime 2013 08`
est1309=`getEstimatedTime 2013 09`
spt1309=`getSpentTime 2013 09`
est1310=`getEstimatedTime 2013 10`
spt1310=`getSpentTime 2013 10`
est1311=`getEstimatedTime 2013 11`
spt1311=`getSpentTime 2013 11`
est1312=`getEstimatedTime 2013 12`
spt1312=`getSpentTime 2013 12`
est1401=`getEstimatedTime 2014 01`
spt1401=`getSpentTime 2014 01`
est1402=`getEstimatedTime 2014 02`
spt1402=`getSpentTime 2014 02`
est1403=`getEstimatedTime 2014 03`
spt1403=`getSpentTime 2014 03`




echo "<pre>" > $REPORT_FILE
echo "********************************************************************" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "                  Service Dev Work Time Statisics"  >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "********************************************************************" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "month               2013.4    2013.5    2013.6    2013.7" >> $REPORT_FILE
echo "--------------------------------------------------------------------" >> $REPORT_FILE
echo "Estimation time     $est1304    $est1305    $est1306    $est1307" >> $REPORT_FILE
echo "spent time          $spt1304    $spt1305    $spt1306    $spt1307" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "month               2013.8    2013.9    2013.10    2013.11" >> $REPORT_FILE
echo "--------------------------------------------------------------------" >> $REPORT_FILE
echo "Estimation time     $est1308    $est1309    $est1310    $est1311" >> $REPORT_FILE
echo "spent time          $spt1308    $spt1309    $spt1310    $spt1311" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "month               2013.12    2014.1    2013.2    2013.3" >> $REPORT_FILE
echo "--------------------------------------------------------------------" >> $REPORT_FILE
echo "Estimation time     $est1312    $est1401    $est1402    $est1403" >> $REPORT_FILE
echo "spent time          $spt1312    $spt1401    $spt1402    $spt1403" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "********************************************************************" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "P.S.:" >> $REPORT_FILE
echo "    Please connect Zhang, Bo5 if you need any support." >> $REPORT_FILE
echo "</pre>" >> $REPORT_FILE
exit 1;
