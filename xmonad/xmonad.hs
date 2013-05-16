import XMonad
import XMonad.Core

import XMonad.Actions.CycleWS

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps

import Graphics.X11.ExtraTypes.XF86

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import qualified Data.Map as M
import XMonad.StackSet as W
 
myFocusFollowsMouse = False

myBitmapsDir = "~/icons/dzen/"

myWorkspaces = ["emacs","urxvt","web","media"] ++ map show [5..9]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#82a3bf"


myKeys x =
    [ 
     ((mod1Mask .|. controlMask, xK_l), spawn "xlock"  )
    , ((mod1Mask .|. controlMask, xK_h), spawn "thunar")
    , ((mod1Mask .|. controlMask, xK_i), spawn "firefox")

    , ((mod1Mask .|. controlMask, xK_t), spawn $ XMonad.terminal x)
 
    -- launch dmenu
    , ((mod4Mask, xK_o     ), spawn "exe=`dmenu_path | dmenu -b` && eval \"exec $exe\"")

    , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")

    , ((0, xK_Print), spawn "scrot")
--    , ((modMask,                    xK_b        ), sendMessage ToggleStruts)
    , ((0, xF86XK_AudioMute), spawn "amixer -q set PCM toggle")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set PCM 2+")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set PCM 2-")


    , ((mod1Mask, xK_F4                         ), kill)

    , ((mod4Mask, xK_q     ), spawn "killall conky dzen2 && xmonad --recompile && xmonad --restart")

    , ((mod1Mask .|. controlMask,   xK_Right    ), nextWS)
    , ((mod1Mask .|. shiftMask,     xK_Right    ), shiftToNext)
    , ((mod1Mask .|. controlMask,   xK_Left     ), prevWS)
    , ((mod1Mask .|. shiftMask,     xK_Left     ), shiftToPrev)

--    ,("M-<Right>"  , withFocused $ snapMove R Nothing  )
    ]
 
newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

myStatusBar = "dzen2 -w 1166 -y 0 -h 24 -ta l -fn terminus"

staticOptions = "dzen2 -w 683 -y 744 -h 24 -ta l -fn terminus"
bottomRightOptions = "dzen2 -x 683 -w 683 -y 744 -h 24 -ta r -fn terminus"

myStaticBar = "conky -c ~/conky_bl_static | " ++ staticOptions
myBottomRightBar = "conky -c ~/conky_br | " ++ bottomRightOptions

myTime = "conky -u 1 -t '^i(/root/icons/dzen/clock.xbm) ^fg(orange)${time}' | dzen2 -fn terminus -ta tr -x 1190 -h 24"


--{{{ Hook for managing windows
myManageHook = composeAll
   [ resource  =? "Do"               --> doIgnore,              -- Ignore GnomeDo
--     className =? "urxvt"           --> doShift "urxvt",      -- Shift Pidgin to im desktop 
     className =? "Chrome"           --> doShift "web",     -- Shift Chromium to www
     className =? "Firefox"          --> doShift "web",     -- Shift Firefox to www
     className =? "Emacs"            --> doShift "emacs",      -- Shift emacs to emacs
--     className =? "Wicd-client.py"   --> doFloat,                -- Float Wicd window 
     isFullscreen 		     --> (doF W.focusDown <+> doFullFloat)
   ]
--}}}


main = do
--  xmproc <- spawnPipe "/usr/bin/xmobar /root/.xmonad/xmobarrc"
  dzenTopBar <- spawnPipe myStatusBar
  dzenBottomBar <- spawnPipe myStaticBar
  dzenBottomRightBar <- spawnPipe myBottomRightBar
  dzenTime <- spawnPipe myTime
-- above is uggggllly
  xmonad defaultConfig {
    focusFollowsMouse  = myFocusFollowsMouse,
    modMask = mod4Mask, 
    terminal = "urxvt",
    keys = newKeys,
    XMonad.Core.workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
--    handleEventHook    = fullscreenEventHook,
    manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
    layoutHook = avoidStruts $ layoutHook defaultConfig,
    logHook  = myLogHook dzenTopBar }-- >> fadeInactiveLogHook 0xdddddddd  >> setWMName "LG3D"}
--    logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn xmproc,ppTitle = xmobarColor "red" "" . shorten 50}}

-- dzen2 -w 1366 -y 744 -h 24 -ta c

-- Bar
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    {
        ppCurrent           =   wrapFgBg  "#ebac54" "#161616" -- . pad
      , ppVisible           =   dzenColor "white" "#161616" . pad
      , ppHidden            =   dzenColor "white" "#161616" . pad
      , ppHiddenNoWindows   =   dzenColor "#444444" "#161616" . pad
      , ppUrgent            =   dzenColor "red" "#161616" . pad
      , ppWsSep             =   " "
      , ppSep               =   "  |  "
{-
      , ppLayout            =   dzenColor "#ebac54" "#161616" .
                                (\x -> case x of
                                    "ResizableTall"             ->      "^i(" ++ myBitmapsDir ++ "/tall.xbm)"
                                    "Mirror ResizableTall"      ->      "^i(" ++ myBitmapsDir ++ "/mtall.xbm)"
                                    "Full"                      ->      "^i(" ++ myBitmapsDir ++ "/full.xbm)"
                                    "Simple Float"              ->      "~"
                                    _                           ->      x
                                )
-}
      , ppTitle             =   (" " ++) . dzenColor "#d3b96b" "#161616" . dzenEscape
      , ppOutput            =   hPutStrLn h
    }
  where
    wrapFgBg fgColor bgColor content= wrap ("^fg(" ++ fgColor ++ ")^bg(" ++ bgColor ++ ")") "^fg()^bg()" ("^fg(#4d5d9d)[^fg(#e5786d)" ++ content ++ "^fg(#4d5d9d)]")

{- my 80s colors
#d09562 /*orange pastel, delimiter */
#e5786d /*pinkish, constant */
#a7b367 /*dull green, string */
#373b41 /*dull grey/black, background */
#25292c /*duller grey, background */
#ba9ac2 /*purplish, function */
#e7f6da /*whitish matte, special */
#d56c69 /*matte red, identifier */
#f6f3e8 /*white again, visual */
#d3b96b /*yellow dull (skin), name */
#4d5d9d /*bluish, probably right one */
#82a3bf /*blue matte its nice, region */
#92b3c8 /*bluish again, htmltag */
#c3a2cc /*purple again, html */
#afb0ae /*silver, cursor, type nice for letters, not really */
-}