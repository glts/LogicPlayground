;; Friedman, Byrd, Kiselyov. 2005. The reasoned schemer.

;; Chapter 2

(define caro
  (lambda (l a)
    (fresh (d)
      (== (cons a d) l))))

(define cdro
  (lambda (l d)
    (fresh (a)
      (== (cons a d) l))))
