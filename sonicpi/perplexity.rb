# Code generated with Perplexity
# Prompts:
# - Generate a melody part using minor_pentatonic scale and add a percussion rhythm part in Sonic Pi
# - Could you vary the code with some fx effects?
# SR 05.09.2024
# Sources:
# - https://in-thread.sonic-pi.net/t/playing-with-chatgpt-and-sonic-pi/7803/3
#
# File: ai_perplexity_minor_pentatonic.txt
use_bpm 120

# Define the minor pentatonic scale
my_scale = [:a3, :c4, :d4, :e4, :g4, :a4]

# Melody part with reverb and occasional distortion
live_loop :melody do
  use_synth :piano
  with_fx :reverb, room: 0.7 do
    with_fx :distortion, distort: 0.3, amp: 0.6 do
      4.times do
        play my_scale.choose, release: 0.3
        sleep 0.5
      end
      
      play my_scale.choose, release: 1
      sleep 1
    end
  end
end

# Bass part with wobble effect
live_loop :bass do
  use_synth :fm
  with_fx :wobble, phase: 0.375, wave: 0 do
    play :a2, release: 4, amp: 0.5
    sleep 4
  end
end

# Percussion rhythm part with slicer effect
live_loop :drums do
  with_fx :slicer, phase: 0.25, wave: 1, mix: 0.5 do
    sample :drum_heavy_kick
    sleep 1
    
    sample :drum_snare_hard
    sleep 1
    
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_heavy_kick
    sleep 0.5
    
    sample :drum_snare_hard
    sleep 1
  end
end

# Hi-hat pattern with echo effect
live_loop :hihat do
  with_fx :echo, phase: 0.125, decay: 2 do
    sample :drum_cymbal_closed, amp: 0.5
    sleep 0.25
  end
end

# Ambient pad with ring modulator
live_loop :pad do
  use_synth :hollow
  with_fx :ring_mod, freq: 30 do
    play chord(:a3, :minor), release: 8, amp: 0.3
    sleep 8
  end
end