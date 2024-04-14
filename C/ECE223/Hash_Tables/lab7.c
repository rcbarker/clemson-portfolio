/* lab7.c 
 * Ryan Barker
 * Lab7: Hash Tables 
 * ECE 223, Fall 2014
 *
 * Version: 1
 *
 * This file contains drivers to test the Hash Table ADT package.
 *
 *   -m to set the table size
 *   -a to set the load factor
 *   -h to set the type of probe sequence {linear|double|quad}
 *
 * The -r driver builds a table using table_insert and then accesses
 * keys in the table using table_retrieve.  Use
 *   -r run the retrieve driver and specifiy the type of initial table keys 
 *      (rand|seq|fold|worst)
 *   -t to set the number of access trials 
 *
 * Another test driver tests random inserts and deletes.  This driver builds
 * an initial table with random keys, and then performs insertions and deletions
 * with equal probability.
 *   -e run the equilibrium driver
 *
 * To test using the rehash driver. The table size must be at least 6
 *   -b
 *
 * To test using the unit driver. The table size and probing method vary with each test.
 *   -u 0|1|2
 *
 * To test using the deletion driver. Table size is 7 with Linear Probing
 *   -d 0|1
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <unistd.h>

#include "table.h"

/* constants used with Global variables */
enum TableType_t {RAND, SEQ, FOLD, WORST};

#define MINID 10
#define MAXID 999999990

#define TRUE 1
#define FALSE 0

/* Global variables for command line parameters.  */
int Verbose = FALSE;
int Off = FALSE;
static int TableSize = 11;
static int ProbeDec = LINEAR;
static double LoadFactor = 0.9;
static int TableType = RAND;
static int RetrieveTest = FALSE;
static int EquilibriumTest = FALSE;
static int RehashTest = FALSE;
static int UnitNumber = -1;
static int DeletionNumber = -1;
static int Trials = 50000;
static int Seed = 26214;

/* prototypes for functions in this file only */
void getCommandLine(int argc, char **argv);
void equilibriumDriver(void);
void UnitDriver(void);
void RetrieveDriver(void);
void RehashDriver(int);
void DeletionDriver(void);
int build_random(table_t *T, int ,int);
int build_seq(table_t *T, int, int);
int build_fold(table_t *T, int, int);
int build_worst(table_t *T, int, int);
void performanceFormulas(double);
int find_first_prime(int number);
void printCommandLine(void);

int main(int argc, char **argv)
{
    printf("Welcome to MP7: Hash Table Operations");
    getCommandLine(argc, argv);
    if(!Off) printCommandLine();

    /* Do not display for unit driver */
    if(UnitNumber == -1) {
        printf("Table size (%d), load factor (%g)\n", TableSize, LoadFactor);
        if (ProbeDec == LINEAR)
            printf("Open addressing with linear probe sequence\n");
        else if (ProbeDec == DOUBLE)
            printf("Open addressing with double hashing\n");
        else if (ProbeDec == CHAIN)
            printf("Separate chaining\n");
        else if (ProbeDec == QUAD)
            printf("Open addressing with quadratic probe sequence\n");
        printf("Seed: %d\n", Seed);
        srand48(Seed);
    }

    /* ----- small table tests  ----- */
    if (RehashTest)                         /* enable with -b */
        RehashDriver(TableSize);

    /* ----- large table tests  ----- */
    if (RetrieveTest)                        /* enable with -r flag */
        RetrieveDriver();

    /* test for performance in equilibrium */
    if (EquilibriumTest)                   /* enable with -e flag */
        equilibriumDriver();

    /* test unit drivers */
    if (UnitNumber != -1)
        UnitDriver();

    /* test deletions */
    if (DeletionNumber != -1)              /* enable with -d flag */
        DeletionDriver();

    return 0;
}

void build_table(table_t *test_table, int num_keys)
{
    int probes = -1;
    printf("  Build table with");
    if (TableType == RAND) {
        printf(" %d random keys\n", num_keys);
        probes = build_random(test_table, TableSize, num_keys);
    } else if (TableType == SEQ) {
        printf(" %d sequential keys\n", num_keys);
        probes = build_seq(test_table, TableSize, num_keys);
    } else if (TableType == FOLD) {
        printf(" %d folded keys\n", num_keys);
        probes = build_fold(test_table, TableSize, num_keys);
    } else if (TableType == WORST) {
        printf(" %d worst keys\n", num_keys);
        probes = build_worst(test_table, TableSize, num_keys);
    } else {
        printf("invalid option for table type\n");
        exit(7);
    }
    printf("    The average number of probes for a successful search = %g\n", 
            (double) probes/num_keys);

    if (Verbose)
        table_debug_print(test_table);

    int size = table_entries(test_table);
    assert(size == num_keys);
}

/* Unit driver that runs one of three test drivers for use with verifying proper program
 * operation.
 */
void UnitDriver(void)
{
    printf("\n----- Unit driver -----\n");
    int passed = TRUE;

    if(UnitNumber == 0) {
        printf("Unit Driver Test 0: Inserting into full table\n");

        /* Build table of size 7 with linear probing */
        table_t *T = table_construct(7, LINEAR);

        /* Insert until only one empty entry in table - Table full */
        int i, insert;
        int *data_ptr = NULL;
        for(i = MINID; i < MINID + 6; i++) {
            data_ptr = (int *) malloc(sizeof(int));
            *data_ptr = i;
            insert = table_insert(T, i, data_ptr);
            printf("Key %d inserted.\n", i);
            assert(insert == 0);
        }

        /* Print table */
        printf("Table after construction (Should be full):\n");
        table_debug_print(T);

        /* Attempt to insert a key into last empty position */
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = MINID + 6;
        insert = table_insert(T, MINID + 7, data_ptr);
        if(insert == 0) {
            printf("Key %d inserted.\n", MINID + 6);
            passed = FALSE;
        } else if(insert == 1) {
            printf("Key %d replaced.\n", MINID + 6);
            passed = FALSE;
        } else {
            printf("Key %d not inserted.\n", MINID + 6);
            free(data_ptr);
        }

        /* Attempt to insert a key into a filled position */
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = MINID + 7;
        insert = table_insert(T, MINID + 8, data_ptr);
        if(insert == 0) {
            printf("Key %d inserted.\n", MINID + 7);
            passed = FALSE;
        } else if(insert == 1) {
            printf("Key %d replaced.\n", MINID + 7);
            passed = FALSE;
        } else {
            printf("Key %d not inserted.\n", MINID + 7);
            free(data_ptr);
        }

        /* Print table */
        printf("Table after last insert:\n");
        table_debug_print(T);

        /* Print whether test passed */
        if(passed == TRUE) printf("Test 0 passed!\n");
        else printf("Test 0 failed!\n");

        /* Destroy table */
        table_destruct(T);
    } else if(UnitNumber == 1) {
        printf("Unit Driver Test 1: Delete and Replace testing\n");

        /* Build table of size 4 with quadratic probing */
        table_t *T = table_construct(4, QUAD);

        /* Print table */
        printf("Table after construction:\n");
        table_debug_print(T);

        /* Attempt to delete from table while empty */
        int *deleted = table_delete(T, 10);
        if(deleted != NULL) {
            printf("Key 10 deleted.\n");
            free(deleted);
            passed = FALSE;
        } else printf("Key 10 not found in table -- Not deleted.\n");
 
        /* Insert into table */
        int i, insert;
        int *data_ptr = NULL;
        for(i = MINID; i < MINID + 3; i++) {
            data_ptr = (int *) malloc(sizeof(int));
            *data_ptr = i;
            insert = table_insert(T, i, data_ptr);
            printf("Key %d inserted.\n", i);
            assert(insert == 0);
        }

        /* Print Table */
        printf("Table after inserts:\n");
        table_debug_print(T);

        /* Attempt to remove key not in table */
        deleted = table_delete(T, MINID + 4);
        if(deleted != NULL) {
            printf("Key %d deleted.\n", MINID + 4);
            free(deleted);
            passed = FALSE;
        } else printf("Key %d not found in table -- Not deleted.\n", MINID + 4);

        /* Attempt a replace */
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = 5;
        insert = table_insert(T, MINID + 1, data_ptr);
        if(insert == 0) {
            printf("Key %d inserted.\n", MINID + 1);
            passed = FALSE;
        } else if(insert == 1) printf("Key %d replaced.\n", MINID + 1);
        else {
            printf("Key %d not inserted.\n", MINID + 1);
            free(data_ptr);
            passed = FALSE;
        }
     
        /* Print Table */
        printf("Final Table:\n");
        table_debug_print(T);

        /* Determine whether test passed and print */
        if(passed == TRUE) printf("Test 1 passed!\n");
        else printf("Test 1 failed!\n");

        /* Destroy Table */
        table_destruct(T);
    } else {
        printf("Unit Driver Test 2: Invalid probe type and table size combinations\n"); 

        /* Build table of size 9 with double probing */
        table_t *T = table_construct(9, DOUBLE);

        /* Print table */
        printf("Table 1 after construction:\n");
        table_debug_print(T);

        /* Attempt to insert into table - Should fail */
        int *data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = 3;
        int insert = table_insert(T, MINID, data_ptr);
        if(insert == 0) {
            printf("Key %d inserted in Table 1.\n", MINID);
            passed = FALSE;
        } else if(insert == 1) {
            printf("Key %d replaced in Table 1.\n", MINID);
            passed = FALSE;
        } else {
            printf("Key %d not inserted in Table 1 -- Invalid Table Size / Probe Dec Combo.\n",
                    MINID);
            free(data_ptr);
        }

        /* Print table */
        printf("Table 1 after insert:\n");
        table_debug_print(T);

        /* Destroy Table 1 */
        table_destruct(T);

        /* Build table of size 5 with quad probing */
        T = table_construct(5, QUAD);

        /* Print table */
        printf("Table 2 after construction:\n");
        table_debug_print(T);

        /* Attempt to insert into table - Should fail */
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = MAXID;
        insert = table_insert(T, MAXID, data_ptr);
        if(insert == 0) {
            printf("Key %d inserted in Table 2.\n", MAXID);
            passed = FALSE;
        } else if(insert == 1) {
            printf("Key %d replaced in Table 2.\n", MAXID);
            passed = FALSE;
        } else {
            printf("Key %d not inserted in Table 2 -- Invalid Table Size / Probe Dec Combo.\n",
                    MAXID);
            free(data_ptr);
        }

        /* Print table */
        printf("Table 2 after insert:\n");
        table_debug_print(T);

        /* Destroy Table 2 */
        table_destruct(T);

        /* Determine if test passed or failed */
        if(passed == TRUE) printf("Test 2 passed!\n");
        else printf("Test 2 failed!\n");
    }
    printf("----- End of unit driver -----\n\n");
}

/* driver to test small tables.  This is a series of 
 * simple tests and is not exhaustive.
 *
 * input: test_M is the table size for this test run
 */
void RehashDriver(int test_M)
{
    int i, *ip, code;
    table_t *H;

    printf("\n----- Rehash driver -----\n");
    if (ProbeDec == CHAIN) {
        printf("This design of the rehash driver does not work with separate chaining\n");
        return;
    }
    hashkey_t startkey = MINID + (test_M - MINID%test_M);
    assert(startkey%test_M == 0);
    assert(test_M > 5);  // tests designed for size at least 6

    H = table_construct(test_M, ProbeDec);
    // fill table sequentially 
    for (i = 0; i < test_M-1; i++) {
        ip = (int *) malloc(sizeof(int));
        *ip = 10*i;
        assert(table_full(H) == 0);
        code = table_insert(H, startkey+i, ip);
        ip = NULL;
        assert(code == 0);
        assert(table_entries(H) == i+1);
        assert(table_stats(H) == 1); /* Problem Assert */
        assert(table_peek(H,i) == startkey+i);
    }
    if (Verbose) {
        printf("\nfull table, last entry empty\n");
        table_debug_print(H);
    }
    // tests on empty position
    assert(table_peek(H,i) == 0);
    assert(NULL == table_retrieve(H, startkey+i));
    assert(table_stats(H) == 1);
    assert(table_full(H) == 1);
    assert(-1 == table_insert(H, MAXID, NULL));
    // retrieve and replace each entry
    for (i = 0; i < test_M-1; i++) {
        ip = table_retrieve(H, startkey+i);
        assert(*(int *)ip == 10*i);
        ip = NULL;
        assert(table_stats(H) == 1);
        ip = table_retrieve(H, startkey+i+test_M);
        assert(ip == NULL);
        assert(2 <= table_stats(H) && table_stats(H) <= test_M);
        if (ProbeDec == LINEAR)
            assert(table_stats(H) == i+2);
        ip = (int *) malloc(sizeof(int));
        *ip = 99*i;
        assert(1 == table_insert(H, startkey+i, ip));
        ip = NULL;
        ip = table_retrieve(H, startkey+i);
        assert(*(int *)ip == 99*i);
        ip = NULL;
    }
    assert(table_entries(H) == test_M-1);
    assert(table_full(H) == 1);
    // delete tests
    assert(table_deletekeys(H) == 0);
    ip = table_delete(H, startkey+1);
    assert(*(int *)ip == 99);
    free(ip); ip = NULL;
    if (Verbose) {
        printf("\nsecond entry deleted, last entry empty\n");
        table_debug_print(H);
    }
    assert(table_entries(H) == test_M-2);
    assert(table_full(H) == 0);
    assert(table_peek(H,1) == 0);
    assert(table_deletekeys(H) == 1);
    ip = table_retrieve(H, startkey+1);  // check key is not there
    assert(ip == NULL);
    assert(table_stats(H) >= 2);
    // attempt to delete keys not in table 
    assert(NULL == table_delete(H, startkey+1));
    assert(NULL == table_delete(H, startkey+test_M-1));
    // insert key in its place
    ip = (int *) malloc(sizeof(int));
    *ip = 123;
    assert(0 == table_insert(H, startkey+1+test_M, ip));
    ip = NULL;
    assert(table_peek(H,1) == startkey+1+test_M);
    ip = table_retrieve(H, startkey+1+test_M);
    assert(*(int *)ip == 123);
    ip = NULL;
    assert(table_entries(H) == test_M-1);
    assert(table_full(H) == 1);
    assert(table_deletekeys(H) == 0);
    for (i = 2; i < test_M-1; i++) {     // clear out all but two keys
        ip = table_delete(H, startkey+i);
        assert(*(int *)ip == 99*i);
        free(ip); ip = NULL;
    }
    assert(table_entries(H) == 2);
    ip = (int *) malloc(sizeof(int));    // fill last empty
    *ip = 456;
    assert(0 == table_insert(H, startkey+test_M-1, ip));
    ip = NULL;
    assert(table_entries(H) == 3);
    // unsuccessful search when no empty keys
    assert(NULL == table_retrieve(H, startkey+test_M));

    // two keys the collide in position 0
    ip = (int *) malloc(sizeof(int));
    *ip = 77;
    assert(0 == table_insert(H, startkey+test_M, ip));
    ip = (int *) malloc(sizeof(int));
    *ip = 88;
    assert(0 == table_insert(H, startkey+10*test_M, ip));
    ip = NULL;
    assert(table_entries(H) == 5);
    ip = table_delete(H, startkey);  // delete position 0
    assert(*(int *)ip == 0);
    free(ip); ip = NULL;
    assert(table_entries(H) == 4);
    ip = (int *) malloc(sizeof(int));  // replace 
    *ip = 87;
    assert(1 == table_insert(H, startkey+10*test_M, ip));
    ip = NULL;
    assert(table_entries(H) == 4);
    ip = (int *) malloc(sizeof(int));   // put back position 0
    *ip = 76;
    assert(0 == table_insert(H, startkey+20*test_M, ip));
    ip = NULL;
    assert(table_entries(H) == 5);
    assert(table_peek(H,0) == startkey+20*test_M);
    assert(table_deletekeys(H) == test_M-5);
    // verify 5 items in table
    ip = table_retrieve(H, startkey+1+test_M);
    assert(*(int *)ip == 123);
    ip = table_retrieve(H, startkey+test_M);
    assert(*(int *)ip == 77);
    ip = table_retrieve(H, startkey+10*test_M);
    assert(*(int *)ip == 87);
    ip = table_retrieve(H, startkey+20*test_M);
    assert(*(int *)ip == 76);
    ip = table_retrieve(H, startkey+test_M-1);
    assert(*(int *)ip == 456);
    ip = NULL;
    // rehash
    H = table_rehash(H, test_M);
    assert(table_entries(H) == 5);
    assert(table_deletekeys(H) == 0);
    if (Verbose) {
        printf("\ntable after rehash with 5 items\n");
        table_debug_print(H);
    }
    // verify 5 items in table
    ip = table_retrieve(H, startkey+1+test_M);
    assert(*(int *)ip == 123);
    ip = table_retrieve(H, startkey+test_M);
    assert(*(int *)ip == 77);
    ip = table_retrieve(H, startkey+10*test_M);
    assert(*(int *)ip == 87);
    ip = table_retrieve(H, startkey+20*test_M);
    assert(*(int *)ip == 76);
    ip = table_retrieve(H, startkey+test_M-1);
    assert(*(int *)ip == 456);
    ip = NULL;

    // rehash and increase table size
    // If linear or quad, double the size
    // If double, need new prime
    int new_M = 2*test_M;
    if (ProbeDec == DOUBLE)
        new_M = find_first_prime(new_M);

    H = table_rehash(H, new_M);
    assert(table_entries(H) == 5);
    assert(table_deletekeys(H) == 0);
    if (Verbose) {
        printf("\nafter increase table to %d with 5 items\n", new_M);
        table_debug_print(H);
    }
    // verify 5 keys and information not lost during rehash
    ip = table_retrieve(H, startkey+1+test_M);
    assert(*(int *)ip == 123);
    ip = table_retrieve(H, startkey+test_M);
    assert(*(int *)ip == 77);
    ip = table_retrieve(H, startkey+10*test_M);
    assert(*(int *)ip == 87);
    ip = table_retrieve(H, startkey+20*test_M);
    assert(*(int *)ip == 76);
    ip = table_retrieve(H, startkey+test_M-1);
    assert(*(int *)ip == 456);
    ip = NULL;

    // fill the new larger table
    assert(table_full(H) == 0);
    int new_items = new_M - 1 - 5;
    int base_addr = 2*startkey + 20*test_M*test_M;
    if (base_addr+new_items*test_M > MAXID) {
        printf("re-run -b driver with smaller table size\n");
        exit(1);
    }
    for (i = 0; i < new_items; i++) {
        ip = (int *) malloc(sizeof(int));
        *ip = 10*i;
        code = table_insert(H, base_addr+i*test_M, ip);
        ip = NULL;
        assert(code == 0);
        assert(table_entries(H) == i+1+5);
    }
    assert(table_full(H) == 1);
    assert(table_entries(H) == new_M-1);
    if (Verbose) {
        printf("\nafter larger table filled\n");
        table_debug_print(H);
    }
    // verify new items are found 
    for (i = 0; i < new_items; i++) {
        ip = table_retrieve(H, base_addr+i*test_M);
        assert(*(int *)ip == 10*i);
        ip = NULL;
    }

    // clean up table
    table_destruct(H);
    printf("----- Passed rehash driver -----\n\n");
}

/* driver to build and test tables. Note this driver  
 * does not delete keys from the table.
 */
void RetrieveDriver()
{
    int i;
    int key_range, num_keys;
    int suc_search, suc_trials, unsuc_search, unsuc_trials;
    table_t *test_table;
    hashkey_t key;
    data_t dp;

    /* print parameters for this test run */
    printf("\n----- Retrieve driver -----\n");
    printf("  Trials: %d\n", Trials);

    num_keys = (int) (TableSize * LoadFactor);
    test_table = table_construct(TableSize, ProbeDec);

    build_table(test_table, num_keys);

    key_range = MAXID - MINID + 1;

    if (Trials > 0) {
        /* access table to measure probes for an unsuccessful search */
        suc_search = suc_trials = unsuc_search = unsuc_trials = 0;
        for (i = 0; i < Trials; i++) {
            /* random key with uniform distribution */
            key = (hashkey_t) (drand48() * key_range) + MINID;
            if (Verbose)
                printf("%d: looking for %d\n", i, key);
            dp = table_retrieve(test_table, key);
            if (dp == NULL) {
                unsuc_search += table_stats(test_table);
                unsuc_trials++;
                if (Verbose)
                    printf("\t not found with %d probes\n", 
                            table_stats(test_table));
            } else {
                // this should be very rare
                suc_search += table_stats(test_table);
                suc_trials++;
                if (Verbose)
                    printf("\t\t FOUND with %d probes (this is rare!)\n", 
                            table_stats(test_table));
                assert(*(int *)dp == key);
            }
        }
        assert(num_keys == table_entries(test_table));
        if (suc_trials > 0)
            printf("    Avg probes for successful search = %g measured with %d trials\n", 
                    (double) suc_search/suc_trials, suc_trials);
        if (unsuc_trials > 0)
            printf("    Avg probes for unsuccessful search = %g measured with %d trials\n", 
                    (double) unsuc_search/unsuc_trials, unsuc_trials);
    }

    /* print expected values from analysis with compare to experimental
     * measurements */
    performanceFormulas(LoadFactor);

    /* remove and free all items from table */
    table_destruct(test_table);
    printf("----- End of access driver -----\n\n");
}

/* driver to test sequence of inserts and deletes.
*/
void equilibriumDriver(void)
{
    int i, code;
    int key_range, num_keys;
    int size;
    int ran_index;
    int suc_search, suc_trials, unsuc_search, unsuc_trials;
    int keys_added, keys_removed;
    int *ip;
    table_t *test_table;
    hashkey_t key;
    data_t dp;
    clock_t start, end;

    /* print parameters for this test run */
    printf("\n----- Equilibrium test driver -----\n");
    printf("  Trials: %d\n", Trials);

    test_table = table_construct(TableSize, ProbeDec);
    num_keys = (int) (TableSize * LoadFactor);

    /* build a table as starting point */
    build_table(test_table, num_keys);
    size = num_keys;

    key_range = MAXID - MINID + 1;
    /* in equilibrium make inserts and removes with equal probability */
    suc_search = suc_trials = unsuc_search = unsuc_trials = 0;
    keys_added = keys_removed = 0;
    start = clock();
    for (i = 0; i < Trials; i++) {
        if (drand48() < 0.5 && table_full(test_table) == FALSE) {
            // insert only if table not full
            key = (hashkey_t) (drand48() * key_range) + MINID;
            ip = (int *) malloc(sizeof(int));
            *ip = key;
            /* insert returns 0 if key not found, 1 if older key found */
            if (Verbose) printf("Trial %d, Insert Key %u", i, key);
            code = table_insert(test_table, key, ip);
            if (code == 0) {
                /* key was not in table so added */
                unsuc_search += table_stats(test_table);
                unsuc_trials++;
                keys_added++;
                if (Verbose) printf(" added\n");
            } else if (code == 1) {
                suc_search += table_stats(test_table);
                suc_trials++;
                if (Verbose) printf(" replaced (rare!)\n");
            } else {
                printf("!!!Trial %d failed to insert key (%u) with code (%d)\n", i, key, code);
                exit(10);
            }
        } else if (table_entries(test_table) > TableSize/4) {
            // delete only if table is at least 25% full
            // why 25%?  Would 10% be better?  Lower than 10% will
            // be computationally expensive
            do {
                ran_index = (int) (drand48() * TableSize);
                key = table_peek(test_table, ran_index);
            } while (key == 0);
            if (Verbose) printf("Trial %d, Delete Key %u", i, key);
            if (key < MINID || MAXID < key)
            {
                printf("\n\n  table peek failed: invalid key (%u) during trial (%d)\n", key, i);
                exit(12);
            }
            dp = table_delete(test_table, key);
            if (dp != NULL) {
                if (Verbose) printf(" removed\n");
                suc_search += table_stats(test_table);
                suc_trials++;
                keys_removed++;
                assert(*(int *)dp == key);
                free(dp);
            } else {
                printf("!!! failed to find key (%u) in table, trial (%d)!\n", key, i);
                printf("this is a catastrophic error!!!\n");
                exit(11);
            }
        }
    }
    end = clock();

    if (Verbose) {
        printf("Table after equilibrium trials\n");
        table_debug_print(test_table);
    }

    size += keys_added - keys_removed;
    printf("  Keys added (%d), removed (%d) new size should be (%d) and is (%d)\n",
            keys_added, keys_removed, size, table_entries(test_table));
    assert(size == table_entries(test_table));
    printf("  After exercise, time=%g \n",
            1000*((double)(end-start))/CLOCKS_PER_SEC);
    printf("  successful searches during exercise=%g, trials=%d\n", 
            (double) suc_search/suc_trials, suc_trials);
    printf("  unsuccessful searches during exercise=%g, trials=%d\n", 
            (double) unsuc_search/unsuc_trials, unsuc_trials);


    /* test access times for new table */

    suc_search = suc_trials = unsuc_search = unsuc_trials = 0;
    start = clock();
    /* check each position in table for key */
    for (i = 0; i < TableSize; i++) {
        key = table_peek(test_table, i);
        if (key != 0) {
            assert(MINID <= key && key <= MAXID);
            dp = table_retrieve(test_table, key);
            if (dp == NULL) {
                printf("Failed to find key (%u) but it is in location (%d)\n", 
                        key, i);
                exit(16);
            } else {
                suc_search += table_stats(test_table);
                suc_trials++;
                assert(*(int *)dp == key);
            }
        }
    }
    for (i = 0; i < Trials; i++) {
        /* random key with uniform distribution */
        key = (hashkey_t) (drand48() * key_range) + MINID;
        dp = table_retrieve(test_table, key);
        if (dp == NULL) {
            unsuc_search += table_stats(test_table);
            unsuc_trials++;
        } else {
            // this should be very rare
            assert(*(int *)dp == key);
        }
    }
    end = clock();
    size = table_entries(test_table);
    printf("  After retrieve experiment, time=%g\n",
            1000*((double)(end-start))/CLOCKS_PER_SEC);
    printf("  New load factor = %g\n", (double) size/TableSize);
    printf("  Percent empty locations marked deleted = %g\n",
            (double) 100.0 * table_deletekeys(test_table)
            / (TableSize - table_entries(test_table)));

    printf("   Measured avg probes for successful search=%g, trials=%d\n", 
            (double) suc_search/suc_trials, suc_trials);

    printf("   Measured avg probes for unsuccessful search=%g, trials=%d\n", 
            (double) unsuc_search/unsuc_trials, unsuc_trials);
    printf("    Do deletions increase avg number of probes?\n");
    performanceFormulas((double) size/TableSize);

    /* rehash and retest table */
    printf("  Rehash table\n");
    test_table = table_rehash(test_table, TableSize);
    /* number entries in table should not change */
    assert(size == table_entries(test_table));
    /* rehashing must clear all entries marked for deletion */
    assert(0 == table_deletekeys(test_table));

    /* test access times for rehashed table */

    suc_search = suc_trials = unsuc_search = unsuc_trials = 0;
    start = clock();
    /* check each position in table for key */
    for (i = 0; i < TableSize; i++) {
        key = table_peek(test_table, i);
        if (key != 0) {
            assert(MINID <= key && key <= MAXID);
            dp = table_retrieve(test_table, key);
            if (dp == NULL) {
                printf("Failed to find key (%u) after rehash but it is in location (%d)\n", 
                        key, i);
                exit(26);
            } else {
                suc_search += table_stats(test_table);
                suc_trials++;
                assert(*(int *)dp == key);
            }
        }
    }
    for (i = 0; i < Trials; i++) {
        /* random key with uniform distribution */
        key = (hashkey_t) (drand48() * key_range) + MINID;
        dp = table_retrieve(test_table, key);
        if (dp == NULL) {
            unsuc_search += table_stats(test_table);
            unsuc_trials++;
        } else {
            // this should be very rare
            assert(*(int *)dp == key);
        }
    }
    end = clock();
    size = table_entries(test_table);
    printf("  After rehash, time=%g\n",
            1000*((double)(end-start))/CLOCKS_PER_SEC);
    printf("   Measured avg probes for successful search=%g, trials=%d\n", 
            (double) suc_search/suc_trials, suc_trials);

    printf("   Measured avg probes for unsuccessful search=%g, trials=%d\n", 
            (double) unsuc_search/unsuc_trials, unsuc_trials);

    /* remove and free all items from table */
    table_destruct(test_table);

    printf("----- End of equilibrium test -----\n\n");
}

/* Driver that tests a hash table of size 7 using linear probing for two cases specified
 * in homework 8 questions 7 and 8 as specified in the PDF. The driver prints the state of 
 * the hash table in each part of the tested cases and then prints whether each test passed 
 * or failed.
 */
void DeletionDriver(void) 
{
    printf("\n----- Deletion driver -----\n");

    /* Set parameters for table construct */
    int table_size = 7;
    ProbeDec = LINEAR;

    /* Construct Table */
    table_t *T = table_construct(table_size, ProbeDec);

    if(DeletionNumber == 0) {
        printf("Deletion test 0: Insertions and replaces with deletes\n");

        /* Insert specified keys */
        int insert, i;
        int keys[] = { 5, 12, 11, 19 };
        int *data_ptr = NULL;

        for(i = 0; i < 4; i++) {
            data_ptr = (int *) malloc(sizeof(int));
            *data_ptr = keys[i];
            insert = table_insert(T, keys[i], data_ptr);
            printf("Key %d inserted.\n", keys[i]);
            assert(insert == 0);
        }

        /* Print table */
        printf("Table after construction:\n");
        table_debug_print(T);

        /* Delete specified keys */
        data_ptr = table_delete(T, 5);
        if(data_ptr != NULL) {
            printf("Key 5 deleted.\n");
            free(data_ptr);
        } else printf("Key 5 not found in table.\n");
        data_ptr = table_delete(T, 8);
        if(data_ptr != NULL) {
            printf("Key 8 deleted.\n");
            free(data_ptr);
        } else printf("Key 8 not found in table.\n");
        data_ptr = table_delete(T, 12);
        if(data_ptr != NULL) {
            printf("Key 12 deleted.\n");
            free(data_ptr);
        } else printf("Key 12 not found in table.\n");

        /* Print table */
        printf("Table after deletes:\n");
        table_debug_print(T);

        /* Insert last two keys */
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = 19;
        insert = table_insert(T, 19, data_ptr);
        if(insert == 0) printf("Key 19 inserted.\n");
        else if(insert == 1) printf("Key 19 replaced.\n");
        else {
            printf("Key 19 not inserted.\n");
            free(data_ptr);
        }
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = 26;
        insert = table_insert(T, 26, data_ptr);
        if(insert == 0) printf("Key 26 inserted.\n");
        else if(insert == 1) printf("Key 26 replaced.\n");
        else {
            printf("Key 26 not inserted.\n");
            free(data_ptr);
        }

        /* Print table */
        printf("Final Table:\n");
        table_debug_print(T);
        

        /* Determine if test passed or failed and print to terminal */
        int count = 0;
        for(i = 0; i < table_size; i++) {
            if(table_peek(T, i) == 19) count++;
        }
        if(count <= 1 && table_peek(T, 5) == 26) {
            printf("19 in table once and 26 in position ");
            printf("5 - deletion test 0 passed!\n");
        } else { 
            printf("Either 19 in table multiple times or 26 not in position 5 - ");
            printf("deletion test 0 failed!\n");
        }
    } else {
        printf("Deletion test 1: Searching table with no empty keys\n");

        /* Insert specified keys */
        int insert, i;
        int keys[] = { 7, 8, 9, 10, 11, 12 };
        int *data_ptr = NULL;

        for(i = 0; i < 6; i++) {
            data_ptr = (int *) malloc(sizeof(int));
            *data_ptr = keys[i];
            insert = table_insert(T, keys[i], data_ptr);
            printf("Key %d inserted.\n", keys[i]);
            assert(insert == 0);
        }

        /* Print table */
        printf("Table after construction:\n");
        table_debug_print(T);

        /* Delete specified keys */
        data_ptr = table_delete(T, 7);
        if(data_ptr != NULL) {
            printf("Key 7 deleted.\n");
            free(data_ptr);
        } else printf("Key 7 not found in table.\n");
        data_ptr = table_delete(T, 8);
        if(data_ptr != NULL) {
            printf("Key 8 deleted.\n");
            free(data_ptr);
        } else printf("Key 8 not found in table.\n");
        data_ptr = table_delete(T, 9);
        if(data_ptr != NULL) {
            printf("Key 9 deleted.\n");
            free(data_ptr);
        } else printf("Key 9 not found in table.\n");
        data_ptr = table_delete(T, 10);
        if(data_ptr != NULL) {
            printf("Key 10 deleted.\n");
            free(data_ptr);
        } else printf("Key 10 not found in table.\n");

        /* Print table */
        printf("Table after deletes:\n");
        table_debug_print(T);

        /* Insert last two keys */
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = 13;
        insert = table_insert(T, 13, data_ptr);
        if(insert == 0) printf("Key 13 inserted.\n");
        else if(insert == 1) printf("Key 13 replaced.\n");
        else {
            printf("Key 13 not inserted.\n");
            free(data_ptr);
        }
        data_ptr = (int *) malloc(sizeof(int));
        *data_ptr = 14;
        insert = table_insert(T, 14, data_ptr);
        if(insert == 0) printf("Key 14 inserted.\n");
        else if(insert == 1) printf("Key 14 replaced.\n");
        else {
            printf("Key 14 not inserted.\n");
            free(data_ptr);
        }

        /* Print table */
        printf("Final Table:\n");
        table_debug_print(T);
        

        /* Determine if test passed or failed and print to terminal */
        if(table_retrieve(T, 16) == NULL) printf("16 not found - deletion test 1 passed!\n");
        else printf("16 found - deletion test 1 failed!\n");
    }

    /* Destruct table */
    table_destruct(T);

    printf("----- End of deletion test -----\n\n");
}

/* build a table with random keys.  The keys are generated with a uniform
 * distribution.  
 */
int build_random(table_t *T, int table_size, int num_addr)
{
    hashkey_t key;
    int i, range, code;
    int probes = 0;
    int *ip;
    range = MAXID - MINID + 1;
    for (i = 0; i < num_addr; i++) {
        key = (hashkey_t) (drand48() * range) + MINID;
        assert(MINID <= key && key <= MAXID);
        ip = (int *) malloc(sizeof(int));
        *ip = key;
        code = table_insert(T, key, ip);
        if (code == 1) {
            i--;   // since does not increase size of table
            // replaced.  The chances should be very small
            printf("during random build generated duplicate key (%u) on trial (%d)\n", key, i);
            printf("this should be unlikely: if see more than a few you have a problem\n");
        }
        else if (code != 0) {
            printf("build of random table failed code (%d) index (%d) key (%u)\n",
                    code, i, key);
            exit(2);
        }
        probes += table_stats(T);
    }
    return probes;
}

/* build a table with sequential keys.  The starting address is random.  The
 * keys are are in adjacent table locations.
 */
int build_seq(table_t *T, int table_size, int num_addr)
{
    hashkey_t key;
    int i, range, starting, code;
    int *ip;
    int probes = 0;
    range = MAXID - MINID + 1;
    starting = (int) (drand48() * range) + MINID;
    if (starting >= MAXID - table_size)
        starting -= table_size;
    for (i = starting; i < starting + num_addr; i++) {
        assert(MINID <= i && i <= MAXID);
        key = i;
        ip = (int *) malloc(sizeof(int));
        *ip = i;
        code = table_insert(T, key, ip);
        if (code != 0) {
            printf("build of sequential table failed code (%d) index (%d) key (%u)\n",
                    code, i - starting, key);
            exit(3);
        }
        probes += table_stats(T);
    }
    return probes;
}

/* build a table with folded keys.  The starting address is random.  The first
 * set of keys are sequential, and the second set hashes to the same table
 * locations as the first set.
 */
int build_fold(table_t *T, int table_size, int num_addr)
{
    int i, range, starting, code;
    int probes = 0;
    int *ip;
    range = MAXID - MINID + 1;
    starting = (int) (drand48() * range) + MINID;
    if (starting <= MINID + table_size)
        starting += table_size;
    if (starting >= MAXID - table_size)
        starting -= table_size;
    for (i = starting; i > starting - num_addr/2; i--) {
        assert(MINID <= i && i <= MAXID);
        ip = (int *) malloc(sizeof(int));
        *ip = i;
        code = table_insert(T, i, ip);
        if (code != 0) {
            printf("build of first phase of folded table failed code (%d) index (%d) key (%d)\n",
                    code, i - starting, i);
            exit(4);
        }
        probes += table_stats(T);
    }
    for (i = starting + table_size; i > starting + table_size - (num_addr+1)/2; i--) {
        assert(MINID <= i && i <= MAXID);
        ip = (int *) malloc(sizeof(int));
        *ip = i;
        code = table_insert(T, i, ip);
        if (code != 0) {
            printf("build of second phase of folded table failed code (%d) index (%d) key (%d)\n",
                    code, i - starting, i);
            exit(5);
        }
        probes += table_stats(T);
    }
    return probes;
}

/* build a table with worst keys.  Insert keys that hash to the same table
 * location.  Protects against invalid keys by wrapping around if the total
 * number of addresses times the table size is large.
 */
int build_worst(table_t *T, int table_size, int num_addr)
{
    hashkey_t key = MAXID;
    int i, batches = 0, code;
    int probes = 0;
    int *ip;
    for (i = 0; i < num_addr; i++) {
        assert(MINID <= key && key <= MAXID);
        ip = (int *) malloc(sizeof(int));
        *ip = key;
        code = table_insert(T, key, ip);
        if (code != 0) {
            printf("build of worst table failed: code (%d) index (%d) key (%u) batch (%d)\n",
                    code, i, key, batches);
            exit(6);
        }
        if (key < MINID + table_size) {
            batches++;
            printf("batch %d\n", batches);
            key = MAXID - batches;
        }
        else
            key -= table_size;
        probes += table_stats(T);
    }
    return probes;
}

/* return first prime number at number or greater
 *
 * There is at least one prime p such that n < p < 2n
 * for n>=25, n < p < 1.2n
 */
int find_first_prime(int number)
{
    int i, foundfactor;
    double upper;
    assert(number > 1);
    // if even move to next odd
    if (number % 2 == 0)
        number++;
    do {
        foundfactor = 0;      // assume number is prime
        upper = sqrt(number);
        for (i = 3; i < upper + 1; i += 2)
            if (number % i == 0) {
                foundfactor = 1;
                number += 2;  // only test odds
                break;
            }
    } while (foundfactor);
    return number;
}


/* print performance evaulation formulas from Standish pg. 479 and pg 484
 *
 * Added additional formulas for linear probing and sequential, folded, and
 * worst addressing.  Also, for quadratic with worst addressing since it
 * behaves the same as linear in this case.  Formulas for the other cases
 * are unknown.
 */
void performanceFormulas(double load_factor)
{
    int n = TableSize * load_factor;
    if (TableType == RAND) {
        if (ProbeDec == LINEAR) {
            printf("--- Linear probe sequence performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    0.5 * (1.0 + 1.0/(1.0 - load_factor)));
            printf("    Expected probes for unsuccessful search %g\n",
                    0.5 * (1.0 + pow(1.0/(1.0 - load_factor),2)));
        }
        else if (ProbeDec == DOUBLE) {
            printf("--- Double hashing performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    (1.0/load_factor) * log(1.0/(1.0 - load_factor)));
            printf("    Expected probes for unsuccessful search %g\n",
                    1.0/(1.0 - load_factor));
        }
        else if (ProbeDec == QUAD) {
            printf("--- Quadratic probe sequence performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    1.0 - log(1.0 - load_factor) - load_factor/2.0);
            printf("    Expected probes for unsuccessful search %g\n",
                    1.0/(1.0 - load_factor) - load_factor - log(1.0 - load_factor));
        }
        else if (ProbeDec == CHAIN) {
            printf("--- Separate chaining performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    1.0 + 0.5 * load_factor);
            printf("    Expected probes for unsuccessful search %g\n", 
                    load_factor);
        }
    }
    else if (TableType == SEQ) {
        if (ProbeDec == LINEAR) {
            printf("--- Linear probe sequence performance formulas ---\n");
            printf("    Expected probes for successful search 1\n");
            printf("    Expected probes for unsuccessful search %g\n",
                    n * load_factor / 2.0 + load_factor/2.0 + 1);
        }
    }
    else if (TableType == FOLD) {
        if (ProbeDec == LINEAR) {
            printf("--- Linear probe sequence performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    n / 4.0 + 1);
            printf("    Expected probes for unsuccessful search %g\n",
                    n * load_factor / 2.0 + load_factor/2.0 + 1);
        }
    }
    else if (TableType == WORST) {
        if (ProbeDec == LINEAR) {
            printf("--- Linear probe sequence performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    n / 2.0 + 0.5);
            printf("    Expected probes for unsuccessful search %g\n",
                    n * load_factor / 2.0 + load_factor/2.0 + 1);
        }
        else if (ProbeDec == QUAD) {
            printf("--- Quadratic probe sequence performance formulas ---\n");
            printf("    Expected probes for successful search %g\n",
                    n / 2.0 + 0.5);
        }
    }
}

/* read in command line arguments and store in global variables for easy
 * access by other functions.
 */
void getCommandLine(int argc, char **argv)
{
    /* optopt--if an unknown option character is found
     * optind--index of next element in argv 
     * optarg--argument for option that requires argument 
     * "x:" colon after x means argument required
     */
    int c;
    int index;

    while ((c = getopt(argc, argv, "m:a:h:i:t:s:ou:d:erbv")) != -1)
        switch(c) {
            case 'm': TableSize = atoi(optarg);          break;
            case 'a': LoadFactor = atof(optarg);         break;
            case 's': Seed = atoi(optarg);               break;
            case 't': Trials = atoi(optarg);             break;
            case 'v': Verbose = TRUE;                    break;
            case 'e': EquilibriumTest = TRUE;            break;
            case 'r': RetrieveTest = TRUE;               break;
            case 'b': RehashTest = TRUE;                 break;
            case 'o': Off = TRUE;                        break;
            case 'u': UnitNumber = atoi(optarg);     
                      if(UnitNumber != 0 && UnitNumber != 1 && UnitNumber != 2) {
                          fprintf(stderr,"invalid unit driver number. Must be 0-2.\n");
                          exit(1);
                      }
                      break;
            case 'd': DeletionNumber = atoi(optarg);     
                      if(DeletionNumber != 0 && DeletionNumber != 1) {
                          fprintf(stderr,"invalid deletion test number. Must be 0 or 1.\n");
                          exit(1);
                      }
                      break;
            case 'h':
                      if (strcmp(optarg, "linear") == 0)
                          ProbeDec = LINEAR;
                      else if (strcmp(optarg, "double") == 0)
                          ProbeDec = DOUBLE;
                      else if (strcmp(optarg, "quad") == 0)
                          ProbeDec = QUAD;
                      else if (strcmp(optarg, "chain") == 0)
                          ProbeDec = CHAIN;
                      else {
                          fprintf(stderr, "invalid type of probing decrement: %s\n", optarg);
                          fprintf(stderr, "must be {linear | double | quad}\n");
                          exit(1);
                      }
                      break;
            case 'i':
                      if (strcmp(optarg, "rand") == 0)
                          TableType = RAND;
                      else if (strcmp(optarg, "seq") == 0)
                          TableType = SEQ;
                      else if (strcmp(optarg, "fold") == 0)
                          TableType = FOLD;
                      else if (strcmp(optarg, "worst") == 0)
                          TableType = WORST;
                      else {
                          fprintf(stderr, "invalid type of address generation: %s\n", optarg);
                          fprintf(stderr, "must be {rand | seq | fold | worst}\n");
                          exit(1);
                      }
                      break;
            case '?':
                      if (isprint(optopt))
                          fprintf(stderr, "Unknown option %c.\n", optopt);
                      else
                          fprintf(stderr, "Unknown option character `\\x%x'.\n", optopt);
            default:
                      printCommandLine();
                      exit(1);
        }
    for (index = optind; index < argc; index++)
        printf("Non-option argument %s\n", argv[index]);
}

void printCommandLine(void)
{
    printf("Lab7 command line options\n");
    printf("Note: See lab7.c and table.c for documentation on each flag\n\n");
    printf("General options ---------\n");
    printf("  -m 11     table size\n");
    printf("  -a 0.9    load factor\n");
    printf("  -h linear|double|quad\n");
    printf("            Type of probing decrement\n");
    printf("  -r        run retrieve test driver \n");
    printf("  -b        run basic test driver \n");
    printf("  -u 0|1|2  run unit driver specified by opt number\n");
    printf("  -d 0|1    run deletion driver test 0 or 1\n");
    printf("  -e        run equilibrium test driver\n");
    printf("  -i rand|seq|fold|worst\n");
    printf("            type of keys for retrieve test driver \n");
    printf("  -o        disable command line options printout\n");
    printf("\nOptions for test driver ---------\n");
    printf("  -t 50000  number of trials in drivers\n");
    printf("  -v        turn on verbose prints (default off)\n");
    printf("  -s 26214  seed for random number generator\n");
}

/* vi:set ts=8 sts=4 sw=4 et: */
