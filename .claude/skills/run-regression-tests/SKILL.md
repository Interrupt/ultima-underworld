---
name: run-regression-tests
description: "Build and run this uw1-pocketpc-decomp-cleanup repo's demo-script regression suite (./run-regressions.sh) and correctly wait for and interpret its results. Use any time code here needs verifying before a commit -- after a rename/extraction, a bug fix, or a header/global change. Also use if asked to explain why a regression run looks stuck or why its log stopped updating partway through."
---

## Context

`./run-regressions.sh` builds `build/uw_asan` and launches several
`demo_*.txt` scripts concurrently, each against its own isolated data
dir, racing each one against a 90s watchdog. It prints `Started: ...`
lines immediately, then (once everything finishes) `clean:`/`CRASH:`/
`TIMEOUT:` lines and a final `N/M clean` tally. Real run time for the
default suite is roughly a minute, not the watchdog's 90s ceiling.

## Pick suite size by risk

- **Default (no args, 6 scripts)** — pure rename/extraction with no
  header changes, no un-staticing, no behavior change. This is the
  common case for most `refactor-unnamed-function` passes.
- **Full 19-script suite** — anything riskier: un-staticing a global,
  widening a scalar into a backing array, touching a widely-called
  function, or any actual bug fix. Get the script list from
  `/tmp/scripts19.txt` if present, or `demos/demo_automap_note_test.txt
  demos/demo_click_female.txt demos/demo_critter_orbit_cardinal.txt
  demos/demo_critter_talk_test.txt demos/demo_critter.txt demos/demo_dungeon_room.txt
  demos/demo_inventory_container_item_click_test.txt
  demos/demo_inventory_container_torch_use_test.txt
  demos/demo_inventory_dropback_test.txt
  demos/demo_inventory_invalid_drop_test.txt
  demos/demo_inventory_open_bag_test.txt demos/demo_nested_container_test.txt
  demos/demo_object_test.txt demos/demo_objects.txt demos/demo_talk_death_deep.txt
  demos/demo_talk_explore.txt demos/demo_talk_full_conversation.txt
  demos/demo_talk_qa.txt demos/demo_talk_select.txt` otherwise.
- `demos/demo_automap.txt` is deliberately excluded from both by default (5+
  minutes, see the script's own comment) — only add it explicitly if
  specifically asked to.

## Launching correctly

**Critical gotcha, confirmed live twice:** `run-regressions.sh` is a
long-running foreground script. Launch it with the `Bash` tool's
`run_in_background: true` parameter directly on the command itself —
**do not** also append a shell `&` to the command and then run a
separate `echo`/follow-on in the same call. Appending `&` backgrounds
the script *inside* the shell the Bash tool is already treating as the
background job, so the Bash tool's own "command finished" notification
fires as soon as the wrapper shell returns (immediately), not when the
actual scripts finish — producing a false-early "exited with code 0"
notification while `uw_asan` processes are still running in the
background, unobserved. **Never use the `Monitor` tool for this either**
— `Monitor` is for recurring event streams, and `tail -f logfile |
grep ...` never exits on its own, so it just idles until its own
timeout and produces stale, out-of-order notifications.

Correct pattern:
```
./run-regressions.sh                              # default 6
./run-regressions.sh $(cat /tmp/scripts19.txt | tr '\n' ' ')   # full 19
```
passed as the entire command to `Bash` with `run_in_background: true`
and NO trailing `&`, redirected to a log file for your own reference:
```
./run-regressions.sh > /tmp/regress_passNNN.log 2>&1
```

## Confirming it's actually done

When the task-completion notification arrives, don't trust it blindly —
verify with the actual evidence, since a notification can still fire
early if something upstream double-backgrounded (has happened even with
the correct pattern above, depending on shell quoting). Check:

```
ps aux | grep -i uw_asan | grep -v grep     # empty = nothing still running
```

If processes are still running, poll instead of guessing:
```
while pgrep -f "build/uw_asan" > /dev/null; do sleep 3; done; echo "all finished"
```
run via `Bash` with `run_in_background: true` (this one-shot wait is a
legitimate use of backgrounding — it's a single command whose own exit
IS the signal, not a recurring stream, so it still isn't a `Monitor`
case). Do not use `ScheduleWakeup` for this either — that tool is only
for `/loop` dynamic-pacing mode, not for waiting on a background shell
command; a plain backgrounded `Bash` call already produces its own
completion notification.

Once truly idle, read the per-script result files directly rather than
relying on the log's printed tally (the tally print can itself be lost
to the same double-backgrounding quirk even when every script actually
finished clean):
```
for s in <script list>; do echo "$s: $(cat /tmp/regress_out/$s.result)"; done
```
Each should read `CLEAN 0`. Anything else (`CRASH ...`, `TIMEOUT ...`,
or a missing/stale `.result` file) means investigate before proceeding
— check `/tmp/regress_out/$s.log` for the actual crash output.

## Done condition

Every script in the suite you ran shows `CLEAN 0` in its `.result`
file, confirmed by either the printed tally or by reading the result
files directly when the tally is missing. Only then move on to staging
and committing.
