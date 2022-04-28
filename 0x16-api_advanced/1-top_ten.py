#!/usr/bin/python3

"""Queries the Reddit API and prints the titles of
the first 10 hot posts listed for a given subreddit
"""
import requests


def number_of_subscribers(subreddit):
    """Makes a GET request to the reddit API
    and prints the titles of the first 10 hot posts
    listed for a given subreddit
    """

    headers = {"User-Agent": "Custom"}
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
