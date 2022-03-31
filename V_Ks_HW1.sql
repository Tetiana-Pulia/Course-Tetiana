/*1.	 1. Вывести все поля и все строки..*/
select * from qa_users;

/*2. Вывести всех студентов в таблице */
select username from qa_users;

/*3. Âûâåñòè òîëüêî Id ïîëüçîâàòåëåé */
select user_id from qa_users;

/*4. Âûâåñòè òîëüêî èìÿ ïîëüçîâàòåëåé */
select username from qa_users;

/*5. Âûâåñòè òîëüêî email ïîëüçîâàòåëåé */
select email from qa_users;

/*6. Âûâåñòè èìÿ è email ïîëüçîâàòåëåé */
select username,email from qa_users;

/*7. Âûâåñòè id, èìÿ, email è äàòó ñîçäàíèÿ ïîëüçîâàòåëåé */
select user_id, username, email, created_on from qa_users;

/*8. Âûâåñòè ïîëüçîâàòåëåé ãäå password 12333 */
select username from qa_users
where password = '12333';

/*9. Âûâåñòè ïîëüçîâàòåëåé êîòîðûå áûëè ñîçäàíû 2021-03-26 00:00:00 */
select username from qa_users
where created_on = '2021-03-26 00:00:00';

/*10. Âûâåñòè ïîëüçîâàòåëåé ãäå â èìåíè åñòü ñëîâî Àííà */
select username from qa_users
where username like '%Anna%';

/*11. Âûâåñòè ïîëüçîâàòåëåé ãäå â èìåíè â êîíöå åñòü 8 */
select username from qa_users
where username like '%8';

/*12. Âûâåñòè ïîëüçîâàòåëåé ãäå â èìåíè â åñòü áóêâà à */
select username from qa_users
where username like '%a%';

--13. Âûâåñòè ïîëüçîâàòåëåé êîòîðûå áûëè ñîçäàíû 2021-07-12 00:00:00
select username from qa_users
where created_on = '2021-07-12 00:00:00';

--14. Âûâåñòè ïîëüçîâàòåëåé êîòîðûå áûëè ñîçäàíû 2021-07-12 00:00:00 è èìåþò ïàðîëü 1m313 
select username from qa_users
where created_on = '2021-07-12 00:00:00' 
and password = '1m313';

--15. Âûâåñòè ïîëüçîâàòåëåé êîòîðûå áûëè ñîçäàíû 2021-07-12 00:00:00 è ó êîòîðûõ â èìåíè åñòü ñëîâî Andrey 
select username from qa_users
where created_on = '2021-07-12 00:00:00'
and username like '%Andrey%';

--16. Âûâåñòè ïîëüçîâàòåëåé êîòîðûå áûëè ñîçäàíû 2021-07-12 00:00:00 è ó êîòîðûõ â èìåíè åñòü öèôðà 8
select username from qa_users
where created_on = '2021-07-12 00:00:00'
and username like '%8%';

--17. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id ðàâåí 10 
select username from qa_users
where user_id = 10;

--18. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id ðàâåí 53 
select username from qa_users
where user_id = 53;

--19. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id áîëüøå 40 
select username from qa_users
where user_id > 40;

--20. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id ìåíüøå 30 
select username from qa_users
where user_id < 30;

--21. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id ìåíüøå 27 èëè áîëüøå 88 
select username from qa_users
where user_id < 27 or user_id > 88;

--22. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id ìåíüøå ëèáî ðàâíî 37 
select username from qa_users
where user_id <= 37;

--23. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id áîëüøå ëèáî ðàâíî 37 
select username from qa_users
where user_id >= 37;

--24. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id áîëüøå 80 íî ìåíüøå 90 
select username from qa_users
where user_id > 80 and user_id < 90;

--25. Âûâåñòè ïîëüçîâàòåëÿ ó êîòîðûõ id ìåæäó 80 è 90 
select username from qa_users
where user_id between 80 and 90;

--26. Âûâåñòè ïîëüçîâàòåëåé ãäå password ðàâåí 12333, 1m313, 123313 
select username from qa_users
where password IN('12333', '1m313', '123313');

--27. Âûâåñòè ïîëüçîâàòåëåé ãäå created_on ðàâåí 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00 
select username from qa_users
where created_on IN('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

--28. Âûâåñòè ìèíèìàëüíûé id 
select min(user_id) as minimal_id from qa_users;

--29. Âûâåñòè ìàêñèìàëüíûé.
select max(user_id) as maximal_id from qa_users;

--30. Âûâåñòè êîëè÷åñòâî ïîëüçîâàòåëåé 
select count(username) from qa_users;

--31. Âûâåñòè id ïîëüçîâàòåëÿ, èìÿ, äàòó ñîçäàíèÿ ïîëüçîâàòåëÿ. Îòñîðòèðîâàòü ïî ïîðÿäêó âîçðàñòàíèÿ äàòû äîáàâëåíèÿ ïîëüçîâàòëåëÿ. 
select id, username, created_on from qa_users
order by created_on asc;

--32. Âûâåñòè id ïîëüçîâàòåëÿ, èìÿ, äàòó ñîçäàíèÿ ïîëüçîâàòåëÿ. Îòñîðòèðîâàòü ïî ïîðÿäêó óáûâàíèÿ äàòû äîáàâëåíèÿ ïîëüçîâàòëåëÿ.
select id, username, created_on from qa_users
order by created_on desc;