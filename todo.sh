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

function print_help() {
	echo "	Type in 1 for printing your tasks"
	echo "	Type in 2 for adding a task"
	echo "	Type in 3 for deleting a task"
	echo "	Type in 4 for printing help"
	echo "	Type in 99 for exiting the program"
}

print_help

while true
do
	echo -n "Type in what you want to do: "
	read choice

	case $choice in
		1)
			print_tasks
			;;
		2)
			add_task
			;;
		3)
			delete_task
			;;
		4)
			print_help
			;;
		99)
			break
			;;
		*)
			echo "No correct option, printing help"
			print_help
			;;
	esac
done
