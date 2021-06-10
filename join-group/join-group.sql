/*********************************************************

            QUERY CON GROUP BY

*********************************************************/

/*   ES 1   */
/* Conta gli ospiti raggruppandoli per anno di nascita */

SELECT COUNT(YEAR(`date_of_birth`)), YEAR(`date_of_birth`) AS `birth_year`
FROM `ospiti`	 
GROUP BY YEAR(`date_of_birth`)
ORDER BY `birth_year` DESC;


/*   ES 2   */
/* Somma i prezzi dei pagamenti raggruppandoli per status */

SELECT `status`, COUNT(`status`) AS `total_transactions`, SUM(`price`) AS `total_price`
FROM `pagamenti`
GROUP BY `status`;


/*   ES 3   */
/* Conta quante volte è stata prenotata ogni stanza */

SELECT `stanza_id`, COUNT(`stanza_id`) AS `prenotato`
FROM `prenotazioni`
GROUP BY `stanza_id`;


/*   ES 4   */
/* Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti */



/*   ES 5   */
/* Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!) */




/*********************************************************

            QUERY CON JOIN

*********************************************************/

/*    ES 1   */
/*  Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?  */

SELECT COUNT(`ospite_id`) AS `num_prenotazioni`, `ospite_id`, `name`, `lastname`
FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
 ON `ospite_id` = `ospiti`.id
GROUP BY `ospite_id`  
HAVING `num_prenotazioni` > 2
ORDER BY `num_prenotazioni`  DESC;



/*    ES 2   */
/*  Stampare tutti gli ospiti per ogni prenotazione  */

SELECT `prenotazione_id`, `ospite_id`, `name`, `lastname`
FROM `prenotazioni_has_ospiti`
JOIN `ospiti`
 ON `ospite_id` = `ospiti`.id



/*    ES 3   */
/*  Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018  */

SELECT `prenotazione_id`, `prenotazioni`.`created_at`, `name`, `lastname`, `price`, `ospite_id` 
FROM `prenotazioni`
JOIN `pagamenti`
	ON `prenotazione_id` = `prenotazioni`.id
JOIN `paganti`
	ON `pagante_id` = `paganti`.id
WHERE YEAR(`prenotazioni`.`created_at`) = "2018"
AND MONTH(`prenotazioni`.`created_at`) = "05";