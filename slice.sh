#!/bin/bash

cd minetest_game
git subtree split -P mods/$1 -b $1
git remote add $1 https://github.com/minetest-game/$1
git push $1 $1:master
