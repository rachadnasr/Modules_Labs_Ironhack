create view v_author_sales as (
select pa.au_id
, sum(ps.qty) as sales_qty -- lets also bring through sales_qty
, sum(pt.price * ps.qty * (pt.royalty / 100) * (pta.royaltyper / 100)) as author_sale_amount -- title price * sales quantity * royalty per author * royalty per author : summed to create gain through sales
from ppub.authors pa
left join ppub.titleauthor pta on pa.au_id = pta.au_id
left join ppub.titles pt on pta.title_id = pt.title_id
left join ppub.sales ps on ps.title_id = pt.title_id
group by 1);

create view v_author_advance as (
select pa.au_id, concat(pa.au_fname, " ", pa.au_lname) as au_name
, sum((pta.royaltyper / 100) * pt.advance) as author_advance_amount  -- royaltyper(author) is a percentage in integer format so we divide by 100 and multiply by the advance to get that authors share of the advance, we sum to total these advances
from ppub.authors pa
left join ppub.titleauthor pta on pa.au_id = pta.au_id
left join ppub.titles pt on pta.title_id = pt.title_id
group by 1, 2);