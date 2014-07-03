import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.StackTile
import XMonad.Layout.Magnifier

myLayout = avoidStruts $ smartBorders (
    Tall 1 (3/100) (2/3) |||
    magnifier (Tall 1 (3/100) (1/2))  |||
    Mirror (Tall 1 (3/100) (2/3)) |||
    StackTile 1 (3/100) (2/3) |||
    Full )

myManageHook = composeAll
             [
               isFullscreen                 --> doFullFloat,
               className =? "Gimp"          --> doFloat,
               className =? "Xfce4-notifyd" --> doIgnore,
               className =? "google-chrome" --> doShift "9:Web",
               className =? "Iceweasel"     --> doShift "9:Web",
               className =? "Steam"         --> doShift "8:Game",
               className =? "mpv"           --> doFloat
             ]
myWorkspaces = [ "1:emacs", "2:Term", "3:Misc", "4", "5", "6", "7", "8:Game", "9:Web"]
main = do
     xmproc <- spawnPipe "/usr/bin/xmobar /home/piisalie/dotfiles/xmobarrc"
     xmonad $ defaultConfig {
            terminal          = "xterm",
            modMask           = mod4Mask,
            borderWidth       = 1,
            focusFollowsMouse = False,
            manageHook        = manageDocks <+> myManageHook
                                <+> manageHook defaultConfig,
            layoutHook        = myLayout,
            logHook           = dynamicLogWithPP xmobarPP {
                              ppOutput = hPutStrLn xmproc,
                              ppOrder  = \(ws:_:t:_) -> [ws,t],
                              ppTitle  = xmobarColor "orange" "" . shorten 50
                              },
            workspaces        = myWorkspaces
            }
