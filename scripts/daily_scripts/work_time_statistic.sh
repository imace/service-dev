#!/bin/bash
# This shell script is used to get the Service Dev section work time
# statistics on FY2013
MYSQL_PASSWD=zhu88jie
REPORT_DIR=/home/RedmineWorkspace/redmine-embeded-doc/service_dev_direction_project/html/
mkdir -p $REPORT_DIR
REPORT_FILE=$REPORT_DIR/index.html
PATH="/opt/redmine-2.3.0-0/perl/bin:/opt/redmine-2.3.0-0/git/bin:/opt/redmine-2.3.0-0/sqlite/bin:/opt/redmine-2.3.0-0/ruby/bin:/opt/redmine-2.3.0-0/subversion/bin:/opt/redmine-2.3.0-0/php/bin:/opt/redmine-2.3.0-0/mysql/bin:/opt/redmine-2.3.0-0/apache2/bin:/opt/redmine-2.3.0-0/common/bin:$PATH"
export PATH

# Get the rows in projects table
declare -a years=(2013 2013 2013 2013 2013 2013 2013 2013 2013 2014 2014 2014);
declare -a months=(04 05 06 07 08 09 10 11 12 01 02 03)
declare -a projects_names;
declare -a projects_ids;
declare -a users_ids;
declare -a users_names; 

function convertToInt()
{
    echo $( echo $1|awk '{printf "%.0f\n",$0}')
}

function initProjects()
{
    #mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select name, id from projects ;" > $REPORT_DIR/temp;
    mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select name, id from projects where name in('12_Dev_Service','05_MRP_Cloud_Delivery','11_Dev_Android_Client');" > $REPORT_DIR/temp;

    projects_count=0;
    while read xcoord ycoord
    do
        projects_names[$projects_count]=$xcoord;
        projects_ids[$projects_count]=$ycoord;
        # echo "name_$projects_count = ${projects_names[$projects_count]}";
        # echo "id_$projects_count = ${projects_ids[$projects_count]}";
        ((projects_count++));
    done < $REPORT_DIR/temp
    #echo $projects_count
}

function initUsers()
{
    mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select u.id, u.lastname, u.firstname from users as u, groups_users as g where g.group_id=36 and u.id=g.user_id;" > $REPORT_DIR/temp;
    users_count=0;
    while read xcoord ycoord
    do
        users_ids[$users_count]=$xcoord;
        users_names[$users_count]=$ycoord;
        # echo "name_$users_count = ${users_names[$users_count]}";
        # echo "id_$users_count = ${users_ids[$users_count]}";
        ((users_count++));
    done < $REPORT_DIR/temp
}

function getEndDay()
{
    start_year=$1;
    start_month=$2;
    end_year=$1;
    end_month=$((10#${start_month}+1));
      
    if [ $start_month -eq 12 ];
    then
        end_month=1;
        end_year=$((10#${start_year}+1));
    fi
}

function getPreDay()
{
    start_year=$1;
    start_month=$2;
    pre_year=$1;
    pre_month=$((10#${start_month}-1));
      
    if [ $start_month -eq 1 ];
    then
        pre_month=12;
        pre_year=$((10#${start_year}-1));
    fi
}

# Calculate the rate of work time
function calcRates()
{
    local spt_time=$1
    local est_time=$2 
    if [ -z $est_time ]; then
        echo "0"
    else
        var=$(echo "scale=2; ($est_time-$spt_time)*100/$est_time"|bc);  
        printf "%.2f" $var; 
    fi
}

function getEstimatedtime()
{
    # echo "getEstimatedtime"
    if [ $# -eq 0 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01' and t.hours != 0);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01'  and t.project_id = $1 and t.hours != 0);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2 
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.hours != 0);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01'  and t.project_id = $3 and t.hours != 0);")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi
}

function getSpenttime()
{
    # echo "getSpenttime"
    if [ $# -eq 0 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where spent_on >= '2013-04-01' and spent_on < '2014-04-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where project_id = $1 and spent_on >= '2013-04-01' and spent_on < '2014-04-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where spent_on >= '$start_year-$start_month-01' and spent_on < '$end_year-$end_month-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where spent_on >= '$start_year-$start_month-01' and spent_on < '$end_year-$end_month-01' and project_id = $3;")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi
}

function getClosedEstimatedTime
{
    if [ $# -eq 0 ];then 
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in ( select t.id from issues as t where t.updated_on >= '2013-03-01' and t.updated_on < '2014-04-01') and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in ( select t.id from issues as t where t.updated_on >= '2013-03-01' and t.updated_on < '2014-04-01' and t.project_id = $1) and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in ( select t.id from issues as t where t.updated_on >= '$start_year-$start_month-01' and t.updated_on < '$end_year-$end_month-01' and t.project_id in (12,6,9)) and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in ( select t.id from issues as t where t.updated_on >= '$start_year-$start_month-01' and t.updated_on < '$end_year-$end_month-01' and t.project_id = $3) and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi 
}

function getClosedSpentTime
{
    # echo "getClolsedSpentTime"
    if [ $# -eq 0 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t where t.issue_id in (select i.id from issues as i where (i.status_id=3 or i.status_id=5 or status_id=6) and i.updated_on >= '2013-04-01' and i.updated_on < '2014-04-01') ;")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t where t.issue_id in (select i.id from issues as i where (i.status_id=3 or i.status_id=5 or status_id=6) and i.updated_on >= '2013-04-01' and i.updated_on  < '2014-04-01')  and t.project_id = $1;")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t where t.issue_id in (select i.id from issues as i where (i.status_id=3 or i.status_id=5 or i.status_id=6) and i.updated_on >= '$start_year-$start_month-01' and i.updated_on < '$end_year-$end_month-01' ) and t.project_id in (12,6,9);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t where t.issue_id in (select i.id from issues as i where (i.status_id=3 or i.status_id=5 or i.status_id=6) and i.updated_on >= '$start_year-$start_month-01' and i.updated_on < '$end_year-$end_month-01' )and t.project_id = $3;")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi

}

function getPersonalEstimatedTime
{
    if [ $# -eq 0 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01');")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01' and t.user_id = $1);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01');")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i where i.id in (select t.issue_id from  time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.user_id = $3);")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi
}

function getPersonalSpentTime
{
    # echo "getClolsedSpentTime"
    if [ $# -eq 0 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where spent_on >= '2013-04-01' and spent_on < '2014-04-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where user_id = $1 and spent_on >= '2013-04-01' and spent_on < '2014-04-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where spent_on >= '$start_year-$start_month-01' and spent_on < '$end_year-$end_month-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(hours) from time_entries where user_id = $3 and spent_on >= '$start_year-$start_month-01' and spent_on < '$end_year-$end_month-01';")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi

}

function getCreatedDefectNumByProject()
{
    getEndDay $1 $2
    projectId=$3
    createBugNum=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select count(id) from issues where project_id = $projectId and created_on >= '$start_year-$start_month-01' and created_on < '$end_year-$end_month-01' and tracker_id = 1;")|awk '{printf "%.1f\n",$0}');
    
    convertToInt $createBugNum
}

function getClosedDefectNumByProject()
{
    getEndDay $1 $2
    projectId=$3
    closedBugNum=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select count(id) from issues where project_id = $projectId and updated_on >= '$start_year-$start_month-01' and updated_on < '$end_year-$end_month-01' and tracker_id = 1 and status_id in (3,5,6);")|awk '{printf "%.1f\n",$0}');
    
    convertToInt $closedBugNum
}

function saveVar()
{
    echo $1 > $REPORT_DIR/var;
}

function readVar()
{
    cat $REPORT_DIR/var
}

function getDefectNum
{
    previousMonthOpenNum=$(readVar)
    
    currentMonthCreatedNum=$(getCreatedDefectNumByProject $1 $2 $3);
    currentMonthClosedNum=$(getClosedDefectNumByProject $1 $2 $3);
        
    currentMonthOpenNum=$(echo "$previousMonthOpenNum+$currentMonthCreatedNum-$currentMonthClosedNum"|bc);
    
    saveVar $currentMonthOpenNum
    
    convertToInt $currentMonthOpenNum
}

# Get project names and ids. There is an issue if the project name contains space 
initProjects;

# Start the generate the time report into a html file
echo "" > $REPORT_FILE
# echo "<link href=\"/redmine/stylesheets/application.css?1363725157\" media=\"all\" rel=\"stylesheet\" type=\"text/css\" />" >> $REPORT_FILE

############################# Generate the finished tasks work time report ####################################################

echo "<h2> Service Dev Finished Work Time Statisics in FY2013 </h2>" >> $REPORT_FILE
echo "<div class=\"autoscroll\">" >> $REPORT_FILE
echo "<table class=\"list\" id=\"time-report-2\">" >> $REPORT_FILE
# Generate the head of the table
echo "<thead>" >> $REPORT_FILE
echo "<tr>" >> $REPORT_FILE
echo "  <th>Projects</th>" >> $REPORT_FILE
num_months=${#months[@]}
for (( i=0; i < num_months; i++ )); do
    echo "<th class=\"period\" width=\"8%\">${years[$i]}-${months[$i]}</th>" >> $REPORT_FILE
done
echo "  <th class=\"total\" width=\"8%\">Tobal</th>" >> $REPORT_FILE
echo "</tr>" >> $REPORT_FILE
echo "</thead>" >> $REPORT_FILE

#Get the table body
echo "<tbody>" >> $REPORT_FILE


for (( i=0; i < projects_count; i++ )); do
    proj_spt_time=$(getClosedSpentTime ${projects_ids[$i]})
    # echo "proj_spt_time_$i = $proj_spt_time"
    proj_est_time=$(getClosedEstimatedTime ${projects_ids[$i]})
    # echo "proj_est_time_$i = $proj_est_time"
    if [ -z $proj_spt_time ];then
       continue;
    fi
    if [ $(( i%2 )) -eq 0 ]; then
        echo "<tr class=\"odd last-level\">" >> $REPORT_FILE
    else
        echo "<tr class=\"even last-level\">" >> $REPORT_FILE
    fi;
    
    echo "" >> $REPORT_FILE
    
    echo "<td>${projects_names[$i]}</td>" >> $REPORT_FILE
    for (( j=0; j < num_months; j++)); do
        est_time=$(getClosedEstimatedTime ${years[$j]} ${months[$j]} ${projects_ids[$i]})
        #echo "est_time_$i_$j = $est_time"
        spt_time=$(getClosedSpentTime ${years[$j]} ${months[$j]} ${projects_ids[$i]})

        rates[$j]=$(calcRates $spt_time $est_time); 
       
        if [ -z $est_time ] && [ -z $spt_time ];then
           echo "    <td class=\"hours\"></td>" >> $REPORT_FILE
        else 
            if [ ! $spt_time ]; then
                spt_time=0.0
                rates[$j]=0.00
            fi
            echo "    <td class=\"hours\"><span class=\"hours hours-int\">$spt_time</span><span class=\"hours hours-dec\">[$est_time]=${rates[$j]}%</span></td>" >> $REPORT_FILE
        fi

    done
    proj_rates[$i]=$(calcRates $proj_spt_time $proj_est_time);
    echo "  <td class=\"hours\"><span class=\"hours hours-int\">$proj_spt_time</span><span class=\"hours hours-dec\">[$proj_est_time]=${proj_rates[$i]}%</span></td>" >> $REPORT_FILE
    echo "</tr>" >> $REPORT_FILE
done

# Add the projects total times row by month
echo "<tr class=\"total\">" >> $REPORT_FILE
echo "<td>Total</td>" >> $REPORT_FILE
for (( i=0; i < num_months; i++ )); do
    monthly_spt_time=$(getClosedSpentTime ${years[$i]} ${months[$i]});
    # echo "monthly_spt_time_$i = $monthly_spt_time"
    monthly_est_time=$(getClosedEstimatedTime ${years[$i]} ${months[$i]});
    # echo "monthly_est_time_$i = $monthly_est_time"

    monthly_rates[$i]=$(calcRates $monthly_spt_time $monthly_est_time);

    if [ -z $monthly_spt_time ] && [ -z $monthly_est_time ]; then
        echo "<td class=\"hours\"></td>" >> $REPORT_FILE;
    else
        echo "<td class=\"hours\"><span class=\"hours hours-int\">$monthly_spt_time</span><span class=\"hours hours-dec\">[$monthly_est_time]=${monthly_rates[$i]}%</span></td>" >> $REPORT_FILE
    fi
done
    monthly_spt_time_total=$(getClosedSpentTime); 
    monthly_est_time_total=$(getClosedEstimatedTime);  
    monthly_rates_total=$(calcRates $monthly_spt_time_total $monthly_est_time_total);

    if [ -z $monthly_spt_time_total ] && [ -z $monthly_est_time_total ]; then
        echo "<td class=\"hours\"></td>" >> $REPORT_FILE;
    else
        echo "<td class=\"hours\"><span class=\"hours hours-int\">$monthly_spt_time_total</span><span class=\"hours hours-dec\">[$monthly_est_time_total]=${monthly_rates_total}%</span></td>" >> $REPORT_FILE
    fi


echo "</tr>" >> $REPORT_FILE
echo "</tbody>" >> $REPORT_FILE
echo "</table>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE

#####Generate cal method#####
echo "<div>" >> $REPORT_FILE
echo "<font color=\"red\">每一项显示方式： 总的花费时间【总的评估时间】 <br>" >> $REPORT_FILE
echo "计算方法: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 搜索当月已结束的任务列表TaskList。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 计算出任务列表总的评估时间TotalEstimatedTime。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 计算出任务列表总的花费时间TotalSpendTime。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 效率比的计算公式： （总的评估时间-总的花费时间）/总的评估时间。<br>" >> $REPORT_FILE 
echo "结果分析: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 其中关于task已结束的状态包括已完成，已关闭，已拒绝。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 如果某个已结束task没有填写评估时间，则只会导致总的花费时间增多，而总的评估时间不增加。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 如果某个已结束task有任何更新，则此task的消耗时间只会计算在更新月份，导致统计结果会有微量变化。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 如果计算出任务列表总的花费时间是0， 则统计结果为0。</font><br>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
echo "<br>" >> $REPORT_FILE
#####End cal method######

###############################################################################################################################


############################# Generate the open defect bug numbers report #####################################################
echo "<h2> Service Team Defect Number Statisics in FY2013 </h2>" >> $REPORT_FILE
echo "<div class=\"autoscroll\">" >> $REPORT_FILE
echo "<table class=\"list\" id=\"service-team-defect-number-report\">" >> $REPORT_FILE

# Generate the head of the table
echo "<thead>" >> $REPORT_FILE
echo "<tr>" >> $REPORT_FILE
echo "  <th>Status</th>" >> $REPORT_FILE
for (( i=0; i < num_months; i++ )); do
    echo "<th class=\"period\" width=\"8%\">${years[$i]}-${months[$i]}</th>" >> $REPORT_FILE
done
echo "</tr>" >> $REPORT_FILE
echo "</thead>" >> $REPORT_FILE

# Statistic the 12_Dev_Service
project_id=12;
saveVar 0

#Get the table body
echo "<tbody>" >> $REPORT_FILE

echo "<tr>" >> $REPORT_FILE
echo "<td>CDN(Inflow)</td>" >> $REPORT_FILE
for (( i=0; i < num_months; i++ )); do
    openDefectNum=$(getCreatedDefectNumByProject ${years[$i]} ${months[$i]} $project_id);
    echo "    <td class=\"hours\"><span class=\"hours hours-int\">$spt_time</span><span class=\"hours hours-dec\">$openDefectNum</span></td>" >> $REPORT_FILE
done
echo "</tr>" >> $REPORT_FILE

echo "<tr>" >> $REPORT_FILE
echo "<td>FDN</td>" >> $REPORT_FILE
for (( i=0; i < num_months; i++ )); do
    openDefectNum=$(getClosedDefectNumByProject ${years[$i]} ${months[$i]} $project_id);
    echo "    <td class=\"hours\"><span class=\"hours hours-int\">$spt_time</span><span class=\"hours hours-dec\">$openDefectNum</span></td>" >> $REPORT_FILE
done
echo "</tr>" >> $REPORT_FILE

echo "<tr>" >> $REPORT_FILE
echo "<td>ODN</td>" >> $REPORT_FILE
for (( i=0; i < num_months; i++ )); do
    openDefectNum=$(getDefectNum ${years[$i]} ${months[$i]} $project_id);
    echo "    <td class=\"hours\"><span class=\"hours hours-int\">$spt_time</span><span class=\"hours hours-dec\">$openDefectNum</span></td>" >> $REPORT_FILE
done
echo "</tr>" >> $REPORT_FILE
echo "</tbody>" >> $REPORT_FILE
echo "</table>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
#####Generate cal method#####
echo "<div>" >> $REPORT_FILE
echo "<font color=\"red\">每一项显示方式： 每月Open Defect Number. <br>" >> $REPORT_FILE
echo "计算方法: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 计算出上一个月的遗留的LODN: Left Open Defect Number in last month <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 计算出当月的所有的新创建的CDN： Created Defect Number in this month <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 计算出当月的所有的修复的FDN： Fixed Defect Number in this month <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 当月的Open Defect Number, ODN = LODN + CDN - FDN. <br>" >> $REPORT_FILE
echo "结果分析: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 其中关于Defect已修复的状态包括已完成，已关闭，已拒绝。 <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 本月的CDN即为当月的Bug Inflow. </font><br>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
echo "<br>" >> $REPORT_FILE

###############################################################################################################################

############################# Generate the personal tasks work time report ####################################################
initUsers

echo "<h2> Service Dev Developers' Personal Work Time Statisics in FY2013 </h2>" >> $REPORT_FILE
echo "<div class=\"autoscroll\">" >> $REPORT_FILE
echo "<font color=\"red\">关于个人的统计结果仅供参考</font><br>" >> $REPORT_FILE
echo "<table class=\"list\" id=\"time-personal-report\">" >> $REPORT_FILE
# Generate the head of the table
echo "<thead>" >> $REPORT_FILE
echo "<tr>" >> $REPORT_FILE
echo "  <th>  Users' Name  </th>" >> $REPORT_FILE

for (( i=0; i < num_months; i++ )); do
    echo "<th class=\"period\" width=\"8%\">${years[$i]}-${months[$i]}</th>" >> $REPORT_FILE
done
echo "  <th class=\"total\" width=\"8%\">Tobal</th>" >> $REPORT_FILE
echo "</tr>" >> $REPORT_FILE
echo "</thead>" >> $REPORT_FILE

#Get the table body
echo "<tbody>" >> $REPORT_FILE


for (( i=0; i < users_count; i++ )); do
    user_spt_time=$(getPersonalSpentTime ${users_ids[$i]})
    # echo "proj_spt_time_$i = $proj_spt_time"
    user_est_time=$(getPersonalEstimatedTime ${users_ids[$i]})
    # echo "proj_est_time_$i = $proj_est_time"
    if [ -z $user_spt_time ];then
       continue;
    fi
    if [ $(( i%2 )) -eq 0 ]; then
        echo "<tr class=\"odd last-level\">" >> $REPORT_FILE
    else
        echo "<tr class=\"even last-level\">" >> $REPORT_FILE
    fi;

    echo "" >> $REPORT_FILE

    echo "<td>${users_names[$i]}</td>" >> $REPORT_FILE
    for (( j=0; j < num_months; j++)); do
        est_time=$(getPersonalEstimatedTime ${years[$j]} ${months[$j]} ${users_ids[$i]})
        # echo "est_time_$i_$j = $est_time"
        spt_time=$(getPersonalSpentTime ${years[$j]} ${months[$j]} ${users_ids[$i]})

        rates[$j]=$(calcRates $spt_time $est_time);

        # echo "spt_time_$i_$j = $spt_time"
        if [ -z $est_time ] && [ -z $spt_time ];then
            echo "    <td class=\"hours\"></td>" >> $REPORT_FILE
        else  
            echo "    <td class=\"hours\"><span class=\"hours hours-int\">$spt_time</span><span class=\"hours hours-dec\">[$est_time]=${rates[$j]}%</span></td>" >> $REPORT_FILE
        fi
    done

    user_rates[$i]=$(calcRates $user_spt_time $user_est_time);

    echo "  <td class=\"hours\"><span class=\"hours hours-int\">$user_spt_time</span><span class=\"hours hours-dec\">[$user_est_time]=${user_rates[$i]}%</span></td>" >> $REPORT_FILE

    echo "</tr>" >> $REPORT_FILE
done

# Add the projects total times row by month
echo "<tr class=\"total\">" >> $REPORT_FILE
echo "<td>Total</td>" >> $REPORT_FILE
for (( i=0; i < num_months; i++ )); do
    monthly_spt_time=$(getPersonalSpentTime ${years[$i]} ${months[$i]});
    # echo "monthly_spt_time_$i = $monthly_spt_time"
    monthly_est_time=$(getPersonalEstimatedTime ${years[$i]} ${months[$i]});
    # echo "monthly_est_time_$i = $monthly_est_time"

    monthly_rates[$i]=$(calcRates $monthly_spt_time $monthly_est_time);

    if [ -z $monthly_spt_time ] && [ -z $monthly_est_time ]; then
        echo "<td class=\"hours\"></td>" >> $REPORT_FILE;
    else
        echo "<td class=\"hours\"><span class=\"hours hours-int\">$monthly_spt_time</span><span class=\"hours hours-dec\">[$monthly_est_time]=${monthly_rates[$i]}%</span></td>" >> $REPORT_FILE
    fi
done

    monthly_spt_time_total=$(getPersonalSpentTime); 
    monthly_est_time_total=$(getPersonalEstimatedTime);  
    monthly_rates_total=$(calcRates $monthly_spt_time_total $monthly_est_time_total);

    if [ -z $monthly_spt_time_total ] && [ -z $monthly_est_time_total ]; then
        echo "<td class=\"hours\"></td>" >> $REPORT_FILE;
    else
        echo "<td class=\"hours\"><span class=\"hours hours-int\">$monthly_spt_time_total</span><span class=\"hours hours-dec\">[$monthly_est_time_total]=${monthly_rates_total}%</span></td>" >> $REPORT_FILE
    fi

echo "</tr>" >> $REPORT_FILE
echo "</tbody>" >> $REPORT_FILE
echo "</table>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
###############################################################################################################################

#####Generate cal method#####
echo "<div>" >> $REPORT_FILE
echo "<font color=\"red\">每一项显示方式： 总的花费时间【总的评估时间】 <br>" >> $REPORT_FILE
echo "计算方法: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 搜索出当月有时间花费的所有tasklist。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 计算出任务列表总的评估时间TotalEstimatedTime。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 计算出任务列表总的花费时间TotalSpendTime。<br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 效率比的计算公式： （总的评估时间-总的花费时间）/总的评估时间。<br>" >> $REPORT_FILE 
echo "结果分析: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 如果某个task在多个月份都有花费时间，task的消耗时间会在有花费时间的月份计算,此task的评估时间也会出现在不同的月份,导致总体结果会小于所有task都在当前月内完成的task。</font>  <br>" >> $REPORT_FILE 
echo "<br>Please connect <a href=\"mailto:weiqing.qiao@sonymobile.com\">Qiao, Weiqing</a> if you need any support. <br>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
echo "<br>" >> $REPORT_FILE
#####End cal method######


# Notes for the statistic table
echo "<hr>" >> $REPORT_FILE  

# Export csv report for the statistic table
:<<BLOCK
echo "<p class=\"other-formats\">" >> $REPORT_FILE
echo "Export" >> $REPORT_FILE 
echo "<span>" >> $REPORT_FILE
echo "<a class=\"csv\" rel=\"nofollow\" href=\"/redmine/time_entries/report.csv?columns=month&criteria%5B%5D=project&f%5B%5D=spent_on&f%5B%5D=&op%5Bspent_on%5D=%2A&utf8=%E2%9C%93\">CSV</a>" >> $REPORT_FILE
echo "</span>" >> $REPORT_FILE
echo "</p>" >> $REPORT_FILE
BLOCK
exit 1;:
