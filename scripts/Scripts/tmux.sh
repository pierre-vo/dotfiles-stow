set TERM=xterm-256color
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (env TERM=xterm-256color tmux attach || env TERM=xterm-256color tmux new-session -n MainW -s MainS)
fi

