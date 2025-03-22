-------------------- all the samples
hush
d1 $ striate 1 $ s "[sossnare, soshats/7, soskick/5, <super808!2>]"
d1 $ (striate 11 $ s "[alphabet:1 [alphabet:2, alphabet:3] ]") # decay 0.2  # delay 0.1 # distort 0.3 # accelerate 0.1
d1 $ chop "<16 128 32>" $ sound "arpy ~ feel*2 newnotes"
d1 $ stut' 3 (1/12) (|+ note "<5 7>") $ s "superpiano"
d1 $ note (scale "minor" $ snowball 4 (+) (slow 2) $ (run 3)) # sound "gtr" # gain 0.9 # delay 0.1 # distort 0.3 # accelerate 0.1

--wipeout
-- Kick and snare pattern
d1 $ sound "bd sn"
    # speed "1 1.5 1 2"
    # n "0 2 4 5"
    # pan "0.3 -0.3"
    # gain 1.3
-- Hi-hats and percussion
d2 $ sound "hh*8"
    # speed "1 1.25 0.75 1.5"
    # pan "-0.2 0.2"
    # gain 0.7

d3 $ sound "claps:2"
    # speed "1 1.5"
    # n "0 2 4 7"
    # pan "0.4"
    # gain 0.6
-- Bassline with some groove
hush
d4 $ sound "bass*8"
    # speed "1 0.9 1.1 1.2"
    # n "0 2 4 6 7 9 10 12"
    # gain 1.5
    # pan "-0.5"
-- Hi-hats and percussion
d2 $ sound "hh*8"
    # speed "1 1.25 0.75 1.5"
    # pan "-0.2 0.2"
    # gain 0.7

d3 $ sound "clap:2"
    # speed "1 1.5"
    # n "0 2 4 7"
    # pan "0.4"
    # gain 0.6
-- Glitchy sound effects to build tension
d7 $ sound "cpu:2*2" # speed "13.5 0.5 2" # n "0 2 4" # gain 0.9 # cut 2 # room 0.3
    # pan "-0.4"
hush

d7 $ "sound bsvocals:1" # speed "[4 1 1]"
-- Speed-up effect for build-up
d8 $ sound "dsynth:2" # speed "[2 1.5 2.5]"
    # gain 0.7
    # pan "0.2"
    # room 0.5
-- Transition (filter and glitch) into breakdown
d9 $ sound "filter"
    # speed "1.2"
    # n "0 3 6 7"
    # gain 0.5
    # room 0.3
    # pan "-0.6"

-- Adding a deep drone for breakdown
d10 $ sound "future*8"
    # speed "0.8 1.1"
    # n "22 44 66 18"
    # gain 0.9
    # pan "0.3"
    # room 0.7
    # sz 0.9
d1 $ sound "bd*1.5 [~ sn:3, bd!2]"
d1 $ every 2 (0.25 <~) $ sound "bd*3 sn*2"
d1 $ every 2 ("<0.25 0.125 0.5>" <~) $ sound "bd*2 [[~ lt] sn:3] lt:1 [ht mt*2]"
  # squiz "<1 2.5 2>"
  # room (slow 4 $ range 0 0.2 saw)
  # sz 0.5
  # orbit 1
hush

d1 $ jux rev $ every 2 (0.8 <~) $ sound "break:25" # room 0.5
d1 $ every 2 ("<0.25 0.125 0.5>" <~) $ sound "bd"
d2 $ jux rev $ n "3 1 2" # sound "bd" # squiz "<15 50 21 60 43 30>" # room 0.5 # orbit 1 # sz 0.5
d1 $ n (off 0.125 (|+ 12) $ off 0.125 (|+ 20) "300 30") # sound "bd sn"
d3 $ jux rev $ n (off 0.125 (|+ 7) "<c*2, a(3,8)>") # sound "supermandolin"
d1 $ jux rev $ n (off 0.125 (|+ 7)  "<c*2 a(3,8) f(3,8,2) e*2>") # sound "supermandolin" # legato 2
d4 $ every 2 (0.25 <~) $ sound "bd*2 [[~ lt] sn:3] lt:1 [ht mt*2]"
d1 $ every 2 (rot "<1 3 2>") $ s "cpu:1" # n "1 5 6 7 8 9"
d1 $ every 2 (rot "<1 3 2>") $ rev $ s "bd*3.5" # room 0.7  # room (slow 9 $ range 0 0.9 saw) # sz 0.9
d1 $ whenmod 5 3 (striate 3) $ stack [
  sound "bd bd*2",
  sound "hh*2 [sn cp] cp future*4",
  sound "arpy" +| n "0 .. 15"
] # speed "[[1 0.8], [1.5 2]*2]/3"

d1 $ off 0.25 (# vowel "<a o i>") $ juxBy 0.4 rev $ every 2 (rot "<1 3 2>") $ n "0 <0 4> [2 0] [2 3]" # sound "feel" # speed "1.75 2"

d1 $ n "a c a b" # sound "bd" # speed "1 2 30"
d1 $ n "0 <0 4> [2 0] [2 3]" # sound "feel" # speed "2 3 4 5 6 7 8"
d1 $ juxBy 0.4 rev $ every 2 (rot "<1 3 2>") $ n "0 <0 4> [2 0] [2 3]" # sound "feel" # speed "1.75 2"

d1 $ chunk 4 (|- note 5) $ jux rev $ arp "<pinkyup down thumbup up>" $ n "<c'maj'4 e4'min'8 f4'maj'4>" # sound "supermandolin" # sustain 2 # room 0.3 # sz 0.9





