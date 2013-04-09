{- additional parameters: none

Same as OctaveBuzz1.hs, this time with an EXPON envelope.

-}
module OctaveBuzz1 where

import Csound.Base

instr :: (D, D) -> Sig
instr (amp, fqc) = buzz env (kr fqc) nH sine
    where nH  = kr $ intD (sampleRate / (2 * fqc))
          env = expseg [amp, idur, 0.0001]
              
fqcs = [55, 110, 440, 1760, 3520, 7040]

note fqc = 2 *| temp (0.5, fqc)

res = sco instr $ line $ fmap note fqcs

main = writeCsd "tmp.csd" res

