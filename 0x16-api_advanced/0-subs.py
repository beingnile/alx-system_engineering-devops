#!/usr/bin/python3

"""Returns the number of subscribers for a given subreddit"""

import requests


def number_of_subscribers(subreddit):
    """Makes a GET request to the reddit API
    and returns the number of subscribers for a given subreddit

    Returns:
        subscribers for a given subreddit
        0 if the subreddit does not exist
    """

    headers = {"User-Agent": "Custom"}
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    subscribers = requests.get(url, headers=headers)

    data = subscribers.json()
    subscribers = data["data"]["subscribers"]

    try:
        return subscribers
    except KeyError:
        if data["message"] == 'Not Found':
            return 0
