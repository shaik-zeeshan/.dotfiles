# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/dev"

pathname=$(pwd)

window_root "$pathname"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "dev"

# Split window into panes.
split_h 30

run_cmd "vim ." 1

select_pane 1
