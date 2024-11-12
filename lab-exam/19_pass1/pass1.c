#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void main()
{
	FILE *f1, *f2, *f3, *f4;
	char s[100], lab[30], opcode[30], opa[30], opcode1[30], opa1[30];
	int locctr, x = 0;

	// Open files
	f1 = fopen("input.txt", "r");    // Source code input
	f2 = fopen("opcode.txt", "r");   // Opcode table
	f3 = fopen("out1.txt", "w");     // Output with location counter
	f4 = fopen("sym1.txt", "w");     // Symbol table

	// Read each line from the input file until the end
	while (fscanf(f1, "%s %s %s", lab, opcode, opa) != EOF)
	{
		// Check if the line is a START directive
		if (strcmp(lab, "**") == 0 && strcmp(opcode, "START") == 0)
		{
			// Output START line to out1.txt and set location counter to operand (starting address)
			fprintf(f3, "%s\t%s\t%s", lab, opcode, opa);
			locctr = atoi(opa);
		}
		else
		{
			rewind(f2);  // Reset opcode file pointer to beginning
			x = 0;

			// Search opcode table for matching opcode
			while (fscanf(f2, "%s %s", opcode1, opa1) != EOF)
			{
				if (strcmp(opcode, opcode1) == 0)  // Opcode found
				{
					x = 1;  // Set flag to indicate opcode is found
					break;
				}
			}

			if (x == 1)  // If opcode was found in opcode table
			{
				// Write current line to out1.txt and increment location counter by 3
				fprintf(f3, "\n%d\t%s\t%s\t%s", locctr, lab, opcode, opa);
				locctr += 3;
			}
			else  // Opcode not found in table, handle storage directives and other cases
			{
				if (strcmp(opcode, "RESW") == 0)  // RESW reserves word(s)
				{
					fprintf(f3, "\n%d\t%s\t%s\t%s", locctr, lab, opcode, opa);
					fprintf(f4, "\n%d\t%s", locctr, lab);  // Write label to symbol table
					locctr += 3 * atoi(opa);  // Increment location counter by 3 * operand
				}
				else if (strcmp(opcode, "WORD") == 0)  // WORD allocates 1 word
				{
					fprintf(f3, "\n%d\t%s\t%s\t%s", locctr, lab, opcode, opa);
					fprintf(f4, "\n%d\t%s", locctr, lab);
					locctr += 3;  // Increment location counter by 3
				}
				else if (strcmp(opcode, "BYTE") == 0)  // BYTE allocates 1 byte
				{
					fprintf(f3, "\n%d\t%s\t%s\t%s", locctr, lab, opcode, opa);
					fprintf(f4, "\n%d\t%s", locctr, lab);
					locctr += 1;  // Increment location counter by 1
				}
				else if (strcmp(opcode, "RESB") == 0)  // RESB reserves byte(s)
				{
					fprintf(f3, "\n%d\t%s\t%s\t%s", locctr, lab, opcode, opa);
					fprintf(f4, "\n%d\t%s", locctr, lab);
					locctr += atoi(opa);  // Increment location counter by operand
				}
				else  // For any other instruction, assume operand value as size
				{
					fprintf(f3, "\n%d\t%s\t%s\t%s", locctr, lab, opcode, opa);
					fprintf(f4, "\n%d\t%s", locctr, lab);
					locctr += atoi(opa);  // Increment location counter by operand
				}
			}
		}
	}

	// Close all opened files
	fclose(f1);
	fclose(f2);
	fclose(f3);
	fclose(f4);
}
