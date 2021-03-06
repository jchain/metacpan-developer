#!/bin/bash

# Avoid confusion by giving th vagrant user the right perl.
function user_source_metacpanrc () {
  local user="$1"
  local home="/home/$user"
  local rc="$home/.metacpanrc" shrc="$home/.bashrc"
  local line="source $rc"

  test -f "$rc" || cat /home/metacpan/.metacpanrc > "$rc"
  grep -qFx "$line" "$shrc" || echo "$line" >> "$shrc"

  chown "$user" "$rc" "$shrc"
}

user_source_metacpanrc vagrant
