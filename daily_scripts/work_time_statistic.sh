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
    mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select name, id from projects where status=1;" > $REPORT_DIR/temp;
    projects_count=0;
    while read xcoord ycoord
    do
        projects_names[$projects_count]=$xcoord;
        projects_ids[$projects_count]=$ycoord;
        # echo "name_$projects_count = ${projects_names[$projects_count]}";
        # echo "id_$projects_count = ${projects_ids[$projects_count]}";
        ((projects_count++));
    done < $REPORT_DIR/temp
    # echo $projects_count
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

# Calculate the rate of work time
function calcRates()
{
    local spt_time=$1
    local est_time=$2
    if [ -z $est_time ]; then
        echo "0"
    else
        echo $(echo "scale=2; ($est_time-$spt_time)*100/$est_time"|bc)
    fi
}

function getEstimatedtime()
{
	# echo "getEstimatedtime"
    if [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.issue_id = i.id and i.project_id = $1 and t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2 
	    # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id;")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
	    # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id and i.project_id = $3;")|awk '{printf "%.1f\n",$0}');
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
    if [ $# -eq 1 ];then
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
    if [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.issue_id = i.id and i.project_id = $1 and t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01' and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id and i.project_id = $3 and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
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
    if [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t, issues as i where t.project_id = $1 and t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01' and t.issue_id = i.id and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t, issues as i where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
        # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(t.hours) from time_entries as t, issues as i where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and i.project_id = $3 and t.issue_id = i.id and (i.status_id=3 or i.status_id=5 or status_id=6);")|awk '{printf "%.1f\n",$0}');
    fi
    if [ $time = "0.0" ];then
        echo "";
    else
        echo $time;
    fi

}

function getPersonalEstimatedTime
{
    if [ $# -eq 1 ];then
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.issue_id = i.id and t.user_id = $1 and t.spent_on >= '2013-04-01' and t.spent_on < '2014-04-01';")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 2 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id;")|awk '{printf "%.1f\n",$0}');
    elif [ $# -eq 3 ];then
        getEndDay $1 $2
            # echo "$start_year:$start_month - $end_year:$end_month"
        time=$(echo $(mysql -u root -p$MYSQL_PASSWD -D bitnami_redmine -BN -e "select sum(i.estimated_hours) from issues as i, time_entries as t where t.spent_on >= '$start_year-$start_month-01' and t.spent_on < '$end_year-$end_month-01' and t.issue_id = i.id and t.user_id = $3;")|awk '{printf "%.1f\n",$0}');
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
    if [ $# -eq 1 ];then
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

# Get project names and ids. There is an issue if the project name contains space 
initProjects;

# Start the generate the time report into a html file
echo "" > $REPORT_FILE
# echo "<link href=\"/redmine/stylesheets/application.css?1363725157\" media=\"all\" rel=\"stylesheet\" type=\"text/css\" />" >> $REPORT_FILE

################################## Start Generate the table heads which are named as YY-MM ####################################
echo "<h2> Service Dev Work Time Statisics in FY2013 </h2>" >> $REPORT_FILE
echo "<div class=\"autoscroll\">" >> $REPORT_FILE
echo "<table class=\"list\" id=\"time-report\">" >> $REPORT_FILE
echo "<thead>" >> $REPORT_FILE
echo "<tr>" >> $REPORT_FILE
echo "  <th>Projects</th>" >> $REPORT_FILE
num_months=${#months[@]}
# echo "num_months=$num_months"
for (( i=0; i < num_months; i++ )); do
    echo "<th class=\"period\" width=\"8%\">${years[$i]}-${months[$i]}</th>" >> $REPORT_FILE
done
echo "  <th class=\"total\" width=\"8%\">Tobal</th>" >> $REPORT_FILE
echo "</tr>" >> $REPORT_FILE
echo "</thead>" >> $REPORT_FILE

#Get the table body
echo "<tbody>" >> $REPORT_FILE
num_Pojects=$projects_count
# echo "num_Porjects=$num_Pojects"
for (( i=0; i < projects_count; i++ )); do
    proj_spt_time=$(getSpenttime ${projects_ids[$i]})
    # echo "proj_spt_time_$i = $proj_spt_time"
    proj_est_time=$(getEstimatedtime ${projects_ids[$i]})
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
        est_time=$(getEstimatedtime ${years[$j]} ${months[$j]} ${projects_ids[$i]})
        # echo "est_time_$i_$j = $est_time"
        spt_time=$(getSpenttime ${years[$j]} ${months[$j]} ${projects_ids[$i]})
        rates[$j]=$(calcRates $spt_time $est_time);
        # echo "spt_time_$i_$j = $spt_time"
        if [ -z $est_time ] && [ -z $spt_time ];then
           echo "    <td class=\"hours\"></td>" >> $REPORT_FILE
        else
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
    monthly_spt_time=$(getSpenttime ${years[$i]} ${months[$i]});
    # echo "monthly_spt_time_$i = $monthly_spt_time"
    monthly_est_time=$(getEstimatedtime ${years[$i]} ${months[$i]});
    # echo "monthly_est_time_$i = $monthly_est_time"

    monthly_rates[$i]=$(calcRates $monthly_spt_time $monthly_est_time);

    if [ -z $monthly_spt_time ] && [ -z $monthly_est_time ]; then
        echo "<td class=\"hours\"></td>" >> $REPORT_FILE;
    else
        echo "<td class=\"hours\"><span class=\"hours hours-int\">$monthly_spt_time</span><span class=\"hours hours-dec\">[$monthly_est_time]=${monthly_rates[$i]}%</span></td>" >> $REPORT_FILE
    fi
done

echo "</tr>" >> $REPORT_FILE
echo "</tbody>" >> $REPORT_FILE
echo "</table>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
echo "<br>" >> $REPORT_FILE
###############################################################################################################################

############################# Generate the finished tasks work time report ####################################################

echo "<h2> Service Dev Finished Work Time Statisics in FY2013 </h2>" >> $REPORT_FILE
echo "<div class=\"autoscroll\">" >> $REPORT_FILE
echo "<table class=\"list\" id=\"time-report-2\">" >> $REPORT_FILE
# Generate the head of the table
echo "<thead>" >> $REPORT_FILE
echo "<tr>" >> $REPORT_FILE
echo "  <th>Projects</th>" >> $REPORT_FILE

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
        # echo "est_time_$i_$j = $est_time"
        spt_time=$(getClosedSpentTime ${years[$j]} ${months[$j]} ${projects_ids[$i]})

        rates[$j]=$(calcRates $spt_time $est_time);

        # echo "spt_time_$i_$j = $spt_time"
        if [ -z $est_time ] && [ -z $spt_time ];then
           echo "    <td class=\"hours\"></td>" >> $REPORT_FILE
        else
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

echo "</tr>" >> $REPORT_FILE
echo "</tbody>" >> $REPORT_FILE
echo "</table>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
echo "<br>" >> $REPORT_FILE
###############################################################################################################################


############################# Generate the personal tasks work time report ####################################################
initUsers

echo "<h2> Service Dev Developers' Personal Work Time Statisics in FY2013 </h2>" >> $REPORT_FILE
echo "<div class=\"autoscroll\">" >> $REPORT_FILE
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

echo "</tr>" >> $REPORT_FILE
echo "</tbody>" >> $REPORT_FILE
echo "</table>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE
echo "<br>" >> $REPORT_FILE
###############################################################################################################################

# Notes for the statistic table
echo "<hr>" >> $REPORT_FILE
 echo "<div>" >> $REPORT_FILE
echo "P.S.: <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The cell of the table means \"<font color=\"red\">Spent Time[Estimated Time]=(Estimated Time - Spent Time) / Estimated Time</font>. <br>" >> $REPORT_FILE
echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please connect <a href=\"mailto:bo5.zhang@sonymobile.com\">Zhang, Bo</a> if you need any support. <br>" >> $REPORT_FILE
echo "</div>" >> $REPORT_FILE

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
