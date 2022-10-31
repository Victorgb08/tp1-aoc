	.file	1 "tp1-1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	count
	.set	nomips16
	.set	nomicromips
	.ent	count
	.type	count, @function
count:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$16,36($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	lw	$2,48($fp)
	nop
	slt	$2,$2,3
	beq	$2,$0,$L2
	nop

	lw	$2,48($fp)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L2:
	lw	$2,48($fp)
	nop
	slt	$2,$2,3
	bne	$2,$0,$L4
	nop

	lw	$2,48($fp)
	nop
	slt	$2,$2,10
	beq	$2,$0,$L4
	nop

	lw	$2,48($fp)
	nop
	addiu	$2,$2,-1
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L4:
	li	$2,1			# 0x1
	sw	$2,24($fp)
	.option	pic0
	b	$L5
	nop

	.option	pic2
$L6:
	lw	$3,24($fp)
	nop
	move	$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,1
	sw	$2,24($fp)
$L5:
	lw	$3,48($fp)
	lw	$2,24($fp)
	nop
	div	$0,$3,$2
	bne	$2,$0,1f
	nop
	break	7
1:
	mfhi	$2
	mflo	$2
	slt	$2,$2,10
	beq	$2,$0,$L6
	nop

	lw	$3,48($fp)
	lw	$2,24($fp)
	nop
	div	$0,$3,$2
	bne	$2,$0,1f
	nop
	break	7
1:
	mfhi	$2
	mflo	$2
	sw	$2,28($fp)
	lw	$3,28($fp)
	li	$2,3			# 0x3
	beq	$3,$2,$L7
	nop

	lw	$4,28($fp)
	.option	pic0
	jal	count
	nop

	.option	pic2
	move	$16,$2
	lw	$2,24($fp)
	nop
	addiu	$2,$2,-1
	move	$4,$2
	.option	pic0
	jal	count
	nop

	.option	pic2
	mult	$16,$2
	mflo	$16
	lw	$4,28($fp)
	.option	pic0
	jal	count
	nop

	.option	pic2
	addu	$16,$16,$2
	lw	$3,48($fp)
	lw	$2,24($fp)
	nop
	div	$0,$3,$2
	bne	$2,$0,1f
	nop
	break	7
1:
	mfhi	$2
	move	$4,$2
	.option	pic0
	jal	count
	nop

	.option	pic2
	addu	$2,$16,$2
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L7:
	lw	$3,28($fp)
	lw	$2,24($fp)
	nop
	mult	$3,$2
	mflo	$2
	addiu	$2,$2,-1
	move	$4,$2
	.option	pic0
	jal	count
	nop

	.option	pic2
$L3:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,36($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	count
	.size	count, .-count
	.rdata
	.align	2
$LC0:
	.ascii	"%i\000"
	.align	2
$LC1:
	.ascii	"%d\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	nop
	lw	$2,0($2)
	nop
	sw	$2,28($fp)
	addiu	$2,$fp,24
	move	$5,$2
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(__isoc99_scanf)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__isoc99_scanf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	nop
	move	$4,$2
	.option	pic0
	jal	count
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$5,$2
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$4,$2
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$3,28($fp)
	lw	$2,0($2)
	nop
	beq	$3,$2,$L10
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L10:
	move	$2,$4
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
