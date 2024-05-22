#!/usr/bin/python3
"""Using a REST API, for a given employee ID, returns information
about his/her TODO list progress
"""
import requests
import sys


if __name__ == '__main__':
    user_id = int(sys.argv[1])
    users = "https://jsonplaceholder.typicode.com/users"
    res = requests.get(users)
    r = res.json()
    for user in r:
        if user.get('id') == user_id:
            name = user.get('name')

    todos = "https://jsonplaceholder.typicode.com/todos"
    res = requests.get(todos)
    r = res.json()
    complete = []
    total = 0
    for todo in r:
        if todo.get('userId') == user_id:
            total += 1
            if todo.get('completed'):
                complete.append(todo)

    print(f"Employee {name} is done with tasks({len(complete)}/{total}):")
    for todo in complete:
        print(f"\t {todo.get('title')}")
