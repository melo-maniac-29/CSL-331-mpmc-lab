#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *obj;

char prog_name[10], record[100], locn[5], instr[3], reloc_bits[4], bit_mask[30], objcode[7], cnt[3];

int i, j, k = 0, flag = 0, rec_len, start, ind, new_loc, load_addr, count = 0;
unsigned int rel_addr; // Change to unsigned int

void convert_to_bin() {
    i = 0;
    bit_mask[0] = '\0'; // Initialize bit_mask
    while (reloc_bits[i]) {
        switch (reloc_bits[i]) {
            case '0': strcat(bit_mask, "0000"); break;
            case '1': strcat(bit_mask, "0001"); break;
            case '2': strcat(bit_mask, "0010"); break;
            case '3': strcat(bit_mask, "0011"); break;
            case '4': strcat(bit_mask, "0100"); break;
            case '5': strcat(bit_mask, "0101"); break;
            case '6': strcat(bit_mask, "0110"); break;
            case '7': strcat(bit_mask, "0111"); break;
            case '8': strcat(bit_mask, "1000"); break;
            case '9': strcat(bit_mask, "1001"); break;
            case 'A': case 'a': strcat(bit_mask, "1010"); break;
            case 'B': case 'b': strcat(bit_mask, "1011"); break;
            case 'C': case 'c': strcat(bit_mask, "1100"); break;
            case 'D': case 'd': strcat(bit_mask, "1101"); break;
            case 'E': case 'e': strcat(bit_mask, "1110"); break;
            case 'F': case 'f': strcat(bit_mask, "1111"); break;
        }
        i++;
    }
}

int main() {
    printf("\nEnter the name of the program to be loaded: ");
    scanf("%s", prog_name);

    obj = fopen("obj2.txt", "r");
    if (obj == NULL) {
        fprintf(stderr, "Error opening the object file.\n");
        return 1;
    }

    if (fscanf(obj, "%s", record) != 1) {
        fprintf(stderr, "Error reading from the object file.\n");
        fclose(obj);
        return 1;
    }

    // Check program name
    for (i = 0; i < strlen(prog_name); i++) {
        if (record[i + 2] != prog_name[i]) {
            printf("Invalid program name!\n");
            fclose(obj);
            return 1;
        }
    }

    printf("\nEnter load address: ");
    scanf("%x", &load_addr);

    // Read start location from text record
    while (record[0] != 'E') {
        if (record[0] == 'T') {
            strncpy(locn, record + 4, 4);
            locn[4] = '\0'; // Ensure null termination

            sscanf(locn, "%x", &start);
            new_loc = start;

            strncpy(reloc_bits, record + 12, 3);
            reloc_bits[3] = '\0'; // Ensure null termination

            strncpy(cnt, record + 9, 2);
            cnt[2] = '\0'; // Ensure null termination
            sscanf(cnt, "%x", &count);
            count /= 3; // Divide by 3 for number of object codes

            convert_to_bin(); // Convert relocation bits to binary

            ind = 16;
            for (i = 0; i < 10 && count > 0; i++) {
                for (j = 0; j < 6 && ind < strlen(record); j++, ind++) {
                    objcode[j] = record[ind];
                }
                objcode[6] = '\0'; // Ensure null termination

                sscanf(objcode, "%x", &rel_addr); // No warning now

                if (bit_mask[i] == '1') { // Relocation required
                    printf("00%x\t  %x\n", new_loc + load_addr, rel_addr + load_addr);
                } else { // Relocation not required
                    printf("00%x\t  %x\n", new_loc + load_addr, rel_addr);
                }

                new_loc += 3;
                count--;
                ind += 1; // Move to the next object code
            }
        }
        if (fscanf(obj, "%s", record) != 1) {
            break; // Exit if there are no more records
        }
    }

    fclose(obj);
    return 0;
}
