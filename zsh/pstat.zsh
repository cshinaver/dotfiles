# PolicyStat env variables and aliases
#

export PSTAT_DEPLOY=~/pstat_deploy
export VAGRANT_VBOX_GUI=1
export PSTAT_DIR=~/Documents/PolicyStat
export POLICY_STAT_DIR=~/Documents/PolicyStat
export VAGRANT_DEFAULT_PROVIDER='virtualbox'
export VAGRANT_VBOX_MEMORY=4096
export PSTAT_HIDE_DEBUG_TOOLBAR='YES'
export HIPCHAT_AUTH_TOKEN=zTjH8o0B6HSsSy4CLNcakmD9pmpHcOOLyy0C9per

alias vserver="cd $POLICY_STAT_DIR && vagrant ssh dev -c 'gnome-terminal -x ~/PolicyStat/pstat/manage.py runserver'"
alias vcelery="cd $POLICY_STAT_DIR; vagrant ssh dev -c 'gnome-terminal -x ~/PolicyStat/pstat/manage.py celeryd -Q celery_medium --concurrency 2 --loglevel=DEBUG'"
alias vssh="ssh -t dev"
alias vcd="cd $POLICY_STAT_DIR"
alias vup="vcd; vagrant up dev"
alias vhalt="vcd; vagrant halt dev"
alias vsh="vcmd python pstat/manage.py shell_plus"

alias vbash="docker run -t -i --link mysql:mysql --link redis:redis -v $POLICY_STAT_DIR:/home/vagrant/PolicyStat cshinaver/policystat:dev_base bash"
source virtualenvwrapper.sh

vcmd () {
    cd $POLICY_STAT_DIR && vagrant ssh dev -c "cd /home/vagrant/PolicyStat/; $*"
}

vtest () {
   vssh "~/PolicyStat/scripts/run_tests.py --django-sqlite $1"
}
vstest () {
    vssh -c "~/PolicyStat/scripts/run_selenium_tests.py $1"
}
vworkflow () {
    vssh -c "cd ~/PolicyStat; ~/PolicyStat/scripts/workflow.py $1 $2"
}
alias current_test='vtest pstat.administration.tests.test_views:CategoryCSVDownloadTestCase.test_round_trip_with_data'
vrdb () {
    vssh -c "telnet localhost $1"
}
vdeploybeta () {
    vssh -c "cd ~/PolicyStat/pstat; fab deploy:beta active up"
}

docker_clean_containers () {
    # Stop and remove all docker containers
    docker stop $(docker ps -a -q)

    # Remove Docker containers
    sudo docker ps -a -q | xargs -n 1 -I {} sudo docker rm {}
}

docker_clean_all () {

    # Stop and remove all docker containers
    docker stop $(docker ps -a -q)

    # Remove Docker containers
    sudo docker ps -a -q | xargs -n 1 -I {} sudo docker rm {}

     
    # Remove Docker images
    sudo docker rmi $( sudo docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3)
}
