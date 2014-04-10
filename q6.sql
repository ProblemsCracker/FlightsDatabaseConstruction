select xt.resv_TD, sum(xt.resv_Num) as total_of_215
from FLTRESV F, xmltable('$p/All_requests/Request'
                          passing F.request as "p"
                          columns agent_name varchar2(30) path 'Agent_name',
                                  req_date date path 'Request_date',
                                  resv_F number path 'Reservation/Flight',
                                  resv_TD date path 'Reservation/Travel_date',
                                  resv_Num number path 'Reservation/Num_of_seats') xt
where xt.resv_F = 215
group by xt.resv_TD;