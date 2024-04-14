/* motion.pro, basic motion estimation algorithm with centroids
Copyright (C) 2015 Ryan Barker

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

The author may be reached at rcbarke@g.clemson.edu or mailing address
205 Quaker Rd. Mooresville, NC, 28117.
*/

/* Prototype:

printList(+ImRow)

Input:
- ImRow ([H|T]) is the row of the image to be printed.

Notes:
- Recursively prints each element.
- Contains placement correction for negative numbers.
- This predicate has a side effect.
*/
printList([]).
printList([H|T]) :-
    H < 0,
    write(H),
    write(' '), !,
    printList(T).
printList([H|T]) :-
    write(' '),
    write(H),
    write(' '),
    printList(T).

/* Prototype:

printListsofLists(+Image)

Input:
- Image ([H|T]) is the image to be printed.

Notes:
- Uses an auxiliary predicate.
- A supporting predicate for image display.
- Display the list-of-lists (image) by printing the image row by row.
- This predicate has a side effect.
*/
printListofLists([]).
printListofLists([H|T]) :-
    printList(H), nl,
    printListofLists(T).

/* Prototype:

printImage(+Image)

Input:
- Image is the image to be printed.

Notes:
- Uses two auxiliary predicates.
- A supporting predicate for image display.
- Display the list-of-lists (image) by printing the image row by row.
- The examples help visualization of this.
- This predicate has a side effect.
*/
printImage(Image) :-
    nl, printListofLists(Image), nl.



/* now work with the whole image */

/* Prototype:

diffImRow(+Im1Row,+Im2Row,-DiffRow)

Inputs:
- Im1Row ([H1|T1]) is a row of the image at t1.
- Im2Row ([H2|T2]) is a row of the image at t2. 
- DiffRow ([HD|TD]) is Im2Row-Im1Row (point-by-point subtraction)

Notes:
- Im1Row and Im2Row must have the same number of elements.
*/
diffImRow([], [], []).
diffImRow([H1|T1], [H2|T2], [HD|TD]) :-
    HD is H2 - H1,
    diffImRow(T1, T2, TD).

/* Prototype:

diffIm(+Image1,+Image2,-Diff)

Inputs:
- Image1 ([H1|T1]) is the image at t1.
- Image2 ([H2|T2]) is the image at t2. 
- Diff ([HD|TD]) is Image2-Image1 (point-by-point subtraction)

Notes:
- Image1 and Image2 must have the same dimensions 
  (The same number of rows (sublists) with each 
   sublist having the same number of elements).
*/
diffIm([], [], []).
diffIm([H1|T1], [H2|T2], [HD|TD]) :-
    diffImRow(H1, H2, HD),
    diffIm(T1, T2, TD).



/* Prototype:

rowhasMotion(+DiffImRow)

Inputs:
- DiffImRow ([HD|TD]) is a row of the difference image of
  image1 and image2.

Notes:
- Succeeds if this row of the difference image contains 
  motion (an element /= 0).
*/
rowhasMotion([]) :- fail.
rowhasMotion([HD|_]) :-
    HD \= 0, !.
rowhasMotion([_|TD]) :- 
    rowhasMotion(TD).

/* Prototype:

containsMotion(+DiffIm)

Inputs:
- DiffIm([HD|TD]) is the difference image of image1 and
  image2.

Notes:
- Succeeds if the difference (image) contains motion.

*/
containsMotion([]) :- fail.
containsMotion([HD|_]) :-
    rowhasMotion(HD), !.
containsMotion([_|TD]) :-
    containsMotion(TD).

/* Prototype:

isDiff(+Image1,+Image2)

Inputs:
- Image1 and Image2 are the respective images at t1 and t2.

Notes:
- Succeeds if the difference (image) of Image1 and Image2
  is not identically zero.
*/
isDiff(Image1, Image2) :-
    diffIm(Image1, Image2, DiffIm), 
    containsMotion(DiffIm).



/* Prototype:

rowmask(+Image1Row,+Image2Row,+DiffImRow,-I1maskedRow,-I2maskedRow)

Inputs:
- Image1Row, Image2Row and DiffImRow are corresponding rows of Image1,
  Image2 and DiffIm.
- I1maskedRow and I2maskedRow are the corresponding rows of I1masked 
  and I2masked.
- If the pixel difference = 0 for two corresponding elements of Image1Row 
  and Image2Row (i.e., the value of the difference image is zero) then 
  both corresponding masked values in I1maskedRow and I2maskedRow are 
  set to 0.
- Otherwise, I2maskedRow is Image2Row masked (passed thru) by positive 
  values of the difference image row and I1maskedRow is Image 1 masked (
  passed thru) by negative values of the difference image.

Notes:
- The examples help visualization of this.
*/
rowmask([],[],[],[],[]).
rowmask([H1|T1], [_|T2], [HD|TD], [H1M|T1M], [H2M|T2M]) :-
    HD < 0, 
    H1M is H1, H2M is 0, !,
    rowmask(T1, T2, TD, T1M, T2M).
rowmask([_|T1], [H2|T2], [HD|TD], [H1M|T1M], [H2M|T2M]) :-
    HD > 0,
    H1M is 0, H2M is H2, !,
    rowmask(T1, T2, TD, T1M, T2M).
rowmask([_|T1], [_|T2], [_|TD], [H1M|T1M], [H2M|T2M]) :-
    H1M is 0, H2M is 0, 
    rowmask(T1, T2, TD, T1M, T2M).



/* Prototype:

mask(+Image1,+Image2,+DiffIm,-I1masked,-I2masked)

Inputs:
- Image1 ([H1|T1]), Image2 ([H2|T2]) and DiffIm ([HD|TD]) are described above.
- If the pixel difference = 0 for two corresponding elements of Image1 
  and Image2 (i.e., the value of the difference image is zero at this 
  location) then both corresponding masked values in I1masked and
  I2masked are set to 0. 
- Otherwise, I2masked is Image 2 masked (passed thru) by positive values 
  of the difference image and I1masked is Image 1 masked (passed thru) 
  by negative values.

Notes:
- This is different from ocaml, where 2 functions were used.
- CONSIDER DEVELOPMENT OF PREDICATE rowmask FIRST!
- The examples help visualization of this.
*/
mask([], [], [], [], []).
mask([H1|T1], [H2|T2], [HD|TD], [H1M|T1M], [H2M|T2M]) :- 
    rowmask(H1, H2, HD, H1M, H2M), 
    mask(T1, T2, TD, T1M, T2M).


/*
Prototype:

sumImRow(+ImRow, -S)

Inputs:
- ImRow is a row of the image to compute M{0,0} for.

Notes:
- Computes S = sum(ImRow).
 */
sumImRow([], S) :- S is 0.
sumImRow([HI|TI], S) :-
    sumImRow(TI, S1),
    S is S1 + HI.

/*
Prototype:

sumImage(+Image, -S)

Inputs:
- Image is the image to compute M{0,0} for (usually masked). 

Notes:
- Computes S = sum(image).
 */
sumImage([], S) :- S is 0.
sumImage([HI|TI], S) :-
    sumImage(TI, S1),
    sumImRow(HI, SRow),
    S is SRow + S1.



/*
Prototype:

centImRowbyRow(+ImRow, +J, -CIR)

Inputs:
- ImRow is a row of the image to compute M{0,1} for.
- J is the column index of each element in ImRow.

Notes:
- Computes CIR = sum(J*f(i,j)) for ImRow.
 */
centImRowbyRow([], _, CIR) :- CIR is 0.
centImRowbyRow([HI|TI], J, CIR) :-
    centImRowbyRow(TI, J + 1, CIR1),
    CIR is CIR1 + J*HI.

/*
Prototype:

centImRow(+Image,+Start_j,-CIR)

Inputs:
- Image ([HI|TI]) is a (usually masked, in our algorithm) image
- Start_j is the starting column index 
- CIR is the value of M{0,1} of input image (assumes predicate succeeds)

Notes:
- Both centImCol and centImRow actually process their input images. 
  row-by-row (what varies is the multiplier of each row element).
- centImRow: CIR=sum (row element * column index) over all rows.
- centImCol: CIC=sum (row element * row index) over all rows.
- Both centImRow and centImCol start with 2nd argument bound to value 1,
  and are applicable to any image. However, in SDE 3 they are used in the motion
  estimation algorithm with the masked images.
*/
centImRow([], _, CIR) :- CIR is 0.
centImRow([HI|TI], Start_j, CIR) :-
    centImRow(TI, Start_j, CIR1),
    centImRowbyRow(HI, Start_j, CIRRow),
    CIR is CIRRow + CIR1.



/*
Prototype:

centImColbyRow(+ImRow, +I, -CIC)

Inputs:
- ImRow is a row of the image to compute M{1,0} for.
- I is the row index of each element in ImRow.

Notes:
- Computes CIC = sum(I*f(i,j)) for ImRow.
 */
centImColbyRow([], _, CIC) :- CIC is 0.
centImColbyRow([HI|TI], I, CIC) :-
    centImColbyRow(TI, I, CIC1),
    CIC is CIC1 + I*HI.



/*
Prototype:

centImCol(+Image,+Start_i,-CIC)

Inputs:
- Image ([HI|TI]) is a (usually masked, in our algorithm) image.
- Start_i is the starting row index.
- (upon success of predicate), CIC= M{1,0} of input image
*/
centImCol([], _, CIC) :- CIC is 0.
centImCol([HI|TI], Start_i, CIC) :-
    centImCol(TI, Start_i + 1, CIC1),
    centImColbyRow(HI, Start_i, CICRow),
    CIC is CICRow + CIC1.



/* Prototype:

motion(+Image1,+Image2,-Moti,-Motj)

Inputs:
- Image1 ([H1|T1]) and Image2 ([H2|T2]) as above.
- Moti is motion component (offset) in i or row direction.
- Motj is motion component (offset) in j or column direction.

Notes:
- If there is no motion, the predicate *succeeds* but prints:
  ’***** No Motion in This Case *****’
- Because of printing, this predicate may have a side effect.
- The examples help visualization of this.
*/
motion(Image1, Image2, Moti, Motj) :- 
    isDiff(Image1, Image2),
    diffIm(Image1, Image2, DiffIm),
    mask(Image1, Image2, DiffIm, I1M, I2M),
    sumImage(I1M, S1),
    centImRow(I1M, 1, CIR1),
    centImCol(I1M, 1, CIC1),
    sumImage(I2M, S2),
    centImRow(I2M, 1, CIR2),
    centImCol(I2M, 1, CIC2),
    Moti is CIC2/S2 - CIC1/S1,
    Motj is CIR2/S2 - CIR1/S1, !.
motion(_, _, _, _) :-
    nl,
    write('***** No Motion in This Case *****'),
    nl.
