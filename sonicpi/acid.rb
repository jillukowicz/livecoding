use_bpm 120
master = range(0.1, 1, 0.01).mirror
mod_range = range(0, 25, 1).mirror

synth_cutoffs = range(60, 100, 0.5).mirror

live_loop :bassorumpu do
  sample :bd_haus, amp: 2
  with_fx :gverb, room: mod_range.tick + 1 do
    sample :ambi_glass_hum, amp: 0.2
  end
  sleep 1
end


live_loop :acid do
  4.times do |i|
    use_random_seed 667
    16.times do |j|
      use_synth :tb303
      with_fx :reverb, room: i*0.1, damp: 0.5 do
        with_fx :slicer, phase: (i+1)*0.1, wave: 1, mix: 1.0 do
          with_fx :bitcrusher,  amp: 1 do
            c = (ring :C2, :C3, :r, :Eb3, :r, :G2, :Bb2, :r)
            play c.look, attack: 0, release: rrand(0.05, 0.3), cutoff: (line 70, 131, steps: 10).mirror.tick, pan: rrand(-0.5, 0.5)
            sleep 0.5
          end
        end
      end
    end
  end
end


live_loop :bar, auto_cue: false do
  print master.tick
  if rand < 0.25
    sample :ambi_lunar_land
    puts :comet_landing
  end
  sleep 8
end







