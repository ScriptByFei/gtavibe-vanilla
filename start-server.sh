#!/bin/bash
# Start gtavibe dev server on port 3001
# Usage: ./start-server.sh

SESSION="gtavibe-server"
PORT=3001
DIR="/home/masgi_bot/Apps/gtavibe-vanilla"

# Kill existing on port 3001
fuser -k $PORT/tcp 2>/dev/null

# Kill existing tmux session
tmux kill-session -t $SESSION 2>/dev/null

# Start new tmux session
tmux new-session -d -s $SESSION "cd $DIR && npx --yes serve -l $PORT -s ."
sleep 2

# Check if running
if curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT/ | grep -q "200"; then
  echo "✓ Server running at http://192.168.178.164:$PORT"
  echo "  (also http://localhost:$PORT)"
  echo ""
  echo "To attach to tmux session: tmux attach -t $SESSION"
  echo "To stop: tmux kill-session -t $SESSION"
else
  echo "✗ Server failed to start. Check: tmux attach -t $SESSION"
fi
