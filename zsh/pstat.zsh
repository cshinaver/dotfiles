# PolicyStat env variables and aliases
#

export PSTAT_DEPLOY=~/pstat_deploy
export VAGRANT_VBOX_GUI=1
export PSTAT_DIR=~/Documents/PolicyStat
export POLICY_STAT_DIR=~/Documents/PolicyStat
export VAGRANT_DEFAULT_PROVIDER='virtualbox'
export VAGRANT_VBOX_MEMORY=2048
export PSTAT_HIDE_DEBUG_TOOLBAR='YES'
export HIPCHAT_AUTH_TOKEN=HcPoLv4MDHljGp3RoEJ16A5CLGBOKCVhKDiEqB3o

alias vserver="cd $POLICY_STAT_DIR && vagrant ssh dev -c 'gnome-terminal -x ~/PolicyStat/pstat/manage.py runserver'"
alias vcelery="cd $POLICY_STAT_DIR; vagrant ssh dev -c 'gnome-terminal -x ~/PolicyStat/pstat/manage.py celeryd -Q celery_medium --concurrency 2 --loglevel=DEBUG'"
alias vssh="ssh -t dev"
alias vcd="cd $POLICY_STAT_DIR"
alias vup="vcd; vagrant up dev"
alias vhalt="vcd; vagrant halt dev"
alias vsh="vcmd python pstat/manage.py shell_plus"

alias vbash="docker run -t -i --link mysql:mysql --link redis:redis -v $POLICY_STAT_DIR:/home/vagrant/PolicyStat cshinaver/policystat:dev_base bash"

if [[ -f virtualenvwrapper.sh ]]; then
    source virtualenvwrapper.sh
fi

vcmd () {
    cd $POLICY_STAT_DIR && vagrant ssh dev -c "cd /home/vagrant/PolicyStat/; $*"
}

vtest () {
    args=$(echo "$*" | sed "s:pstat/::")
    if [[ $args == *"selenium_test"* ]]
    then
        vssh "cd ~/PolicyStat/pstat && ~/PolicyStat/scripts/run_selenium_tests.py $args"
    else
        vssh "cd ~/PolicyStat/pstat && ~/PolicyStat/scripts/run_tests.py --django-sqlite $args"
    fi
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

# Completion
# Nosecomplete plugin with run_tests
autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

_nosetests_pstat()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=(`cd $POLICY_STAT_DIR/pstat && nosecomplete -s python ${cur} 2>/dev/null`)
}
complete -o nospace -F _nosetests_pstat vtest

# fix_site_status autocomplete
_fix_site_status()
{
    local current_word prev_word things_to_fix hosts queues
    current_word="${COMP_WORDS[COMP_WORD]}"
    prev_word="${COMP_WORDS[COMP_WORD-1]}"
    things_to_fix=$(grep 'echo.* \[.*\] ' $POLICY_STAT_DIR/scripts/fix_site_status.sh |
    sed 's/.*\[\(.*\)\].*/\1/' | sed 's/,//g')
    hosts=$(grep "p.*stat" ~/.ssh/config | awk '{print $2}')

    if [[ "${COMP_WORDS[1]}" == *"com"* ]]; then
        COMPREPLY=( $(compgen -W "${things_to_fix}" -- ${current_word}) )
    else
        COMPREPLY=( $(compgen -W "${hosts}" -- ${current_word}) )
    fi
}
complete -F _fix_site_status fix_site_status.sh
