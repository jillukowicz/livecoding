## dark house


## our mixer !
master = range(0,100).mirror

room = 0.1;

live_loop :drums do
  with_fx :lpf  do
    10.times do
      sample :bd_haus, amp: 1.5
      with_fx :reverb, room: master.tick/100, mix: master.tick/100 do
        sample :bd_haus
      end
      sleep 0.5
    end
  end
end

live_loop :glitch do
  if one_in(5) then
    room = 0.5;
  else
    room = 0.1;
  end
  with_fx :krush, cutoff: rrand(30,100),  room: room, gain: room*5 do
    sample :glitch_bass_g
  end
  sleep 0.5
end

live_loop :acid do
  4.times do |i|
    use_random_seed 667
    16.times do |j|
      use_synth :mod_dsaw
      with_fx :reverb, room: i*0.1, damp: 0.5 do
        with_fx :slicer, phase: (i+1)*0.1, wave: 1, mix: 1.0 do
          with_fx :krush,  amp: 1 do
            c = (ring :C1, :C1, :r, :Eb3, :r, :G2, :Bb2, :r).mirror
            play c.look, attack: rrand(0.05, 0.3), release: rrand(0.05, 0.3), cutoff: (line 70, 131, steps: 10).mirror.tick, pan: rrand(-0.5, 0.5)
            sleep 0.5
          end
        end
      end
    end
  end
end

live_loop :wobble, sync: :drums do
  use_synth :dark_ambience
  with_fx :echo do
    play :e3, release: 0.3, cutoff: master.tick, amp: 2
    sleep 1
    play :e3, release: 0.3, cutoff: 100-master.tick, amp: 2
    sleep 1
  end
end

live_loop :bass, sync: :drums do
  use_synth :tb303
  s = (scale :e1, :minor).mirror
  with_fx :reverb, room: 0.8 do
    play s, release: 0.5, cutoff: master.tick/2, amp: 2
  end
  sleep 0.5
  with_fx :tremolo do
    play s, release: 0.5, cutoff: 100-master.tick/2, amp: 2
    sleep 0.5
  end
end
