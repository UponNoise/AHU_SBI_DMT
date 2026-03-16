 # 跳转到结束标签
 j end_program
 addi $s1,$0,0
 addi $t1,$zero, 0x1 
 sw $t1, 0x200($s1)
 
end_program:
 addi   $v0,$zero,10         # system call for exit
 syscall