import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.StackTile
import XMonad.Layout.Magnifier


myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
     where fadeAmount = 1.0

myLayout = avoidStruts $ smartBorders (
    Tall 1 (3/100) (2/3) |||
    StackTile 1 (3/100) (2/3) |||
    Full |||
    magnifier (Tall 1 (3/100) (1/2)) )

myManageHook = composeAll
             [
               isFullscreen                    --> doFullFloat,
               className =? "Gimp"             --> doFloat,
               className =? "Xfce4-notifyd"    --> doIgnore,
               className =? "google-chrome"    --> doShift "9:Web",
               className =? "Iceweasel"        --> doShift "9:Web",
               className =? "Steam"            --> doShift "8:Game",
               className =? "mpv"              --> doFloat,
               className =? "Civ5XP"           --> doFullFloat,
               title     =? "Cities: Skylines" --> doFullFloat
             ]
myWorkspaces = [ "1:emacs", "2:Term", "3:Misc", "4", "5", "6", "7", "8:Game", "9:Web"]
main = do
     xmproc <- spawnPipe "/usr/bin/xmobar /home/piisalie/dotfiles/xmobarrc"
     xmonad $ ewmh defaultConfig{
            terminal          = "uxterm",
            modMask           = mod4Mask,
            borderWidth       = 1,
            focusFollowsMouse = False,
            manageHook        = manageDocks <+> myManageHook
                                <+> manageHook defaultConfig,
            layoutHook        = myLayout,
            logHook           = dynamicLogWithPP xmobarPP {
                              ppOutput = hPutStrLn xmproc,
                              ppOrder  = \(ws:_:t:_) -> [ws,t],
                              ppTitle  = xmobarColor "green" "" . shorten 50
                              } <+> myLogHook,
            workspaces        = myWorkspaces
            }
