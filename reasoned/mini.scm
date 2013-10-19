;; Code-along with Friedman/Byrd/Kiselyov, The reasoned schemer, 2005.

;; Chapter 1

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
