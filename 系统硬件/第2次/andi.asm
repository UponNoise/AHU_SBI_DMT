 
  # ²âÊÔand Ö¸Áî
 testandi:
 addi $s1,$0,0
 addi $t1,$zero, 0x1   # $t1 = 1
 andi $t3,$t1, 0x1     # $t3 =$t1 & 0x1  
 sw $t3, 0x200($s1)
 
