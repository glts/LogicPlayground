;; Code-along with Friedman/Byrd/Kiselyov, The reasoned schemer, 2005.

;; Chapter 1

(define teacupo
  (lambda (x)
    (conde
      ((== 'tea x) succeed)
      ((== 'cup x) succeed)
      (else fail))))

;; Chapter 2

(define caro
  (lambda (l a)
    (fresh (d)
      (== (cons a d) l))))

(define cdro
  (lambda (l d)
    (fresh (a)
      (== (cons a d) l))))
