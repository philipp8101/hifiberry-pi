#!/bin/bash
while ! nc -z localhost 8096; do
  sleep 1
done
