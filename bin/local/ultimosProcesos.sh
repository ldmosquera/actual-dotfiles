#!/bin/sh
exec ps -A -o ppid,pgrp,pid,command --sort=start
