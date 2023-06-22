#!/bin/bash

# Start PostgreSQL 14
function start_postgresql {
    if pg_isready &>/dev/null; then
        echo "PostgreSQL 14 is already running."
    else
        brew services start postgresql@14
        echo "PostgreSQL 14 is running!"
    fi
}

# Stop PostgreSQL 14
function stop_postgresql {
    brew services stop postgresql@14
    echo "PostgreSQL 14 has been stopped."
}

# Check PostgreSQL status
function check_postgresql_status {
    if pg_isready &>/dev/null; then
        echo "PostgreSQL 14 is running."
    else
        echo "PostgreSQL 14 is not running."
    fi
}

# Parse command line arguments
case "$1" in
    start)
        start_postgresql
        ;;
    stop)
        stop_postgresql
        ;;
    status)
        check_postgresql_status
        ;;
    *)
        echo "Usage: $0 { start | stop | status }"
        exit 1
        ;;
esac
