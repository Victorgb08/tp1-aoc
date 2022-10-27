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
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	slt	$2,$4,3
	bne	$2,$0,$L9
	move	$5,$4

	addiu	$2,$4,-3
	addiu	$sp,$sp,-48
	sltu	$2,$2,7
	sw	$18,36($sp)
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	bne	$2,$0,$L3
	move	$18,$0

	li	$19,3			# 0x3
	li	$16,1			# 0x1
$L19:
	sll	$3,$16,2
$L18:
	addu	$3,$3,$16
	move	$6,$16
	sll	$16,$3,1
	bne	$16,$0,1f
	div	$0,$5,$16
	break	7
1:
	mflo	$4
	slt	$2,$4,10
	mfhi	$17
	beq	$2,$0,$L18
	sll	$3,$16,2

	beq	$4,$19,$L6
	sll	$5,$6,4

	.option	pic0
	jal	count
	nop

	.option	pic2
	addiu	$4,$16,-1
	.option	pic0
	jal	count
	.option	pic2
	move	$16,$2

	mult	$16,$2
	slt	$3,$17,3
	move	$5,$17
	mflo	$2
	addu	$2,$2,$16
	bne	$3,$0,$L16
	addu	$18,$18,$2

$L8:
	addiu	$2,$5,-3
	sltu	$2,$2,7
	beq	$2,$0,$L19
	li	$16,1			# 0x1

$L3:
	addiu	$5,$5,-1
$L16:
	lw	$31,44($sp)
	lw	$19,40($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	addu	$2,$5,$18
	lw	$18,36($sp)
	jr	$31
	addiu	$sp,$sp,48

$L6:
	subu	$5,$5,$6
	sll	$5,$5,1
	.option	pic0
	b	$L8
	.option	pic2
	addiu	$5,$5,-1

$L9:
	jr	$31
	move	$2,$4

	.set	macro
	.set	reorder
	.end	count
	.size	count, .-count
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"%d \000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
	.cprestore	16
	.option	pic0
	jal	count
	.option	pic2
	li	$4,578			# 0x242

	lw	$28,16($sp)
	lui	$5,%hi($LC0)
	lw	$25,%call16(__printf_chk)($28)
	move	$6,$2
	addiu	$5,$5,%lo($LC0)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	li	$4,1			# 0x1

	lw	$31,28($sp)
	move	$2,$0
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
