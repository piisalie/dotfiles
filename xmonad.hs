import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
             [
	       className =? "Gimp"  --> doFloat,
               className =? "Xfce4-notifyd" --> doIgnore,
               className =? "google-chrome" --> doShift "9:Web",
               className =? "Steam" --> doShift "8:Game"
             ]
myWorkspaces = [ "1:Term", "2:Misc", "3", "4", "5", "6", "7", "8:Game", "9:Web"]
main = do
     xmproc <- spawnPipe "/usr/bin/xmobar /home/piisalie/dotfiles/xmobarrc"
     xmonad $ defaultConfig {
            terminal          = "terminator",
            modMask           = mod4Mask,
            borderWidth       = 1,
            focusFollowsMouse = False,
            manageHook        = manageDocks <+> myManageHook
                                <+> manageHook defaultConfig,
            layoutHook        = avoidStruts $ smartBorders $ layoutHook defaultConfig,
            logHook           = dynamicLogWithPP xmobarPP {
                              ppOutput = hPutStrLn xmproc,
                              ppOrder  = \(ws:_:t:_) -> [ws,t],
                              ppTitle  = xmobarColor "orange" "" . shorten 50
                              },
            workspaces        = myWorkspaces
            }
