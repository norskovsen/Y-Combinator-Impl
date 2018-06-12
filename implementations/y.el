;;; y.el --- Y Combinator (elisp version)

;;; Commentary:
; My attempt of the Y Combinator in Elisp

;;; Code:

(defun Y-com (improver)
  "Y combinator function that make IMPROVER a recursive function."
  (lexical-let* ((improver improver))
    ((lambda (x) (funcall x x))
     (lambda (f)
       (lexical-let* ((f f))
       (funcall improver (lambda (x) (funcall (funcall f f) x))))))))

(defun fac-improver (partial)
  "A function that improve the PARTIAL factorial function with one."
  (lexical-let* ((partial partial))
    (lambda (n)
      (if (= n 1)
	  1
	(* n (funcall partial (1- n)))))))

(defun fac (n)
  "The fac function of N defined using the Y combinator."
  (funcall (funcall 'Y-com 'fac-improver) n))

(provide' y)
;;;y.el ends her
