live_loop :acid do
  cue :foo
  4.times do |i|
    use_random_seed 667
    16.times do |j|
      use_synth :tb303
      with_fx :reverb, room: 0.9 do
        with_fx :slicer, phase: 0.25, wave: 0, mix: 1.0 do
          play chord(:d3, :minor).choose, attack: 0, release: 0.1, cutoff: rrand_i(50, 90) + j * 2
          sleep 0.125
        end
      end
    end
  end
end
