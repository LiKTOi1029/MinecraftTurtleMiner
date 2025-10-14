# MinecraftTurtleMiner

**HEADS UP! THIS BOT WORKS, BUT NOT ALL FEATURES HAVE BEEN IMPLEMENTED**

## About This Project
This is the minecraft turtle miner that I originally started as a little personal project of mine that has grown dramatically into one of my 
largest projects to date. I will be posting my updates on github from now on because I was looking for a script like this about 3 years ago 
and found none. That's why I am not only uploading it to GitHub but also I will make it open source. Have fun!

## Installation

Please use the command `wget https://github.com/LiKTOi1029/MinecraftTurtleMiner/raw/refs/heads/main/miner.lua` to obtain `miner.lua`.
This script also required another script which is also included in this repository called `RCS.lua` and it is responsible for using 
an X,Y,Z coordinates system without the GPS feature of cc tweaked. You can think of it like budget GPS for the turtle to know where it is 
relative to wherever you first ran RCS. Additionally, whatever other scripts that also use RCS are perfectly cross-compatible with 
other scripts using the same system. Simply install it by `wget https://github.com/LiKTOi1029/MinecraftTurtleMiner/raw/refs/heads/development/RCS.lua` 

## Instructions

In the first 5 slots of the turtle, place 64 Torches, 64 Cobblestone, 64 Chests, 64 Chunkloaders, and 64 Coal blocks in no specific order. 
You should also make sure none of the other slots have anything in them. If they do, the turtle will throw an error as those slots are used 
as free storage. Another important note is this requires the [Chunkloader mod by Lordwissend](https://www.curseforge.com/minecraft/mc-mods/chunkloader-simple) 
to function properly. Otherwise, be prepared for a buggy experience. Please start the turtle at the desired y level underground, this turtle 
does not dig straight down, rather tunnels straight forward. This means that you can't just set it and forget it on the surface you have to go 
underground before running `miner.lua`.