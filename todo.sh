#!/bin/bash

filename="list.txt"

function print_tasks() {
	echo "Your tasks:"
	n=1
	while read line; do
		echo "Task $n : $line"
		n=$((n+1))
	done < $filename
}

function add_task() {
	echo -n "Type in task: "
	read task
	echo $task >> $filename
}

function delete_task() {
	echo -n "Type in id of task: "
	read id
	sed -i "${id}d" $filename
}



while true
do
	read choice
	if [ $choice = 1 ]
	then
		print_tasks
	else
		if [ $choice = 2 ]
		then
			add_task
		else
			if [ $choice = 3 ]
			then
				delete_task
			fi
		fi
	fi
done
