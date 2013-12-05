import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
             [ className =? "Gimp"  --> doFloat
             ]

main = do
     xmproc <- spawnPipe "/usr/bin/xmobar /home/piisalie/dotfiles/xmobarrc"
     xmonad $ defaultConfig {
            terminal          = "terminator",
            modMask           = mod4Mask,
            borderWidth       = 1,
            focusFollowsMouse = False,
            manageHook        = manageDocks <+> myManageHook
                                <+> manageHook defaultConfig,
            layoutHook        = avoidStruts  $  layoutHook defaultConfig,
            logHook           = dynamicLogWithPP xmobarPP {
                              ppOutput = hPutStrLn xmproc,
                              ppOrder  = \(ws:_:t:_) -> [ws,t],
                              ppTitle  = xmobarColor "orange" "" . shorten 50
                              }
            }