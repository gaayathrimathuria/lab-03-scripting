#!/usr/bin/env python3
import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'

def retrieve_events(url):
    """Retrieve event information dictionary from GitHub API"""
    events = json.loads(requests.get(url).text)
    return events

def print_events(events, n=5):
    """Print the first n events"""
    for event in events[:n]:
        eventn = event['type'] + '::' + event['repo']['name']
        print(eventn)

def main():
    """Script to print the value of GHUSER, url, and call print_event with list from GitHub API"""
    print(GHUSER)
    print(url)
    events = retrieve_events(url)
    print_events(events, 7)

if __name__ == '__main__':
        main()