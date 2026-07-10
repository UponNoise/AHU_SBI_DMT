 
 
  # ²âÊÔ j, andi, and Ö¸Áî
 testand:
 addi $s1,$0,0
 addi $t1,$zero, 0x1   # $t1 = 1
 addi $t2,$zero, 0x1   # $t2 = 2
 and $t4,$t1, $t2      #$t4 = $t1 &  $t2
 sw $t4, 0x200($s1)
 
