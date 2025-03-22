# Set the tempo for a slow and relaxed pace
use_bpm 50

# --------------------------------------------
# Ethereal Pad Layer
# --------------------------------------------

# Use a live loop to create a soft, atmospheric pad with reverb
live_loop :ethereal_pad do
  with_fx :reverb, room: 0.9, mix: 0.6 do
    use_synth :hollow       # Use hollow synth for a spacious, airy sound
    play chord(:e3, :major), release: 8, cutoff: 80  # Play an E major chord with a long release
    sleep 8                   # Let the chord ring out for 8 beats
  end
end

# --------------------------------------------
# Subtle Arpeggiated Melody
# --------------------------------------------

# Use a live loop to create an arpeggiated melody with subtle notes and reverb
live_loop :arpeggio, sync: :ethereal_pad do
  with_fx :reverb, room: 0.8, mix: 0.6 do
    use_synth :prophet      # Warm, analog-sounding synth for the arpeggio
    4.times do               # Repeat 4 times for an arpeggiated effect
      play scale(:e3, :major).choose, release: 0.5, amp: 0.4  # Randomly choose a note from the E major scale
      sleep 0.5              # Sleep between notes in the arpeggio
    end
    sleep 4                  # Sleep for 4 beats before repeating
  end
end

# --------------------------------------------
# Bass Layer
# --------------------------------------------

# Add a subtle bass line with reverb for extra depth
live_loop :bass, sync: :ethereal_pad do
  with_fx :reverb, room: 0.9, mix: 0.5 do
    use_synth :fm           # Use FM synthesis for a deep bass sound
    play :e2, release: 2, cutoff: 60  # Play E2 with a long release
    sleep 4                  # Sleep for 4 beats (one bar)
  end
end

# --------------------------------------------
# Light Percussion Layer
# --------------------------------------------

# Light percussion to add minimal rhythmic texture with reverb
live_loop :light_percussion, sync: :ethereal_pad do
  with_fx :reverb, room: 0.7, mix: 0.4 do
    sample :drum_bass_hard, amp: 0.2, rate: 0.5  # Use a bass drum sample at a lower rate
    sleep 2                  # Sleep for 2 beats
  end
end

# --------------------------------------------
# Reverb Effect for Extra Space
# --------------------------------------------

# Additional global reverb effect on the entire piece (already applied individually in loops)
# Uncomment the following line to add overall reverb across all layers
# with_fx :reverb, room: 0.9, mix: 0.5 do
# end
