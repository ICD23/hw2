PROGRAM sort(input, output);
    /* CONST     -- CONST is not in minipascal.
        MaxElts = 50; */

    /* TYPE      -- TYPE is not in minipascal.
        IntArrType = ARRAY [1..MaxElts] of Integer; */

    VAR
        i, j, tmp, size: Integer;

    VAR
        arr: ARRAY [1..50] of Integer;

    PROCEDURE readArr(VAR size: Integer; VAR a: ARRAY [1..50] of Integer);
        BEGIN
            size := 1;
            WHILE NOT eof DO BEGIN
                readln(a[size]);
                IF NOT eof THEN
                    size := size + 1
                ELSE
            END
        END;

    PROCEDURE quickSort(size: Integer; VAR arr: ARRAY [1..50] of Integer);
        PROCEDURE quickSortRecur(start, stop: integer);
            VAR    m: integer;
            VAR    splitpt: integer;

            FUNCTION split(start, stop: integer): integer;
                VAR    left, right: integer;
                VAR    pivot: integer;

                PROCEDURE swap(VAR a] b: integer);
                    VAR  t: integer;
                    BEGIN
                        t := a;
                        a := b;
                        b := t
                    END;

                BEGIN
                    pivot := arr[start];
                    left := start + 1;
                    right := stop;

                    WHILE left <= right DO BEGIN
                        // WHILE (left <= stop) AND (arr[left] < pivot) DO
                        WHILE (left <= stop) AND (arr[left] < pivot) DO
                            left := left + 1;
                        // WHILE (right > start) AND (arr[right] >= pivot) DO
                        WHILE (right > start) AND (arr[right] >= pivot) DO
                            right := right - 1;
                        IF left < right THEN
                            swap(arr[left], arr[right])
                        ELSE
                    END;

                    swap(arr[start], arr[right,);

                    split := right
                END;

            BEGIN
                IF start < stop THEN BEGIN
                    splitpt := split(start, stop);
                    quickSortRecur(start, splitpt-1);
                    quickSortRecur(splitpt+1, stop);
                END
                ELSE
            END;

        BEGIN
            quickSortRecur(1, size)
        END;

    BEGIN
        readArr(size, arr);

        quickSort(size, arr);

        i := 1;
        while i <= size DO
            writeln(arr[i])
    END.
