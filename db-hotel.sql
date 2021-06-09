/* ES 1 */
/* Seleziona tutti gli ospiti che sono stati identificati con la carta di identità */

SELECT * 
FROM `ospiti` 	 
WHERE `document_type`="CI";


/* ES 2 */
/* Seleziona tutti gli ospiti che sono nati dopo il 1988 */

SELECT * 
FROM `ospiti` 	 
WHERE YEAR(`date_of_birth`)>1988;


/* ES 3 */
/* Seleziona tutti gli ospiti che hanno più di 20 anni (al momento dell’esecuzione della query) */

SELECT *
FROM `ospiti`
WHERE YEAR(`date_of_birth`) < YEAR(CURRENT_DATE()) - 20;


/* ES 4 */
/* Seleziona tutti gli ospiti il cui nome inizia con la D */

SELECT *
FROM `ospiti`
WHERE `name` LIKE "D%";


/* ES 5 */
/* Calcola il totale incassato degli ordini accepted */

SELECT SUM(`price`)
FROM `pagamenti`
WHERE `status` = "accepted";

-- 4164.00 


/* ES 6 */
/* Qual è il prezzo massimo pagato? */

SELECT MAX(`price`)
FROM `pagamenti`
WHERE `status` = "accepted";

-- 869.00



/* ES 7 */
/* Seleziona gli ospiti riconosciuti con patente e nati nel 1975 */


SELECT * 
FROM `ospiti` 	 
WHERE `document_type` LIKE "Driver%"
AND YEAR(`date_of_birth`)=1975;