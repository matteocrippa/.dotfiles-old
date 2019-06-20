#!/bin/bash

alias | awk -F '[=]' '{print $1}'
