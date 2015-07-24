# Decide between test runners
kiptest() { 
    testargs=$*
    # Remove doc thing because this is easier
    # than actually modifying the plugin
    testwithoutdocs=$(echo $testargs | sed 's/--doctest-tests //')
    if [[ $testwithoutdocs =~ .*Simple.* ]]; then
        testrunner=scripts.test_runner.FastTestRunner
    else
        testrunner=django_nose.NoseTestSuiteRunner
    fi
    b2d && dcr inside_container
    if inside_container; then
        echo 'inside';
    else
        echo 'not inside';
    fi
    #b2d && dcr python manage.py test --testrunner=$testrunner $testwithoutdocs
}

inside_container() {
    if [[ -f /proc/1/cgroup/ ]]; then
        return 0
    else
        return 1
    fi
}
