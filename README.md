# ARM ASM/C - LPC1768
[![SHIELDS](https://img.shields.io/badge/development-completed-green)](https://shields.io/)

## PROJECT DESCRIPTION

This project includes several small programs developed throughout the Computer Architectures 19/20 course at Politecnico di Torino. The target board was the LPC1768 ARM Cortex M3 Evaluation Board OM11043. All programs were developed using a mix of ASM/C languages, as listed below:

* **rename_fibonacci**: program in ARM assembly language that renames register r1 to single_value, r2 to double_value, r3 to triple_value, r4 to quadruple_value e r5 to quintuple_value, assigns some value to single_value, and only using MOV and sum, assign these values to the registers:

   - double_value = single_value *2
   - triple_value = single_value *3
   - quadruple_value = single_value * 4
   - quintuple_value = single_value * 5

   Furthermore, it allocates 26 byte into a memory area DATA READWRITE, without initializing them, then r0 and r1 are initialized to 1, and registers r2-r12 the elements of
Fibonacci sequence.

* **custom_instructions**: program in ARM assembly language that implements and tests the instructions UADD8, USAD8, SMUAD, and SMUSD that are not present in the Cortex-M3 instruction set.

* **matrix_mul**: program in ARM assembly language in order to multiply two matrices. The first matrix is made by N rows and M columns. The second matrix is made by M rows and P columns. The resulting matrix is made by N rows and P columns. All martrices are made by signed numbers expressed on a word. N, M, P are constants defined with EQU. The first two matrices are defined as constant in a READONLY memory area. The third matrix is allocated in a DATA READWRITE area. Intermediate sums have to be calculated on two words.

* **proc_sobroutine**: program in ARM assembly language with routines that fulfill AAPCS standard. Furthermore, the program implements the handler of a Supervisor call, as well as a C function that computes the square root of the sum of the squares of 2 numbers.

* **arm_c**: program in C language that tests the LPC1768 board I/O.

* **slot_machine**: program in C language that implements a slot machine with 3 rolling wheels. KEY1 button begins a new game and controls the first wheel. KEY2 button controls the second wheel. INT0 button controls the third wheel and states the possible win. The player wins if all 3 symbols are the same. At the end of the game (after INT0 has been pressed), win is displayed by powering on LED 11. If symbols are not all the same, the player loses an LED 10 is powered on.

* **simon_game**: program in C language that implements the Simon game. Using Key1, Key2, Int0 buttons, the player has to repeat a random sequence, displayed using LEDs 4, 5, 6. If the sequence inserted by the player is the same as the one to emulate, the player wins. At this point the game repeats, increasing by 1 the length of the sequence. Otherwise the player loses, and the game starts again from sequence length 1.

* **shop_list**: retailer must supply his shop by purchasing the goods from a wholesaler. The products sold by the wholesaler are listed in a Price_list table of N lines (N is a constant defined with EQU). Each line contains:
   - a hexadecimal code uniquely identifying the product, expressed in 1 word (4 bytes);
   - the price of one unit of the product, expressed on 1 word.

   Price_list lines are sorted according to the growing identification code, but the identification codes are not necessarily consecutive (out-of-production products are removed from the wholesaler’s catalogue). The seller listed the products to be purchased in an Item_list table of M lines (M is a constant defined with EQU). Each line contains:

   - the product identification code, expressed on 1 word
   - the quantity of the product to be purchased, expressed on 1 word.

  Item_list lines are not sorted.
  
## DOCUMENTATION

Source files for each program can be found inside the respective folder.

## LICENSE

The source code of the project is licensed under the GPLv3 license, unless otherwise stated.  
