;;    ___   ___ _ ____ _ ___ 
;;   / _ \ / __/ |__  / ( _ )
;;  | (_) | (__| | / /| / _ \
;;   \___/_\___|_|/_/ |_\___/
;;  |_ _/ __|_   _|          
;;   | |\__ \ | |            
;;  |___|___/ |_|  
;; 
;; Lab 3: Pipelining


;; The following program computes the compensated factorial of N-1, using a
;; fixed-point representation and the Perrin number for n = N+1. The
;; outcome values are stored in variables fibo and perrin, respectively.
;; 
;;   #define N 10
;;   double A[N-1] = {0, 1, 3, 0, 7, 0, 1, 5};
;;   int64 x = 2, y = 0, z = 3, perrin, fact = 1, i = 1;
;;   double *pA = &A[0];
;;
;;   do {
;;     perrin = y + z; z = y; y = x; x = perrin;
;;     fact = fact * i + *pA;
;;     i++;
;;     pA++;
;;   } while(i != N);
  	
  	 
        .data
fact:   .word    0x0
perrin:  .word    0x0
A:      .word    0, 1, 3, 0, 7
        .word    0, 1, 5

        .code
        daddi    $1, $0, A      ; $1 = Index for A
        daddi    $2, $0, 2      ; $2 = 2 ;; x
        daddi    $3, $0, 0      ; $3 = 0 ;; y
        daddi    $4, $0, 3      ; $4 = 3 ;; z
        daddi    $5, $0, 1      ; $5 = 1 ;; i	
        daddi    $6, $0, 10      ; $6 = N ;; N = 10
        daddi    $12, $0, 1     ; $12 = 1 ;; fact = 1

loop:   dadd     $7, $4, $3     ; $7 = perrin = z + y
        daddi    $3, $2, 0      ; $3 = y = x
        daddi    $2, $7, 0      ; $2 = x = perrin
        daddi    $4, $3, 0      ; $4 = z = y


        lw       $16, 0($1)     ; $16 = A[i-1]
        dmul     $12, $12, $5   ; $12 = fact *i
        dadd     $12, $12, $16  ; $12 = fact *i + A[i-1]

        daddi    $5, $5, 1      ; i++
        daddi    $1, $1, 8      ; pA++
        bne      $6, $5, loop   ; Exit loop if i == N
	
        sw       $12, fact($0)     ; Store factorial result
        sw       $7, perrin($0)     ; Store perrin result
        halt

;; Expected result: fact  =  b6628(hex)/ 747048(dec)
;;                  perrin =     7b(hex)/ 123(dec)
