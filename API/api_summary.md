# API Summary

## What is REST API?

REST API is a way for two applications
to communicate over the internet using HTTP methods.
It allows applications to exchange data in JSON format.

## HTTP Status Codes

- 200: Request successful.
- 404: Requested resource not found.

## jq Filter

Filter used:

jq '{name:.name, repos:.public_repos,
followers:.followers, joined:.created_at}'

- name: Extracts GitHub profile name.
- repos: Extracts public repository count.
- followers: Extracts followers.
- joined: Extracts account creation date.
