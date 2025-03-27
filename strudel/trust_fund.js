/* man in finance @by v10101a
   remix @by jillukowicz
*/

samples({
  finance:  ['man-in-finance/finance_00.wav']
}, 'github:sandpills/v10101a-samples/main/');

$: s("finance")
  .slice(sine.range(1,3), "<0 1 2 3>".every(2, rev))
  .slow(0.75)
  .mask("<0 1 0 1>/2")
  .room(mousey.range(.5,2))

$: n("0")
  .s("<gm_fx_atmosphere, sawtooth>")
  .mask("<1 0 1 0>")
  .clip(.8)
  .struct("1(<3,5>, 8)")
  .lpf(sine.range(200,1000))
  .gain(mousey.range(.1, .5))
  .room(mousex.range(.5,3))
  .attack(.2)
  .sustain(.8)
  .distort(sine.range(1,3))


$: n("0")
  .s("<gm_pad_poly>")
  .mask("<0 1 0 1>")
  .struct("1(<3,5>, 8)")
  .hpf(sine.range(200,1000))
  .gain(mousey.range(.1, .5))
  .room(mousex.range(.5,3))
  .attack(.2)
  .sustain(.8)
  .distort(sine.range(1,3))

$: n("<0 2 1 3 2>*8")
  .scale("<A1 D2>/4:minor:pentatonic")
  .s("gm_koto")
  .lpf(mousex.range(1500, 2000))
  .lpenv("<40 30 20>")
  .gain(mousey.range(.4, 1.2))
  .release(.8)

$: s("bd*4")
  .distort(mousey.range(.5, 2))
  .lpf(mousex.range(300,1000))
  .transpose(mousey.range(1,20))

$: s("hh*4")
  .room(mousey.range(2,.4))
  .distort(.3)
  .bpf(500)
  .bpq(0)
  .mask("<0 1 0 1>/2")
