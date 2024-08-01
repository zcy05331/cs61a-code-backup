(define (ascending? s) 
    (if (null? s) 
        #t 
        (if (null? (cdr s)) 
            #t 
            (and (<= (car s) (car (cdr s))) (ascending? (cdr s))))))

(define (my-filter pred s) 
    (if (null? s) 
        '() 
        (if (pred (car s)) 
            (cons (car s) (my-filter pred (cdr s))) 
            (my-filter pred (cdr s)))))

(define (interleave lst1 lst2)  
    (cond   ((null? lst1) lst2)
            ((null? lst2) lst1)
            (else (cons (car lst1) (interleave lst2 (cdr lst1))))
    )
)
            

(define (no-repeats s) 
    (
        let (
            (search (lambda (x s) (my-filter (lambda (y) (= x y)) s)))
            )
        (
            cond ((null? s) nil)
                ((null? (search (car s) (cdr s))) (cons (car s) (no-repeats (cdr s))))
                (else (no-repeats (cdr s))) 
        )
    )
)
