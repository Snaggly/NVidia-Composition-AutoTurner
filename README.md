# NVidia-Composition-AutoTurner
Script to automatically turn on or off ForcedCompositionPipline within NVidia Settings for GNU/Linux

All games I tried using Wine/DXVK already have VSync enabled preventing screen tearing. Having turned on ForcedCompositionPipline within NVidia's settings at the same time seems to be generating a needless overhead. I experienced certain games running much worse. I've found microstutters and in sometimes significant FPS drops.

This script can be used within Lutris' System options to execute before a game launches and after it closes. That way NVidia's FCP will be automatically off only while you're playing. 

---
## Example with FCP kept on

![FCPOn](https://github.com/Snaggly/NVidia-Composition-AutoTurner/raw/master/FCP-On.gif)

## Emaple with FCP turned off

![FCPOff](https://github.com/Snaggly/NVidia-Composition-AutoTurner/raw/master/FCP-Off.gif)

(Game: Megadimension Neptunia VIIR, Idea Factory/Compile Heart)

# Useage
On Lutris under System options, simply add the path to DisableFCP.sh script to Pre-launch script to disable FSC when a game launches. Add the path to EnableFCP.sh script to Post-exit script to reenable ForceCompositionPiple on game exit. Be sure That both scripts correctly reference the path to NVidiaFCP.sh. I've placed mine right under home. To renable ForceFullCompositionPipline change the passing arguments of EnableFCP.sh from "On" to "On Full". The script may looks like this: "~/NVidiaFCP.sh On Full".
