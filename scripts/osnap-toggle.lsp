;; osnap-toggle.lsp - Toggle running object snap on and off
;; Command: OSTG
(defvar *ostg-prev* 0)
(defun c:OSTG ( / cur )
  (setq cur (getvar "OSMODE"))
  (if (= cur 0)
    (progn
      (setvar "OSMODE" *ostg-prev*)
      (princ (strcat "\nOsnap restored (mode " (itoa *ostg-prev*) ")."))
    )
    (progn
      (setq *ostg-prev* cur)
      (setvar "OSMODE" 0)
      (princ "\nOsnap off. Run OSTG again to restore.")
    )
  )
  (princ)
)
