;; Code-along with Friedman/Byrd/Kiselyov, The reasoned Schemer, 2005.

(load "mk.scm")
(load "mkextraforms.scm")

;; Chapter 1

;; The Law of Fresh (p. 7)
;; If x is fresh, then (== v x) succeeds and associates x with v.

;; The Law of == (p. 7)
;; (== v w) is the same as (== w v).

;; The Law of conde (p. 12)
;; To get more values from conde, pretend that the successful conde line has
;; failed, refreshing all variables that got an association from that line.

(define teacupo
  (lambda (x)
    (conde
      ((== 'tea x) succeed)
      ((== 'cup x) succeed)
      (else fail))))

;; Chapter 2

(define conso
  (lambda (a d l)
    (== (cons a d) l)))

(define caro
  (lambda (l a)
    (fresh (d)
      (conso a d l))))  ; was (== (cons a d) l)

(define cdro
  (lambda (l d)
    (fresh (a)
      (conso a d l))))

(define nullo
  (lambda (l)
    (== '() l)))

(define eqo
  (lambda (x y)
    (== x y)))
; or rather: (define eqo ==)

; memento:
; (cons 'a (cons 'b '()))   => (a b), a proper list
; (cons 'a (cons 'b 'c))    => (a b . c), an improper list

(define pairo
  (lambda (p)
    (fresh (a d)
      (conso a d p))))

;; Chapter 3

(define listo
  (lambda (l)
    (conde
      ((nullo l) succeed)
      ((pairo l) (fresh (d)
                   (cdro l d)
                   (listo d)))
      (else fail))))

;; The First Commandment (p. 28)
;; To transform a function whose value is a Boolean into a function whose
;; value is a goal, replace cond with conde and unnest each question and
;; answer. Unnest the answer #t (or #f) by replacing it with #s (or #u).

(define lolo
  (lambda (l)
    (conde
      ((nullo l) succeed)
      ((fresh (a)
         (caro l a)
         (listo a))
       (fresh (d)
         (cdro l d)
         (lolo d)))
      (else fail))))

(define twinso
  (lambda (l)
    (fresh (x)
      (== `(,x ,x) l))))

(define listofo
  (lambda (predo l)
    (conde
      ((nullo l) succeed)
      ((fresh (a)
         (caro l a)
         (predo a))
       (fresh (d)
         (cdro l d)
         (listofo predo d)))
      (else fail))))

(define loto
  (lambda (l)
    (listofo twinso l)))

(define eq-caro
  (lambda (l x)
    (caro l x)))
(define membero
  (lambda (x l)
    (conde
      ((eq-caro l x) succeed)
      (else
        (fresh (d)
          (cdro l d)
          (membero x d))))))

(define identity
  (lambda (l)
    (run* (x)
      (membero x l))))
