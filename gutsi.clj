; See the file "gutsi.pl" for more info.
(ns logic-playground
  (:refer-clojure :exclude [==])
  (:use [clojure.core.logic])
  (:require [clojure.core.logic.fd :as fd]))

(defrel digit x)
(facts digit (map vector (range 10)))

; TODO This isn't pretty at all and very inefficient. Better solution?
(defn sum [a1 a2 b1 b2 s1 s2]
  (fresh [a b s a10 b10 s10]
    (fd/* 10 a1 a10) (fd/+ a10 a2 a)
    (fd/* 10 b1 b10) (fd/+ b10 b2 b)
    (fd/* 10 s1 s10) (fd/+ s10 s2 s)
    (fd/+ a b s)))
(defn diff [a1 a2 b1 b2 s1 s2]
  (fresh [a b s a10 b10 s10]
    (fd/* 10 a1 a10) (fd/+ a10 a2 a)
    (fd/* 10 b1 b10) (fd/+ b10 b2 b)
    (fd/* 10 s1 s10) (fd/+ s10 s2 s)
    (fd/- a b s)))

; Naive, inefficient translation from Prolog. Takes quite long (> 1 min).
(run* [q]
  (fresh [he le br st mo ma]
    (digit he) (digit le) (digit br) (digit st) (digit mo) (digit ma)
    (fd/distinct [he le br st mo ma])
    (sum he he le br st mo)
    (sum ma le 0 he ma st)
    (sum br le br he ma st)
    (diff he he ma le br le)
    (diff le br 0 he br he)
    (diff st mo ma st ma st)
    (== q [he le br st mo ma])))

; ([6 3 2 9 8 4])
