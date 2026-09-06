# Sephellive Ballistics Workshop

Test harness for developing a custom ballistics system on top of S.T.A.L.K.E.R. Anomaly.

This addon is meant to be a separate sandbox, not part of the shared content-removal bundle. It gives you:

- a main menu entry called `Test Fake Start`;
- a scripted launch path for your Fake Start test session;
- an immortal workshop NPC target for repeatable shooting tests;
- hit telemetry so you can see what got hit and how much damage landed.

Requirements

- S.T.A.L.K.E.R. Anomaly 1.5.3
- [Sephellive Anomaly Content Policy Core](https://github.com/sephellive/sephellive-anomaly-content-policy-core)
- Anomaly Modded Exes when you want DLTX and the extra script callbacks used by the workshop

What it does

- injects a `Test Fake Start` button into the main menu;
- launches the normal new-game flow from that button;
- on `fake_start`, spawns `sep_ballistics_workshop_dummy` as a target NPC;
- makes that NPC ignore incoming hit power so you can test ballistic behavior safely;
- draws a debug sphere and pushes an on-screen message every time the target gets hit.

How to use

1. Install the addon on top of the core content-policy repo.
2. Start the game and open the main menu.
3. Press `Test Fake Start`.
4. Shoot the workshop dummy and read the hit report.

If your level name or spawn chain is different from the current `fake_start` convention, edit `gamedata/scripts/sep_ballistics_workshop_autoload.script` and change `target_level`, `target_section`, or the startup command to match your setup.

This repository only contains my original workshop code and configuration glue. It does not grant rights to game assets.

Build

Run:

```powershell
./tools/build.ps1 -Version v0.0.5
```

The archive is written to `dist/` and contains only `gamedata/`, matching the GitHub release layout.
