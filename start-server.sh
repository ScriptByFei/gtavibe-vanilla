#!/bin/bash
cd /home/masgi_bot/Apps/gtavibe-vanilla
tmux kill-session -t gtavibe-server 2>/dev/null
tmux new-session -d -s gtavibe-server 'npx serve -p 3001 -s .'
echo "Server running at http://192.168.178.164:3001"
