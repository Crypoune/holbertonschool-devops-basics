#!/usr/bin/env bash

ping -c 4 "$(ip -br -4 addr show scope host | head -n 1 | tr -s ' ' | cut -d ' ' -f3 | cut -d '/' -f1)"
