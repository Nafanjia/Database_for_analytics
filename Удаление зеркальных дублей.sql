select a, b
from
(	select a, b, row_number() over(partition by a2, b2 order by a, b) num
	from
	(	select a, b, case when a<b then a else b end a2,
			case when a<b then b else a end b2
		from
		(	 select t.f_p as a, t.s_p as b FROM two t
		) t
	) t
) t
where num > 1