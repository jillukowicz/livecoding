## dark house


## our mixer !
master = range(0,100)
room = 0.1;

live_loop :rummut do
  sample :bd_haus, amp: 1.5
  sleep 0.5
  sample :drum_bass_hard
  sleep 0.5
end

live_loop :hihat do
  if (spread 3, 8).tick then
    room = 1;
  else
    room = 0.1;
  end
  with_fx :krush, cutoff: rrand(30,100),  room: room, gain: room*5 do
    sample :glitch_bass_g
  end
  sleep 0.5
end