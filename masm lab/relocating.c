#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function declarations
void convert(char h[12]);

char bitmask[12];
char bit[50];  // Adjust the size to hold enough bits

int main() {
    char add[6], input[10], binary[12], relocbit;
    char pn[5]; 
    int start, len, i, address, opcode, actualadd, tlen;

    FILE *fp1, *fp2;

    printf("\n\nEnter the actual starting address: ");
    scanf("%x", &start);  // %x format specifier to scan hexadecimal

    fp1 = fopen("RLIN.txt", "r");
    fp2 = fopen("RLOUT.txt", "w");

    if (fp1 == NULL || fp2 == NULL) {
        printf("Error opening file\n");
        return 1; // Return an error code
    }

    // Debug: Print file contents
    char line[100];
    printf("\nContents of RLIN.txt:\n");
    while (fgets(line, sizeof(line), fp1) != NULL) {
        printf("%s", line);
    }
    rewind(fp1);  // Rewind to the beginning for actual processing

    fprintf(fp2, "ADDRESS\t\tCONTENT\n");
    fscanf(fp1, "%s", input);

    while (strcmp(input, "E") != 0) {
        // Handle header record
        if (strcmp(input, "H") == 0) {
            fscanf(fp1, "%s", pn);        // Read program name
            fscanf(fp1, "%x", &start);    // Read starting address in hex
            fscanf(fp1, "%x", &len);      // Read length
            fscanf(fp1, "%s", input);     // Read the next input
            continue; // Go to the next iteration
        }

        // Handle text record
        if (strcmp(input, "T") == 0) {
            fscanf(fp1, "%x", &address);
            fscanf(fp1, "%x", &tlen);
            fscanf(fp1, "%s", bitmask);

            address += start;  // Add start to the address
            convert(bitmask);  // Convert the bitmask to bit representation

            printf("Processing text record at address %x with length %x\n", address, tlen);

            // Reading opcodes based on the length provided
            for (i = 0; i < tlen / 2; i++) {  // Each opcode is 2 hex digits
                if (fscanf(fp1, "%x", &opcode) != 1) {
                    printf("Error reading opcode at address %x. Expected more opcodes.\n", address);
                    fclose(fp1);
                    fclose(fp2);
                    return 1; // Return error code
                }

                // Correctly get the relocation bit based on index
                relocbit = bit[i];  // Get the relocation bit for this opcode
                if (relocbit == '1') {
                    actualadd = opcode + start;  // Adjust address based on relocation bit
                } else {
                    actualadd = opcode;
                }

                fprintf(fp2, "\n%x\t\t%x%x\n", address, opcode, actualadd);
                address += 3;  // Increment address by 3 for next entry
            }

            fscanf(fp1, "%s", input); // Read the next input for the loop condition
            continue; // Skip to the next loop iteration
        }

        // Handle unexpected input types and read next input
        fscanf(fp1, "%s", input); // Read next input for the loop condition
    }

    fclose(fp1);
    fclose(fp2);

    printf("\n\nThe contents of the output file (RLOUT.TXT):\n\n");
    fp2 = fopen("RLOUT.txt", "r");
    
    if (fp2 == NULL) {
        printf("Error opening output file\n");
        return 1;
    }

    char ch = fgetc(fp2);
    while (ch != EOF) {
        printf("%c", ch);
        ch = fgetc(fp2);
    }

    fclose(fp2);
    return 0;
}

// Function to convert hexadecimal to binary bitmask
void convert(char h[12]) {
    int i;
    strcpy(bit, "");  // Clear the bit array

    for (i = 0; i < strlen(h); i++) {
        switch (h[i]) {
            case '0': strcat(bit, "0000"); break;
            case '1': strcat(bit, "0001"); break;
            case '2': strcat(bit, "0010"); break;
            case '3': strcat(bit, "0011"); break;
            case '4': strcat(bit, "0100"); break;
            case '5': strcat(bit, "0101"); break;
            case '6': strcat(bit, "0110"); break;
            case '7': strcat(bit, "0111"); break;
            case '8': strcat(bit, "1000"); break;
            case '9': strcat(bit, "1001"); break;
            case 'A': strcat(bit, "1010"); break;
            case 'B': strcat(bit, "1011"); break;
            case 'C': strcat(bit, "1100"); break;
            case 'D': strcat(bit, "1101"); break;
            case 'E': strcat(bit, "1110"); break;
            case 'F': strcat(bit, "1111"); break;
            default: printf("Invalid hex character\n"); break;
        }
    }
}